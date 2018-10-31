<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 16:07
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class AppInfo extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'app_info';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['app_name', 'bg_color', 'image_url', 'app_id', 'app_key'];
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
     * 生成app_id和app_key
     * @return mixed
     */
    public static function generate()
    {
        $data['app_key'] = md5(getRandChar(16));
        $data['app_id'] = getRandChar(16);
        return $data;
    }

    public function getImageUrlAttribute($value)
    {
        return 'http://' . $_SERVER['HTTP_HOST'] . $value;
    }
}