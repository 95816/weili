<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/11
 * Time: 15:31
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class Sign extends Model
{
    //设置自动维护时间戳
    public $timestamps = false;

    /**
     * 指定表名
     * @var string
     */
    protected $table = 'app_sign';

    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['app_id', 'reward_coin'];
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