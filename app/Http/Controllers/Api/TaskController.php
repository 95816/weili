<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/15
 * Time: 13:26
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\TaskException;
use App\Http\Controllers\Controller;
use App\Http\Enum\Operate;
use App\Http\Enum\TaskType;
use App\Models\Admin\AppInfo;
use App\Models\Admin\CoinsLog;
use App\Models\Admin\InviteLog;
use App\Models\Admin\User;
use App\Models\Admin\UserTask;
use App\Models\API\Task;
use App\Service\Token;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

header("Content-type: text/html; charset=utf-8");
class TaskController extends Controller
{
    /**
     * 做任务
     * @param $tid
     * @return string
     * @throws TaskException
     * @throws \App\Exceptions\TokenException
     */
    public function completeTask($tid, $mark = true, $uid = null, $app_id = null)
    {
        // 1. 获得任务类型
        // 2. 用户是否符合做任务条件
        // 3. 执行新增同时增加金币
        if ($mark) {
            $uid = Token::getCurrentTokenVar('uid');
            $app_id = Token::getCurrentTokenVar('app_id');
            $type = $this->getTaskType($tid);
            $this->checkStatus($type, $tid, $uid);
        }
        //通过检测插入数据库
        if ($this->insertTask($uid, $tid)) {
            //
            //第一步成功后检查此用户是否是被邀请用户
            $res = $this->checkIsInvited($uid, $app_id);
            if ($res != false) {
                //这里如果检测成功会返回一个数据信息示例:['coin'=>10000,'uid'=>1152,'num'=>1']
                //给这个用户加金币
                $this->addUserCoin($app_id, $res['invite_uid'], $res['coin']);
                //记录金币日志
                $this->recordCoinLog($app_id, $res['coin'], $res['invite_uid'], Operate::add, TaskType::Invite_type);
                //更新邀请日志表中的num
                $currentInviteInfo = InviteLog::where('invited_uid', $uid)
                    ->where('app_id', $app_id)
                    ->first();
                $currentInviteInfo->num = $res['num'] + 1;
                $currentInviteInfo->save();
            }
            return json_encode([
                'tid' => $tid,
                'msg' => 'success',
                'code' => 200,
            ]);
        } else {
            return json_encode([
                'tid' => $tid,
                'msg' => 'error',
                'code' => 401,
            ]);
        }
    }

    /**
     * 获取任务
     * @param Request $request
     * @return string
     * @throws \App\Exceptions\TokenException
     */
    public function getTaskByType(Request $request)
    {
        $count = empty($request->input('count')) ? 15 : $request->input('count');
        $type = empty($request->input('type')) ? '' : $request->input('type');
        //获取当前用户uid和app_id
        $app_id = Token::getCurrentTokenVar('app_id');
        $uid = Token::getCurrentTokenVar('uid');
        //根据app_id获取每日任务
        $tasks = Task::getTaskByType($type, $uid, $app_id, $count);
        return $tasks;
    }

    public function getTaskById($tid)
    {
        $data = \App\Models\Admin\Task::where('id', $tid)->where('status', 1)->get(['title', 'task_mark', 'button_title', 'reward_coin', 'description'])->toArray();
        if (!empty($data)) {
            echo json_encode($data[0], JSON_UNESCAPED_UNICODE);
        }
    }

    /**
     * 获得任务类型
     * @param $tid
     * @return mixed
     * @throws TaskException
     */
    private function getTaskType($tid)
    {
        $data = \App\Models\Admin\Task::find($tid);
        if (empty($data)) {
            throw new TaskException();
        } else {
            return $data->type;
        }
    }

