<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/1
 * Time: 14:08
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Power;
use App\Models\Admin\Role;
use App\Models\Admin\RolePower;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    /**
     * 角色列表
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function show()
    {
        $datas = Role::paginate(15);
        return view('Admin.role.show', ['datas' => $datas]);
    }

    /**
     * 新增角色
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function add(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->all();
            if (!empty($data)) {
                Role::handle($data, 1);
            }
            $datas = Role::paginate(15);
            return view('Admin.role.show', ['datas' => $datas]);
        } else {
            $powers = Power::where('status', '1')->where('level', '1')->get()->toArray();
            foreach ($powers as $key => &$val) {
                $childs = Power::where('status', '1')->where('pid', $val['id'])->get()->toArray();
                $val['childs'] = $childs;
            }
            return view('Admin.role.add', ['powers' => $powers]);
        }
    }

    public function edit(Request $request, $id)
    {
        $role = Role::find($id);
        if ($request->isMethod('post')) {
            $data = $request->all();
            if (!empty($data)){
                $input['name'] = $data['name'];
                $input['description'] = $data['description'];
                $input['status'] = $data['status'];
                $role->update($input);
                Role::handle($data, 2);
            }
            $datas = Role::paginate(15);
            return view('Admin.role.show', ['datas' => $datas]);
        } else {
            //查看当前角色已拥有的权限
            $power_arr = RolePower::where('role_id', $id)->get()->toArray();
            $power_new_arr = array();
            foreach ($power_arr as $key => $val) {
                $power_new_arr[] = $val['power_id'];
            }

            $powers = Power::where('status', '1')->where('level', '1')->get()->toArray();

            foreach ($powers as $key => &$val) {
                $childs = Power::where('status', '1')->where('pid', $val['id'])->get()->toArray();
                $val['childs'] = $childs;
            }

            return view('Admin.role.edit', ['powers' => $powers, 'role' => $role, 'power_new_arr' => $power_new_arr]);
        }
    }
}