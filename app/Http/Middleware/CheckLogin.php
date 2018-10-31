<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/6
 * Time: 11:15
 */

namespace App\Http\Middleware;


use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Session;

class CheckLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {
        if (!Session::has('admin.id') && Request::getPathInfo() != '/admin/login' && Request::getPathInfo() != 'jump') {
            return redirect('admin/login');
        }
        return $next($request);
    }
}