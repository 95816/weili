<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/7
 * Time: 9:59
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class VerifyUser extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'verify_user';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['uid', 'app_id', 'id_card', 'name', 'alipay_account', 'wxpay_account', 'unionid'];
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
}