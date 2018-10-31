<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/11
 * Time: 15:12
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\AppInfo;
use App\Models\Admin\Sign;
use Illuminate\Http\Request;

class SignController extends Controller
{
    public function set_sign(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->input();
            if (!empty($input['RewardCoin'])) {
                foreach ($input['RewardCoin'] as $key => $value) {
                    if (!isPositiveInteger($value)) {
                        return redirect()->back()->with('sign_coin_error', '金币数必须为正整数!');
                    }
                }
                $input['reward_coin'] = implode(',', $input['RewardCoin']);
            }
            //判断是否是添加还是修改
            $app_info = Sign::where('app_id', $input['app_id'])->first();
            if (empty($app_info)) {
                //执行新增
                if (Sign::create($input)) {
                    return redirect()->back()->with('sign_add_success', '设置签到金币数据成功!');
                } else {
                    return redirect()->back()->with('sign_add_error', '设置签到金币数据失败!');
                }
            } else {
                //执行修改
                $updateData['reward_coin'] = implode(',', $input['RewardCoin']);

                if ($app_info->update($updateData)) {
                    return redirect()->back()->with('sign_edit_success', '修改签到金币数据成功!');
                } else {
                    return redirect()->back()->with('sign_edit_error', '修改签到金币数据失败!');
                }
            }
            //dd($input);
        }
        if ($app_id = $request->input('app_id')) {
            $signData = Sign::where('app_id', $app_id)->get()->toArray();
            if (!empty($signData)) {
                $signData = $signData[0];
                $signData['reward_coin'] = explode(',', $signData['reward_coin']);
            }
        }

        //获得所有的APP 的信息
        $app_infos = AppInfo::all();
        return view('Admin.sign.set', ['app_infos' => $app_infos, 'app_id' => $app_id, 'signData' => $signData]);
    }
}