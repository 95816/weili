<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/4
 * Time: 14:27
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class Invite extends Model
{
    public $timestamps = false;
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'app_invite';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['app_id', 'first_extra_coin', 'invite_coin_arr','type'];
    /**
     * 不允许批量赋值的字段
     * @var array
     */
    protected $guarded = [];
}