<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/4
 * Time: 10:58
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\AppInfo;
use App\Models\Admin\Invite;
use Illuminate\Http\Request;

class InviteController extends Controller
{
    public function set_invite(Request $request)
    {
        if ($request->isMethod('post')) {
            //检验参数
            $input = $request->input();
            if ($input['first_extra_coin'] != 0 && empty($input['first_extra_coin'])) {
                if (!isPositiveInteger($input['first_extra_coin'])) {
                    return redirect()->back()->with('invite_first_none', '首次邀请获得额外金币不可为空!');
                }
            }
            if (!empty($input['InviteCoin'])) {
                foreach ($input['InviteCoin'] as $key => $value) {
                    if (!isPositiveInteger($value)) {
                        return redirect()->back()->with('invite_coin_error', '金币数必须为正整数!');
                    }
                }
                $input['invite_coin_arr'] = implode(',', $input['InviteCoin']);
            }
            //判断是否是添加还是修改
            $app_info = Invite::where('app_id', $input['app_id'])->where('type',$request->input(['type']))->first();
            if (empty($app_info)) {
                //执行新增
                if (Invite::create($input)) {
                    return redirect()->back()->with('invite_add_success', '设置邀请金币数据成功!');
                } else {
                    return redirect()->back()->with('invite_add_error', '设置邀请金币数据失败!');
                }
            } else {
                //执行修改
                $updateData['first_extra_coin'] = $input['first_extra_coin'];
                $updateData['invite_coin_arr'] = implode(',', $input['InviteCoin']);

                if ($app_info->update($updateData)) {
                    return redirect()->back()->with('invite_edit_success', '修改邀请金币数据成功!');
                } else {
                    return redirect()->back()->with('invite_edit_error', '修改邀请金币数据失败!');
                }
            }
        }
        $app_id = 0;
        $inviteData = array();
        if ($app_id = $request->input('app_id')) {
            $inviteData = Invite::where('app_id', $app_id)->where('type', $request->input(['type_mark']))->get()->toArray();
            if (!empty($inviteData)) {
                $inviteData = $inviteData[0];
                $inviteData['invite_coin_arr'] = explode(',', $inviteData['invite_coin_arr']);
            }
        }
        //获得所有的APP 的信息
        $app_infos = AppInfo::all();
        return view('Admin.invite.set', ['app_infos' => $app_infos, 'inviteData' => $inviteData, 'app_id' => $app_id, 'type_mark' => $request->input(['type_mark'])]);
    }

}