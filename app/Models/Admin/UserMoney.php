<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/8
 * Time: 18:01
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class UserMoney extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'user_money';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['uid', 'app_id', 'coins', 'money', 'is_send', 'type', 'is_close', 'is_get', 'order_no'];
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

    /*public function getAppIdAttribute($value)
    {
        $app_name = AppInfo::where('app_id', $value)->get(['app_name']);
        if ($app_name) {
            return $app_name[0]['app_name'];
        }
    }*/

    public static function handleAccount($lists)
    {
        foreach ($lists as $key => &$val) {
            $account = self::getAccount($val->uid, $val->app_id, $val->type);
            $val->account = $account;
            $app_name = AppInfo::where('app_id', $val['app_id'])->get(['app_name']);
            $val['app_id'] = $app_name[0]['app_name'];
        }
        return $lists;
    }

    public static function getAccount($uid, $app_id, $type)
    {
        $userInfo = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->first();
        if ($type == 1) {
            return $userInfo->wxpay_account;
        } elseif ($type == 2) {
            return $userInfo->alipay_account;
        }
    }
}