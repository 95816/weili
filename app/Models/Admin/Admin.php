<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/6
 * Time: 13:47
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Request;

class Admin extends Model
{
    const CREATED_AT = 'create_time';
    const UPDATED_AT = 'update_time';
    const DELETED_AT = 'delete_time';

    use SoftDeletes;

    /**
     * 应该被调整为日期的属性
     *
     * @var array
     */
    protected $dates = ['delete_time'];
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'admin';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['username', 'email', 'password', 'status', 'role_id', 'real_name', 'login_time', 'login_ip'];
    /**
     * 不允许批量赋值的字段
     * @var array
     */
    protected $guarded = [];

    /**
     * 时间戳维护
     * @return int
     */
    public function getDateFormat()
    {
        return time();
    }

    /**
     * 检测登录
     * @param $input
     * @return mixed
     */
    public static function checkLogin($input)
    {
        $code = Session::get('milkCaptcha');
        if ($input['code'] != $code) {
            $jump = Config::get('jump.code_fail');
            return $jump;
        }
        $user = self::where('username', $input['username'])->where('status', '1')->where('password', md5($input['password']))->get()->toArray();
        if (empty($user)) {
            $jump = Config::get('jump.admin_no');
        } else {
            //写入session并维护登录信息
            self::setUserInfo($user[0]);
            $jump = Config::get('jump.login_success');
        }
        return $jump;

    }

    /**
     * 存入管理员session及维护登录信息
     * @param $user
     */
    private static function setUserInfo($user)
    {
        Session::put('admin.id', $user['id']);
        Session::put('admin.info', $user);
        $userInfo = self::find($user['id']);
        $userInfo->login_time = time();
        $userInfo->login_ip = Request::getClientIp();
        $userInfo->save();
    }

    /**
     * 获取控制面板首页信息
     * @return mixed
     */
    public static function getIndexData()
    {
        $result['server'] = $_SERVER;
        $result['adminInfo'] = Session::get('admin.info');
        return $result;
    }

}