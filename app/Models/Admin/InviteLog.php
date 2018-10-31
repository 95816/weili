<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/5
 * Time: 16:31
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class InviteLog extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'invite_log';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['coin', 'invite_uid', 'invited_uid', 'app_id', 'type'];
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