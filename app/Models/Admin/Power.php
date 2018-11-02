<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/1
 * Time: 11:26
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class Power extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'power';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['name', 'uris', 'status', 'path', 'power', 'pid', 'level'];
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
     * 获取权限信息
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public static function get_power_arr()
    {
        $powerArr = self::orderBy('path', 'asc')->get();
        foreach ($powerArr as $key => $value) {
            $powerArr[$key]['name'] = str_repeat('|---', $value['level']) . $value['name'];
        }
        return $powerArr;
    }


    /**
     * 新增分类
     * @param $input
     * @return bool
     */
    public static function createCat($input)
    {
        if ($input['pid'] == 0) {
            $input['path'] = '0,';
            $input['level'] = '1';
        } else {
            $input['path'] = self::find($input['pid'])->toArray()['path'] . ',';
            $input['level'] = substr_count($input['path'], ',');
        }
        if ($cat = self::create($input)) {
            $result = self::find($cat->id);
            $result->path = $input['path'] . $result->id;
            $result->save();
            return true;
        } else {
            return false;
        }

    }
}