<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 15:24
 */

namespace App\Exceptions;


class TokenException extends BaseException
{
    //HTTP 状态码
    public $code = 401;
    //错误具体信息
    public $msg = 'Token已过期或无效的Token';
    //自定义状态码
    public $errorCode = 10003;
}