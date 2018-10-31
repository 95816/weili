<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 13:18
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    //设置自动维护时间戳
    public $timestamps = false;

    /**
     * 指定表名
     * @var string
     */
    protected $table = 'user';

    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['uid', 'status', 'coins', 'invitation_code', 'invited_code', 'invited_time', 'money', 'app_id', 'login_time', 'login_ip'];
    /**
     * 不允许批量赋值的字段
     * @var array
     */
    protected $guarded = [];

    public function getStatusAttribute($value)
    {
        if ($value == 1) {
            return '未认证';
        } elseif ($value == 2) {
            return '微信认证';
        } elseif ($value == 3) {
            return '支付宝认证';
        }
    }

    public function getAppIdAttribute($value)
    {
        $app_name = AppInfo::where('app_id', $value)->get(['app_name']);
        if ($app_name) {
            return $app_name[0]['app_name'];
        }
    }

}