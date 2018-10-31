<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/11
 * Time: 16:00
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Enum\Operate;
use App\Http\Enum\TaskType;
use App\Models\Admin\AppInfo;
use App\Models\Admin\SignLog;
use App\Models\API\Task;
use App\Service\Token;
use App\Service\User as UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use think\Exception;

class SignController extends Controller
{
    /**
     * @param Request $request
     * @return string
     * @throws \App\Exceptions\TokenException
     */
    public function userSign(Request $request)
    {
        $token = $request->input('token');
        $uid = Token::getCurrentTokenVar('uid', false, $token);
        $app_id = Token::getCurrentTokenVar('app_id', false, $token);
        //获取奖励规则.计算总次数
        $signData = Task::getRewardByAppID($app_id);
        $userSignLog = SignLog::where('app_id', $app_id)->where('uid', $uid)->get()->toArray();
        DB::beginTransaction();

        try {
            if (empty($userSignLog)) {
                //如果直接没有数据,那么就是第一次签到
                $num = 0;
            } else {
                //检测今天是否已经签过
                if (!$this->checkSign($app_id, $uid)) {
                    //if (0) {
                    $result = [
                        'msg' => '您今天已经签到过了,请明天再来哦!',
                        'errorCode' => '20010',
                        'code' => 403
                    ];
                    echo json_encode($result);
                    return;
                }
                //检测上一次签到时间
                $this->checkSignTime($app_id, $uid);
                //如果有获取该用户的最近的一次签到记录中的总次数
                $num = $this->updateNum($app_id, $uid, $num = 1, true);
                if ($num == count($signData)) {
                    $num = 0;
                }
            }
            $coin = $this->getCoinByNum($app_id, $num);
            $this->handleProcess($app_id, $uid, $coin);

            //提交成功后要更新一次签到总次数
            $this->updateNum($app_id, $uid, $num + 1);
            $result = [
                'current_uid' => $uid,
                'msg' => '签到成功!',
                'coin' => $coin,
                'code' => '200',
                'num' => $num
            ];
            echo json_encode($result);
            DB::commit();
            return;
            //获取当前用户签到次数
        } catch (\Exception $exception) {
            DB::rollBack();
            throw $exception;
        }
    }

    /**
     * 获取当前次数对应的金币
     * @param $app_id
     * @param $num
     * @return mixed
     */
    private function getCoinByNum($app_id, $num)
    {
        $app_id = AppInfo::where('app_id', $app_id)->get(['id'])->toArray()[0];
        $signInfos = \App\Models\Admin\Sign::where('app_id', $app_id['id'])->get()->toArray();
        if (!empty($signInfos)) {
            $signInfos[0]['reward_coin'] = explode(',', $signInfos[0]['reward_coin']);
            $returnCoin = $signInfos[0]['reward_coin'][$num];
        } else {
            $result = [
                'msg' => '未设置签到奖励金币,请联系管理员!',
                'errorCode' => '20011',
                'code' => 403
            ];
            echo json_encode($result);
            return;
        }
        return $returnCoin;
    }

    private function handleProcess($app_id, $uid, $coin)
    {
        $this->recordSignLog($app_id, $uid, $coin);
        $this->recordCoinLog($app_id, $coin, $uid, Operate::add, TaskType::Sign_type);
        $this->addUserCoin($app_id, $uid, $coin);
    }

    private function recordSignLog($app_id, $uid, $coin)
    {
        if (!SignLog::create(['coin' => $coin, 'app_id' => $app_id, 'uid' => $uid])) {
            return false;
        }
    }

    /**
     * 更细签到次数
     * @param $app_id
     * @param $uid
     * @param $num
     * @param bool $mark
     * @return bool|mixed
     * @throws Exception
     */
    private function updateNum($app_id, $uid, $num, $mark = false)
    {
        //只获取最近一次的签到记录并修改为+1
        $recentSign = SignLog::where('app_id', $app_id)->where('uid', $uid)->orderBy('created_at', 'desc')->first();
        if ($mark) {
            if (empty($recentSign)) {
                return 0;
            } elseif (!empty($recentSign) && strtotime($recentSign->created_at) < strtotime(date("Y-m-d",strtotime("-1 day")))) {
                //如果昨天没签到那么应为0
                return 0;
            }
            return $recentSign->total_num;
        }
        if (!empty($recentSign)) {
            $recentSign->total_num = $num;
            if (!$recentSign->save()) {
                return false;
            }
        } else {
            throw new Exception();
        }
    }

    /**
     * 检测今天是否签到过
     * @param $app_id
     * @param $uid
     * @return bool
     */
    private function checkSign($app_id, $uid)
    {
        $todaySign = SignLog::where('app_id', $app_id)->where('uid', $uid)->where('created_at', '>', strtotime(date("Ymd")))->get();
        if ($todaySign->isEmpty()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 检测上一次签到时间
     * @param $app_id
     * @param $uid
     * @return bool
     */
    private function checkSignTime($app_id, $uid)
    {
        $recentSign = SignLog::where('app_id', $app_id)->where('uid', $uid)->orderBy('created_at', 'desc')->first();
        $last_day_time = strtotime(date('Ymd', strtotime('-1 day')));
        if (strtotime($recentSign->created_at) < $last_day_time) {
            $recentSign->total_num = 0;
            $recentSign->save();
        }
        return true;
    }

    /**
     * 签到界面
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     * @throws Exception
     */
    public function signPage(Request $request)
    {
        //获取真实的用户id
        $input = $request->all('get.');
        if (empty($input['token'])) {
            throw new UserException([
                'errorCode' => 20007,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        if (empty($input['uid'])) {
            throw new UserException([
                'errorCode' => 20008,
                'code' => 403,
                'msg' => '必须在url中携带uid值!'
            ]);
        }
        if (empty($input['machineCode'])) {
            throw new UserException([
                'errorCode' => 20008,
                'code' => 403,
                'msg' => '必须在url中携带机器码值!'
            ]);
        }
        //获取签到奖励金币
        $app_id = Token::getCurrentTokenVar('app_id', false, $input['token']);
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        $signData = Task::getRewardByAppID($app_id);
        //获取当前用户签到天数
        $userService = new UserService();
        $uid = $userService->getUID($input['uid']);
        $lastNum = $this->updateNum($app_id, $uid, 1, true);
        //获取当天是否已经签到完成
        $bool = $this->checkSign($app_id, $uid);
        return view('Api.sign.page', ['token' => $input['token'], 'uid' => $input['uid'], 'machineCode' => $input['machineCode'],
            'signData' => $signData, 'num' => $lastNum, 'bool' => $bool, 'appInfoData' => $appInfoData]);
    }
}