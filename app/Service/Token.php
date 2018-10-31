<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/15
 * Time: 14:28
 */

namespace App\Service;


use App\Exceptions\TokenException;

class Token
{
    /**
     * 根据key获取缓存里的值
     * @param $key
     * @return mixed
     * @throws Exception
     * @throws TokenException
     */
    public static function getCurrentTokenVar($key, $type = true, $input_token = null)
    {
        if ($type) {
            $token = \Illuminate\Support\Facades\Request::header('token');
        } else {
            $token = $input_token;
        }
        session_id($token);
        if (!isset($_SESSION)) {
            session_start();
        }
        if(empty($_SESSION['userinfo'])){
            throw new TokenException([
                'msg' => 'Token已过期或无效的Token',
                'errorCode' => 10003
            ]);
        }
        $vars = $_SESSION['userinfo'];
        if (!$vars) {
            throw new TokenException([
                'msg' => 'Token已过期或无效的Token',
                'errorCode' => 10003
            ]);
        } else {
            if (!is_array($vars)) {
                $vars = json_decode($vars, true);
            }
            if (array_key_exists($key, $vars)) {
                return $vars[$key];
            } else {
                throw new \Exception('尝试获取Token的变量不存在');
            }
        }

    }
}