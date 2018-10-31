<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/21
 * Time: 10:04
 */

namespace App\Http\Middleware;


use App\Exceptions\TokenException;
use Illuminate\Support\Facades\Request;


class CheckToken
{
    /**
     * 中间件检测是否携带有效token
     * @param $request
     * @param \Closure $next
     * @return mixed
     * @throws TokenException
     */
    public function handle($request, \Closure $next)
    {
        //获取header里的token
        $token = $request->header('token');
        if (empty($token) && Request::getPathInfo() != '/api/user/login') {
            throw new TokenException([
                'msg' => '必须携带有效token!',
                'errorCode' => 10004
            ]);
        }
        return $next($request);
    }
}