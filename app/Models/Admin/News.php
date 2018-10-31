<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/31
 * Time: 14:12
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'news';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['title', 'type', 'description', 'app_id'];
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