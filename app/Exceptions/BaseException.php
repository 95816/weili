<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/11
 * Time: 13:24
 */

namespace App\Exceptions;
use Exception;
class BaseException extends Exception
{
    //HTTP 状态码
    public $code = 400;
    //错误具体信息
    public $msg = '参数错误';
    //自定义状态码
    public $errorCode = 10000;


    public function __construct($params = [])
    {

        if (array_key_exists('code', $params)) {
            $this->code = $params['code'];
        }
        if (array_key_exists('errorCode', $params)) {
            $this->errorCode = $params['errorCode'];
        }
        if (array_key_exists('msg', $params)) {
            $this->msg = $params['msg'];
        }
    }
}