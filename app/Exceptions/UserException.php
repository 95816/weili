<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/11
 * Time: 14:25
 */

namespace App\Exceptions;


class UserException extends BaseException
{
    //HTTP 状态码
    public $code = 400;
    //错误具体信息
    public $msg = '用户不存在,请检查参数';
    //自定义状态码
    public $errorCode = 10000;

}