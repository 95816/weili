<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/6
 * Time: 17:01
 */

namespace App\Http\Controllers;


use App\Http\Request;
use Gregwar\Captcha\CaptchaBuilder;
use Illuminate\Support\Facades\Session;

//引用对应的命名空间

class CodeController extends Controller
{
    public function captcha($temp)
    {
        $builder = new CaptchaBuilder();
        $builder->build(130, 36);
        $phrase = $builder->getPhrase();
        //把内容存入session
        Session::flash('milkCaptcha', $phrase); //存储验证码
        //ob_clean(); //清除缓存
        return response($builder->output())->header('Content-type','image/jpeg');
    }

}