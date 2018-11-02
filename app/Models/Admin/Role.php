<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/1
 * Time: 15:15
 */

namespace App\Models\Admin;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Role extends Model
{
    /**
     * 指定表名
     * @var string
     */
    protected $table = 'role';
    /**
     * 指定主键
     * @var string
     */
    protected $primaryKey = 'id';
    /**
     * 允许批量赋值的字段
     * @var array
     */
    protected $fillable = ['name', 'description', 'status'];
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

    public static function handle($data, $type)
    {
        DB::beginTransaction();
        try {
            if ($type == 1) {

                //新增操作
                $res = self::create(['name' => $data['name'], 'status' => $data['status'], 'description' => $data['description']]);
                $insArr = array();
                if (!empty($data['power'])) {
                    foreach ($data['power'] as $key => &$val) {
                        $dd['power_id'] = $val;
                        $dd['role_id'] = $res->id;
                        $insArr[] = $dd;
                    }
                }
                $res1 = DB::table('role_power')->insert($insArr);
                if ($res && $res1) {
                    DB::commit();
                }
            } elseif ($type == 2) {
                $res = DB::table('role_power')->where('role_id', '=', $data['id'])->delete();
                $insArr = array();
                if (!empty($data['power'])) {
                    foreach ($data['power'] as $key => &$val) {
                        $dd['power_id'] = $val;
                        $dd['role_id'] = $data['id'];
                        $insArr[] = $dd;
                    }
                }
                $res1 = DB::table('role_power')->insert($insArr);
                if ($res && $res1) {
                    DB::commit();
                }
            }
        } catch (\Exception $e) {
            DB::rollback();//事务回滚
            echo $e->getMessage();
            echo $e->getCode();
        }
    }

}