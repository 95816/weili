<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/22
 * Time: 15:43
 */

namespace App\Exceptions;


class TaskException extends BaseException
{
    //HTTP 状态码
    public $code = 401;
    //错误具体信息
    public $msg = '不存在的任务.请检查参数';
    //自定义状态码
    public $errorCode = 20001;
}