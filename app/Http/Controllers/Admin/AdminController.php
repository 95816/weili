<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/6
 * Time: 10:39
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Admin as AdminModel;
use App\Models\Admin\Role;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    /**
     * 后台首页
     * @return Factory|\Illuminate\View\View|\think\response\View
     */
    public function index()
    {
        $result = AdminModel::getIndexData();
        return view('Admin.admin.index', ['result' => $result]);
    }

    /**
     * 登录控制
     * @param Request $request
     * @return Factory|\Illuminate\View\View|\think\response\View
     */
    public function login(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->only(['username', 'password', 'code']);
            $result = AdminModel::checkLogin($input);
            return view('jump', ['jump' => $result]);
        } else {
            return view('Admin.admin.login');
        }
    }


    /**
     * 管理员列表
     * @param Request $request
     * @return Factory|\Illuminate\View\View|\think\response\View
     */
    public function lists(Request $request)
    {
        if (array_key_exists('submit', $request->input()) or !empty(Input::get('username'))) {
            $search = $request->input('Search');
            $start_time = strtotime($search['start_time']);
            $end_time = strtotime($search['end_time']) == '' ? time() : strtotime($search['end_time']);
            $keyword = empty($search['keyword']) ? Input::get('username') : $search['keyword'];
            if (!$keyword) {
                $admin_lists = AdminModel::where('create_time', '>', $start_time)
                    ->where('create_time', '<', $end_time)
                    ->paginate(2);
            } else {
                $admin_lists = AdminModel::where('create_time', '>', $start_time)
                    ->where('create_time', '<', $end_time)
                    ->where('username', 'like', '%' . $keyword . '%')
                    ->paginate(2);
            }
        } else {
            $admin_lists = AdminModel::paginate(10);
        }
        foreach ($admin_lists as $key => &$val) {
            $role_data = Role::find($val->role_id);
            if (!empty($role_data)){
                $val['role_id'] = $role_data->name;
            }
        }
        return view('Admin.admin.lists', ['list' => $admin_lists, 'keyword' => empty($keyword) ? '' : $keyword]);
    }

    /**
     * 创建管理员
     * @param Request $request
     * @return Factory|\Illuminate\View\View|\think\response\View
     */
    public function create(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->all('post.');
            $data['password'] = md5($data['password']);
            if (AdminModel::create($data)) {
                $jump = Config::get('jump.admin_add_success');
                return view('jump', ['jump' => $jump]);
            } else {
                $jump = Config::get('jump.admin_add_fail');
                return view('jump', ['jump' => $jump]);
            }
        } else {
            $roles = Role::where('status', '1')->get();
            return view('Admin.admin.create', ['roles' => $roles]);
        }
    }

    /**
     * 修改
     * @param Request $request
     * @param $id
     * @return $this|Factory|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request, $id)
    {
        $admin = AdminModel::find($id);
        if ($request->isMethod('post')) {
            $input = $request->input('Admin');
            if (empty($input['password'])) {
                unset($input['password']);
            } else {
                $input['password'] = md5($input['password']);
            }
            if ($admin->update($input)) {
                $jump = Config::get('jump.admin_edit_success');
                if ($id == Session::get('admin.id')) {
                    Session::flush();
                }
                return view('jump', ['jump' => $jump]);
            } else {
                return redirect()->back()->with('admin_edit_error', '修改管理员 ' . $admin->username . ' 失败!')->withInput();
            }
        } else {
            $roles = Role::where('status', '1')->get();
            return view('Admin.admin.edit', ['adminInfo' => $admin, 'roles' => $roles]);
        }
    }

    /**
     * 删除操作
     * @param Request $request
     * @return string
     */
    public function delete(Request $request)
    {
        $id = $request->input('id');
        $admin = AdminModel::find($id);
        if ($admin->delete($id)) {
            return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
        } else {
            return json_encode(['msg' => '删除失败!', 'code' => 0, 'status' => 'no']);
        }
    }

    public function admin_status(Request $request)
    {
        $id = $request->input('id');
        $type = $request->input('type');
        $admin = AdminModel::find($id);
        if ($type == 'stop') {
            $data['status'] = 2;
        } elseif ($type == 'start') {
            $data['status'] = 1;
        }
        if ($admin->update($data)) {
            return json_encode(['msg' => '更改状态成功!', 'code' => 1, 'status' => 'ok', 'id' => $id]);
        } else {
            return json_encode(['msg' => '更改状态失败!', 'code' => 0, 'status' => 'no', 'id' => $id]);
        }

    }

    /**
     * 退出登录
     */
    public function logout()
    {
        Session::flush();
        return redirect('/');
    }

    public function no_power()
    {
        $jump = Config::get('jump.no_power');
        return view('jump', ['jump' => $jump]);
    }
}