<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 10:46
 */

namespace App\Service;

use App\Exceptions\TokenException;
use App\Exceptions\UserException;
use App\Http\Enum\UserKey;
use App\Models\Admin\AppInfo;
use App\Models\Admin\User as UserModel;
use Illuminate\Support\Facades\Request;


class User
{
    /**
     * 检验用户登录.成功返回token等信息
     * @param $input
     * @return string
     * @throws TokenException
     * @throws UserException
     */
    public function checkUser($input)
    {
        //首先校验参数
        $input['uid'] = $this->getUID($input['uid']);
        $this->checkSignAndCode($input);
        $user = UserModel::where('uid', $input['uid'])->where('app_id', $input['app_id'])->first();
        if (!$user) {
            $uid = $this->newUser($input);
        } else {
            //必须先通过校验
            $user->login_time = time();
            $user->login_ip = Request::getClientIp();
            $user->save();
            $uid = $user->uid;
        }

        //到了这证明一切都通过了,生成令牌存入session
        $token = $this->saveToCache($input);

        $result = [
            'current_uid' => $uid,
            'msg' => 'success',
            'code' => '200',
            'token' => $token
        ];
        return json_encode($result);

    }

    /**
     * 存入session并返回令牌
     * @param $cachedValue
     * @return string
     */
    private function saveToCache($cachedValue)
    {
        session_start();
        //生成令牌
        //$key = $this->generateToken();
        $value = json_encode($cachedValue);
        $_SESSION['userinfo'] = $value;
        $session_id = session_id();
        return $session_id;
    }

    /**
     * 生成令牌
     * @return string
     */
    public function generateToken()
    {
        $randStr = getRandChar(32);

        $timestamp = $_SERVER['REQUEST_TIME_FLOAT'];

        $token_salt = UserKey::Token_salt;

        return md5($randStr . $timestamp . $token_salt);
    }

    /**
     * 检验加密参数
     * @param $input
     * @return bool
     * @throws UserException
     * @throws TokenException
     */
    private function checkSignAndCode($input)
    {
        $app_info = AppInfo::where('app_id', $input['app_id'])->where('app_key', $input['app_key'])->first();
        if (!$app_info) {
            throw new TokenException([
                'msg' => '不存在的app_id或app_key,请检查参数!',
                'errorCode' => '10006'
            ]);
        }
        $code = md5($input['uid'] . $app_info->app_key . date('Ymd', time()));
        $sign = md5($input['uid'] . $app_info->app_id . $app_info->app_key . $code . UserKey::Tw_salt);
        if ($code != $input['code'] || $sign != $input['sign']) {
            throw new UserException([
                'msg' => 'Code或者签名sign验证失败,请检查参数',
                'errorCode' => 10002
            ]);
        }
        return true;

    }

    private function newUser($input)
    {
        //input缺少login_ip和login_time
        $input['login_time'] = time();
        $input['login_ip'] = Request::getClientIp();
        //校验sign和code参数
        $this->checkSignAndCode($input);
        //生成invitation_code
        $input['invitation_code'] = $this->createInviteCode();
        if ($user = UserModel::create($input)) {
            return $user->uid;
        }
    }

    private function createInviteCode()
    {
        $invitation_code = strtoupper(getRandChar(8));
        //检测是否存在重复邀请码
        $checkCode = UserModel::where('invitation_code', $invitation_code)->get()->toArray();
        if ($checkCode) {
            $this->createInviteCode();
        }
        return $invitation_code;
    }

    /**
     * 获取真实的uid
     * @param $uuid
     * @return string
     */
    public function getUID($uuid)
    {
        $uuid = base64_decode($uuid, true);
        $arr = [1 => '8', 2 => 'y', 3 => 'h', 4 => '3', 5 => 'o', 6 => 'x', 7 => '9', 8 => 'z', 9 => 'f', 0 => 'n'];
        $arr_flip = array_flip($arr);

        $real_str = substr($uuid, 2);
        $real_uid = '';
        for ($i = 0; $i < $uuid[1]; $i++) {
            $real_uid .= $arr_flip[$real_str[$i]];
        }
        return $real_uid;
    }
}