    /**
     * 检测用户是否做过此任务
     * @param $type
     * @param $tid
     * @param $uid
     * @return bool
     * @throws TaskException
     */
    private function checkStatus($type, $tid, $uid)
    {
        $task = \App\Models\Admin\Task::find($tid);
        if ($task->status != 1) {
            throw new TaskException([
                'errorCode' => 10007,
                'msg' => '不符合规定的任务!',
                'code' => 401
            ]);
        }
        if ($type == TaskType::New_type) {
            $data = UserTask::where('uid', $uid)->where('tid', $tid)->get()->toArray();
            if ($data) {
                throw new TaskException([
                    'errorCode' => 20005,
                    'msg' => '亲,您已经做过新手任务了.老司机了!',
                    'code' => 401
                ]);
            }
        } elseif ($type == TaskType::Day_type) {
            $ling_time = strtotime(date('Ymd'));
            $data = UserTask::where('created_at', '>', $ling_time)->where('uid', $uid)->where('tid', $tid)->get()->toArray();
            if ($data) {
                throw new TaskException([
                    'errorCode' => 20006,
                    'msg' => '亲,您今天已经做过这个任务了!',
                    'code' => 401
                ]);
            }
        }
        return true;
    }

    /**
     * 写入数据库
     * @param $uid
     * @param $tid
     * @return bool
     * @throws \Exception
     */
    private function insertTask($uid, $tid)
    {
        DB::beginTransaction();
        try {
            $res['uid'] = $uid;
            $res['tid'] = $tid;
            $coin = \App\Models\Admin\Task::find($tid)->reward_coin;
            if (UserTask::create($res)) {
                //更新用户金币数量
                $app_id = Token::getCurrentTokenVar('app_id');
                $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->get()->toArray()[0];
                User::where('uid', $uid)->where('app_id', $app_id)->update(['coins' => $userInfo['coins'] + $coin]);
                //记录到金币日志
                //记录金币日志
                $this->recordCoinLog($app_id, $coin, $uid, Operate::add, TaskType::DoTask_type);
                DB::commit();
                return true;
            } else {
                throw new TaskException([
                    'errorCode' => 20010,
                    'msg' => 'OMG,做任务失败啦!',
                    'code' => 401
                ]);
            }
        } catch (\Exception $exception) {
            DB::rollBack();
            throw $exception;
        }
    }

    /**
     * 检测是否被邀请过
     * @param $uid
     * @param $app_id
     * @return bool
     */
    private function checkIsInvited($uid, $app_id)
    {
        //检查是否又被邀请过
        $checkIsInvited = InviteLog::where('invited_uid', $uid)
            ->where('app_id', $app_id)
            ->get()
            ->toArray();
        if (!empty($checkIsInvited)) {
            //返回数组
            $result = [];
            //今天获取的金币数是否超过200
            $todayCoinsLog = CoinsLog::where('app_id', $app_id)
                ->where('uid', $uid)
                ->where('operate', Operate::add)
                ->where('created_at', '>', strtotime(date("Y-m-d"), time()))
                ->get(['coin'])
                ->toArray();
            $todayUidCoins = 0;
            foreach ($todayCoinsLog as $key => $val) {
                $todayUidCoins += $val['coin'];
            }

            if ($todayUidCoins <= 200) {
                return false;
            }

            //如果有被邀请信息,检测是否超过30天.
            if (time() - $checkIsInvited[0]['created_at'] > 2592000) {
                return false;
            }

            //今天是否已经有过领取奖励

            if (strtotime(date("Y-m-d"), time() - $checkIsInvited[0]['updated_at']) <= 86400) {
                return false;
            }
            //是否领取次数已经超过奖励总次数
            $app_id = AppInfo::where('app_id', $app_id)->get(['id'])->toArray()[0];
            $inviteInfos = \App\Models\Admin\Invite::where('app_id', $app_id)->where('type', $checkIsInvited[0]['type'])->get()->toArray();
            if (!empty($inviteInfos)) {
                $invite_coin_arr = explode(',', $inviteInfos[0]['invite_coin_arr']);
                unset($invite_coin_arr[0]);//去掉第一个.是邀请第一的3000.不算在其中
                if ($checkIsInvited[0]['num'] > count($invite_coin_arr)) {
                    return false;
                } else {
                    //数组重新排序
                    $invite_coin_arr = array_values($invite_coin_arr);
                    $result['coin'] = $invite_coin_arr[$checkIsInvited[0]['num']];
                }
            }
            $result['id'] = $checkIsInvited[0]['id'];
            $result['num'] = $checkIsInvited[0]['num'];
            $result['invite_uid'] = $checkIsInvited[0]['invite_uid'];
            return $result;
        } else {
            return false;
        }
    }
}