<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/6
 * Time: 11:38
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class CoinsLog extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'coins_log';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['coin', 'uid', 'app_id', 'operate', 'type', 'num'];
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

    public function getAppIdAttribute($value)
    {
        $app_name = AppInfo::where('app_id', $value)->get(['app_name']);
        if ($app_name) {
            return $app_name[0]['app_name'];
        }
    }
}