<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/14
 * Time: 11:07
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Session;

class Task extends Model
{
    use SoftDeletes;

    /**
     * 应该被调整为日期的属性
     *
     * @var array
     */
    protected $dates = ['deleted_at'];
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'task';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['title', 'catid', 'type', 'start_time', 'status', 'task_mark', 'request_type', 'button_title', 'end_time', 'reward_coin', 'description', 'add_admin', 'status'];
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

    public function getAddAdminAttribute($value)
    {
        $admin = Admin::find($value);
        return $admin->username . '/' . $admin->real_name;
    }

    /*public function getTaskMarkAttribute($value)
    {
        if ($value == 'normal') {
            return '正常';
        } elseif ($value == 'new') {
            return '新';
        } elseif ($value == 'hot') {
            return '热';
        }
    }*/

    public function getDescriptionAttribute($value)
    {
        return strip_tags(htmlspecialchars_decode($value));
    }

    /**
     * 创建任务
     * @param $input
     * @return bool
     */
    public static function createTask($input)
    {
        $input['start_time'] = strtotime($input['start_time']);
        $input['end_time'] = strtotime($input['end_time']);
        $input['add_admin'] = Session::get('admin.id');
        if (self::create($input)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取子类
     * @param $id
     * @return array
     */
    public static function getChildArr($id)
    {
        $result = [];
        $childArr = Category::where('id', $id)->orWhere('pid', $id)->get(['id'])->toArray();
        foreach ($childArr as $child) {
            array_push($result, $child['id']);
        }
        return $childArr;
    }
}