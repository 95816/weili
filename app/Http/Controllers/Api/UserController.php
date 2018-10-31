<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/11
 * Time: 11:23
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Enum\Operate;
use App\Models\Admin\CoinsLog;
use App\Models\Admin\User;
use App\Models\Admin\VerifyUser;
use App\Service\Token;
use App\Service\User as UserService;
use Illuminate\Http\Request;


class UserController extends Controller
{
    /**
     * 用户登入
     * @param Request $request
     * @return string
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     */
    public function userLogin(Request $request)
    {

        $input = $request->all('post.');
        $validator = \Validator::make($input, [
            'uid' => 'required',
            'app_key' => 'required',
            'app_id' => 'required',
            'code' => 'required',
            'sign' => 'required'
        ], [
            'required' => ':attribute 为必要参数,不可缺省!'
        ], [
            'uid' => '用户ID',
            'app_id' => 'APP用户app_id',
            'app_key' => 'APP密钥app_key',
            'code' => '加密code',
            'sign' => '签名'
        ]);

        if ($validator->fails()) {
            throw new UserException([
                'errorCode' => 10001,
                'code' => 404,
                'msg' => $validator->errors()->all()
            ]);
        }
        //所有验证通过后
        $userService = new UserService();
        $result = $userService->checkUser($input);
        //返回信息.包含token令牌
        return $result;
    }

    /**
     * @return string
     * @throws \App\Exceptions\TokenException
     */
    public function getUserInfo()
    {
        $uid = Token::getCurrentTokenVar('uid');
        $app_id = Token::getCurrentTokenVar('app_id');
        $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->get(['uid', 'app_id', 'coins', 'invitation_code', 'invited_code'])->toArray()[0];
        //今日金币
        $currentDayTime = strtotime(date('Ymd'));
        $today_task_record = CoinsLog::where('uid', $uid)
            ->where('app_id', $app_id)
            ->where('created_at', '>', $currentDayTime)
            ->where('operate', Operate::add)
            ->get()->toArray();
        $today_coins = 0;
        foreach ($today_task_record as $key => $val) {
            $today_coins += $val['coin'];
        }
        $userInfo['today_coins'] = $today_coins;
        //是否认证支付宝和微信
        $res = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->get(['alipay_account', 'wxpay_account'])->toArray();
        if (empty($res) || $res[0]['alipay_account'] == '' || $res[0]['alipay_account'] == null) {
            $userInfo['ali_status'] = 'no';
        } else {
            $userInfo['ali_status'] = 'ok';
        }

        if (empty($res) || $res[0]['wxpay_account'] == '' || $res[0]['wxpay_account'] == null) {
            $userInfo['wx_status'] = 'no';
        } else {
            $userInfo['wx_status'] = 'ok';
        }
        return json_encode($userInfo);
    }
}