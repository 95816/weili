<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/13
 * Time: 10:42
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //设置自动维护时间戳
    public $timestamps = true;

    /**
     * 指定表名
     * @var string
     */
    protected $table = 'category';

    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['pid', 'app_info_id', 'name', 'level', 'path'];
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
     * 获取分类信息
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public static function get_cat_arr()
    {
        $catArr = self::orderBy('path', 'asc')->get();
        foreach ($catArr as $key => $value) {
            $catArr[$key]['name'] = str_repeat('|---', $value['level']) . $value['name'];
        }
        return $catArr;
    }

    public static function get_cats()
    {
        $catArr = self::get(['id','pid','name']);
        return $catArr;
    }

    /**
     * 新增分类
     * @param $input
     * @return bool
     */
    public static function createCat($input)
    {

        $input['path'] = self::find($input['pid'])->toArray()['path'].',';
        $input['app_info_id'] = self::find($input['pid'])->toArray()['app_info_id'];
        $input['level'] = substr_count($input['path'], ',');
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