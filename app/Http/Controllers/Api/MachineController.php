<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/20
 * Time: 11:37
 */

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\Admin\MachineRecord;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MachineController extends Controller
{

    public function record(Request $request)
    {
        $inputData = $request->all('post.');
        //检测是否是第一次安装.也就是查一下这个机器码的安装次数num是否大于1
        if ($this->checkMachine($inputData['machineCode'], $inputData['app_id'])) {
            //第一次 . 记录进机器码数据库 并且num默认为1
            MachineRecord::create(['machine_code' => $inputData['machineCode'], 'app_id' => $inputData['app_id'], 'num' => 1]);
            $result = [
                'msg' => '您是第一次安装哦!',
                'code' => '200',
            ];
        } else {
            //不是第一次, 更新这个num ++
            DB::table('machine_record')->where('machine_code', $inputData['machineCode'])->increment('num', 1);
            $result = [
                'msg' => '恭喜你安装成功!',
                'code' => '200',
            ];
        }
        return json_encode($result);

    }

    /**
     * 检测是否安装过APP
     * @param $machineCode
     * @param $app_id
     * @return bool
     */
    private function checkMachine($machineCode, $app_id)
    {
        $machineInfo = MachineRecord::where('machine_code', $machineCode)->where('app_id', $app_id)->get();

        //修改方案 查看数据表里面的num 是否等于1,1就是true大于1就是false
        if ($machineInfo->isNotEmpty()) {
            return false;
        } else {
            return true;
        }
    }
}