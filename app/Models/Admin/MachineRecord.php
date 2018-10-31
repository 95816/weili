<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/5
 * Time: 16:03
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class MachineRecord extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'machine_record';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['app_id', 'machine_code', 'num'];
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