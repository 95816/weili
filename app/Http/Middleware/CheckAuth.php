<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/1
 * Time: 17:41
 */

namespace App\Http\Middleware;

use App\Models\Admin\Admin;
use App\Models\Admin\Power;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CheckAuth
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
        $login_id = Session::get('admin.id');
        if (empty($login_id) && $request->path() != 'admin/login') {
            return redirect('admin/login');
        }
        $path = preg_replace('/\/\d/', '', $request->path());
        if ($request->path() == 'no_power' || $request->path() == 'admin/login' || $this->checkAuth($login_id, $path)) {
            return $next($request);
        }
        return redirect('no_power');
    }

    //检查是否拥有此权限
    private function checkAuth($login_id, $path)
    {
        //第一步获取当前登录用户ID的role_id
        $user = Admin::find($login_id);
        //第二部获取当前角色的所有权限id
        $power_arr = DB::table('role_power')->where('role_id', $user->role_id)->get(['power_id'])->toArray();
        $power_new_arr = array();
        foreach ($power_arr as $key => $val) {
            $power_new_arr[] = $val->power_id;
        }
        //第三步获取当前路径的权限id
        $power_data = Power::where('uris', $path)->where('status', '1')->get(['id'])->toArray();
        //第四步比对$power_new_arr 和 $has_power_arr (用户所有权限是否含有当前操作权限)
        if (!empty($power_data[0])) {
            /*echo $power_data[0]['id'];
            echo '<pre>';
            print_r($power_new_arr);die;*/
            if (in_array($power_data[0]['id'], $power_new_arr)) {
                return true;
            } else {
                return false;
            }
        } else {
            //如果无明确设定,默认为有权限.
            return true;
        }
    }
}