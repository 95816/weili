<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/4
 * Time: 17:17
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Enum\AppKey;
use App\Http\Enum\Operate;
use App\Http\Enum\TaskType;
use App\Models\Admin\AppInfo;
use App\Models\Admin\InviteLog;
use App\Models\Admin\MachineRecord;
use App\Models\Admin\User;
use App\Models\Admin\UserTask;
use App\Models\API\Invite;
use App\Service\Token;
use App\Service\User as UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InviteController extends Controller
{

    /**
     * @param Request $request
     * @return string
     * @throws \App\Exceptions\TokenException
     */
    public function enterInviteCode(Request $request)
    {

        $inviteCode = $request->input('inviteCode');
        $machineCode = $request->input('machineCode');
        if (empty($inviteCode)) {
            $result = [
                'msg' => '邀请码不可以为空',
                'code' => '20001',
            ];
            echo json_encode($result);
            return;
        }
        //验证2步骤
        //1. 输入的被邀请码必须是存在的
        //2. 当前用户必须没被邀请过也就是没有被邀请码
        $uid = Token::getCurrentTokenVar('uid');
        $app_id = Token::getCurrentTokenVar('app_id');
        $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->first();

        if (empty($app_id)) {
            $result = [
                'msg' => '不存在的APP信息,请检查参数!',
                'code' => '401',
            ];
            echo json_encode($result);
            return;
        }
        $inviteUserInfo = User::where('invitation_code', $inviteCode)->where('app_id', $app_id)->get()->toArray();
        if (empty($inviteUserInfo)) {
            $result = [
                'msg' => '输入的邀请码不存在!',
                'code' => '20007',
            ];
            echo json_encode($result);
            return;

        }
        //检查是否又被邀请过
        $checkIsInvited = InviteLog::where('invited_uid', $uid)
            ->where('app_id', $app_id)
            ->get()
            ->toArray();
        //获取被邀请人的已邀请次数
        $inviteAllInfos = InviteLog::where('invite_uid', $inviteUserInfo['0']['uid'])
            ->where('app_id', $app_id)
            ->get()
            ->toArray();
        //时间有效期为30天
        if (!empty($inviteAllInfos) && (time() - $inviteAllInfos[0]['created_at']) > 2592000) {
            return;
        }

        if (!empty($userInfo->invited_code) && !empty($checkIsInvited)) {
            $result = [
                'msg' => '已是被邀请用户,不可重复被邀请!',
                'code' => '20003',
            ];
            echo json_encode($result);
            return;
        }
        if ($inviteUserInfo[0]['uid'] == $uid) {
            $result = [
                'msg' => '自己邀请自己,不要玩骚操作!',
                'code' => '20004',
            ];
            echo json_encode($result);
            return;
        }
        if (!empty($inviteUserInfo)) {
            //存在这个邀请码
            $updateData['invited_code'] = strtoupper($inviteCode);
            $updateData['invited_time'] = time();
            DB::beginTransaction();
            try {
                if ($userInfo->update($updateData)) {
                    //检测是否是第一次
                    if (count($inviteAllInfos) > 0) {
                        // 知道当前是第几次.获取这个app设置邀请的当前次数的金币数并且要知道是什么类型
                        $type = $inviteAllInfos[0]['type']; //是属于新下载类型还是已下载类型金币奖励区分;
                        //如果任务已经进行完了就不用继续执行.
                        $appid = AppInfo::where('app_id', $app_id)->get(['id'])->toArray()[0];
                        $inviteInfos = \App\Models\Admin\Invite::where('app_id', $appid['id'])->where('type', $type)->get()->toArray();
                        if (!empty($inviteInfos) && count($inviteAllInfos) >= count(explode(',', $inviteInfos[0]['invite_coin_arr']))) {
                            return;
                        }
                        $result = $this->handleProcess($app_id, $type, count($inviteAllInfos), $uid, $inviteUserInfo[0]['uid']);
                    } else {
                        // 知道首次邀请获取金币和首次额外奖励金币
                        //修改方案条件里面要加一个||查看上一次执行邀请日志里面的方案类型
                        if ($this->checkMachine($machineCode, $app_id)) {
                            //证明是第一次安装.按照第一套邀请奖励金币规则来
                            $result = $this->handleProcess($app_id, 1, count($inviteAllInfos), $uid, $inviteUserInfo[0]['uid']);
                        } else {
                            //证明不是第一次安装.按照第二套邀请奖励金币规则来
                            $result = $this->handleProcess($app_id, 2, count($inviteAllInfos), $uid, $inviteUserInfo[0]['uid']);
                        }
                    }
                    DB::commit();

                } else {
                    $result = [
                        'current_uid' => $uid,
                        'msg' => '绑定失败,请重新尝试!',
                        'code' => '400',
                    ];
                }
            } catch (\Exception $exception) {
                DB::rollBack();
                throw $exception;
            }

        } else {
            $result = [
                'msg' => '邀请码不存在!',
                'code' => '20002',
            ];
        }

        echo json_encode($result);
    }

    /**
     * 检测是否安装过APP
     * @param $machineCode
     * @param $app_id
     * @return bool
     */
    private function checkMachine($machineCode, $app_id)
    {
        $machineInfo = MachineRecord::where('machine_code', $machineCode)->where('app_id', $app_id)->get();

        //修改方案 查看数据表里面的num 是否等于1,1就是true大于1就是false
        if ($machineInfo->isNotEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    private function handleProcess($app_id, $type, $num, $uid, $invite_uid)
    {
        //第一次
        if ($app_id == AppKey::Tw_key) {
            //把id=3 的任务完成一下.
            $res['uid'] = $uid;
            $res['tid'] = 3;
            UserTask::create($res);
        }
        //邀请人和当前用户应该获得的金币数 (数组中2个值)
        $receiveCoinArr = Invite::getCoinByNum($app_id, $type, $num);


        $this->recordCoinLog($app_id, $receiveCoinArr['currentUserCoin'], $uid, Operate::add, TaskType::Invite_type);
        $this->addUserCoin($app_id, $uid, $receiveCoinArr['currentUserCoin']);
        //增加用户表的金币数量
        if ($num == 0) {
            //证明是第一次邀请
            //记录到邀请日志
            $this->recordInvite($app_id, $receiveCoinArr['currentUserCoin'] + $receiveCoinArr['first_extra_coin'], $uid, $invite_uid, $type);
            //记录金币日志
            $this->recordCoinLog($app_id, $receiveCoinArr['currentUserCoin'] + $receiveCoinArr['first_extra_coin'], $invite_uid, Operate::add, TaskType::Invite_type);
            $this->addUserCoin($app_id, $invite_uid, $receiveCoinArr['currentUserCoin'] + $receiveCoinArr['first_extra_coin']);
        } else {
            //记录到邀请日志
            $this->recordInvite($app_id, $receiveCoinArr['currentUserCoin'], $uid, $invite_uid, $type);
            //记录金币日志
            $this->recordCoinLog($app_id, $receiveCoinArr['currentUserCoin'], $invite_uid, Operate::add, TaskType::Invite_type);
            $this->addUserCoin($app_id, $invite_uid, $receiveCoinArr['currentUserCoin']);
        }


        /*if ($num == 0) {
            //第一次
            if ($app_id == AppKey::Tw_key) {
                //把id=3 的任务完成一下.
                $res['uid'] = $uid;
                $res['tid'] = 3;
                UserTask::create($res);
            }
            //邀请人和当前用户应该获得的金币数 (数组中2个值)
            $receiveCoinArr = Invite::getCoinByNum($app_id, $type, $num);
            //记录到邀请日志
            $this->recordInvite($app_id, $receiveCoinArr['inviteUserCoin'], $uid, $invite_uid, $type);
            //记录金币日志
            $this->recordCoinLog($app_id, $receiveCoinArr['inviteUserCoin'], $invite_uid, Operate::add, TaskType::Invite_type);
            $this->recordCoinLog($app_id, $receiveCoinArr['currentUserCoin'], $uid, Operate::add, TaskType::Invite_type);
            //增加用户表的金币数量
            $this->addUserCoin($app_id, $invite_uid, $receiveCoinArr['inviteUserCoin']);
            $this->addUserCoin($app_id, $uid, $receiveCoinArr['currentUserCoin']);
        } else {
            //不是第一次完成任务
            if ($app_id == AppKey::Tw_key) {
                $apiTask = new \App\Http\Controllers\Api\TaskController();
                $apiTask->completeTask('3', false, $uid);
            }
            //邀请人应该获得的金币数
            $receiveCoin = Invite::getCoinByNum($app_id, $type, $num);
            //记录到邀请日志
            $this->recordInvite($app_id, $receiveCoin, $uid, $invite_uid, $type);
            //记录金币日志
            $this->recordCoinLog($app_id, $receiveCoin, $invite_uid, Operate::add, TaskType::Invite_type);
            //增加用户表的金币数量
            $this->addUserCoin($app_id, $invite_uid, $receiveCoin);
        }*/
        $result = [
            'current_uid' => $uid,
            'msg' => '绑定成功!',
            'code' => '200',
        ];
        return $result;
    }

    /**
     * 记录邀请日志
     * @param $app_id
     * @param $receiveCoin
     * @param $uid
     * @param $invite_uid
     * @return bool
     */
    private function recordInvite($app_id, $receiveCoin, $uid, $invite_uid, $type)
    {
        if (InviteLog::create(['coin' => $receiveCoin, 'invite_uid' => $invite_uid, 'invited_uid' => $uid, 'app_id' => $app_id, 'type' => $type])) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 弹出输入邀请框
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     */
    public function enterPage(Request $request)
    {
        //获取真实的用户id
        $input = $request->all('get.');
        if (empty($input['token'])) {
            throw new UserException([
                'errorCode' => 20005,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        $userService = new UserService();
        $uid = $userService->getUID($input['uid']);
        if (empty($input['uid'])) {
            throw new UserException([
                'errorCode' => 20006,
                'code' => 403,
                'msg' => '必须在url中携带uid值!'
            ]);
        }

        $app_id = Token::getCurrentTokenVar('app_id', false, $input['token']);
        $firstData = Invite::getRewardByType($app_id, 1);
        if (!empty($firstData)){
            unset($firstData[0]);
        }
        $afterData = Invite::getRewardByType($app_id, 2);
        $invitation_code = User::where('uid', $uid)->get(['invitation_code'])->toArray()[0];
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        return view('Api.invite.page', ['invitationCode' => $invitation_code['invitation_code'], 'token' => $input['token'], 'is_show' => $input['is_show']
            , 'firstData' => $firstData
            , 'afterData' => $afterData
            , 'machineCode' => $input['machineCode']
            , 'appInfoData' => $appInfoData]);
    }
}