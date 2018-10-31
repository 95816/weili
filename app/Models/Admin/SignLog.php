<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/11
 * Time: 15:24
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class SignLog extends Model
{
    //设置自动维护时间戳
    public $timestamps = true;

    /**
     * 指定表名
     * @var string
     */
    protected $table = 'sign_log';

    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['uid', 'app_id', 'coin','total_num'];
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