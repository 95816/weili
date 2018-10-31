<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/22
 * Time: 15:40
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class UserTask extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'user_task';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['uid', 'tid'];
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