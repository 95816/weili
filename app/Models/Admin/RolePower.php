<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/2
 * Time: 16:53
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class RolePower extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'role_power';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['role_id', 'power_id'];
    /**
     * 不允许批量赋值的字段
     * @var array
     */
    protected $guarded = [];
}