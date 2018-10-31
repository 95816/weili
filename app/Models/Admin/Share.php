<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/2
 * Time: 14:26
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class Share extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'share';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['title', 'content', 'url', 'status', 'image'];
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

    public function getImageAttribute($value)
    {
        return 'http://' . $_SERVER['HTTP_HOST'] . $value;
    }

    public function getContentAttribute($value)
    {
        return strip_tags($value);
    }
}