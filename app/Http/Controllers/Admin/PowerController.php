<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/11/1
 * Time: 9:44
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Power;
use Illuminate\Http\Request;

class PowerController extends Controller
{
    public function show()
    {
        $datas = Power::paginate(15);
        return view('Admin.power.show', ['datas' => $datas]);
    }


    public function add(Request $request)
    {
        $powerArr = Power::get_power_arr();
        if ($request->isMethod('post')) {
            $input = $request->only(['name', 'pid', 'uris', 'status']);
            if (Power::createCat($input)) {
                return redirect()->back()->with('category_add_success', '新增分类成功!');
            } else {
                return redirect()->back()->with('category_add_error', '新增分类失败!');
            }
        }
        return view('Admin.power.add', ['lists' => $powerArr]);
    }

    public function power_list()
    {
        $data = Power::where('status', '1')->get(['id', 'pid', 'name']);
        echo json_encode($data);
    }

    /**
     * 分类修改
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request, $id)
    {
        $powerArr = Power::get_power_arr();
        if ($request->isMethod('post')) {
            $data = $request->only(['id', 'name', 'uris', 'pid', 'status']);
            $result = Power::find($data['id']);
            $result->name = $data['name'];
            $result->pid = $data['pid'];
            $result->uris = $data['uris'];
            $path_res = Power::find($data['pid']);
            if ($data['pid'] == 0) {
                $result->path = '0,';
                $result->level = '1';
            } else {
                $result->path = $path_res->path . ',' . $result->id;
                $result->level = substr_count($result->path, ',');
            }
            $res = $result->save();
            if ($res) {
                return redirect()->back()->with('category_edit_success', '修改成功!');
            } else {
                return redirect()->back()->with('category_edit_error', '修改失败!');
            }
        }
        $editData = Power::find($id);
        return view('Admin.power.edit', ['data' => $editData, 'lists' => $powerArr]);
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->input('id');
            $new = Power::find($id);
            if ($new->delete($id)) {
                return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
            } else {
                return json_encode(['msg' => '删除失败!', 'code' => 0, 'status' => 'no']);
            }
        }
    }
}