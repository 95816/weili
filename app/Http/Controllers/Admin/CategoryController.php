<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/13
 * Time: 11:30
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Category as CategoryModel;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * 分类首页
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function init()
    {
        return view('Admin.category.init');
    }

    /**
     * 新增分类
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function create(Request $request)
    {
        $catArr = CategoryModel::get_cat_arr();
        if ($request->isMethod('post')) {
            $input = $request->only(['name', 'pid']);
            if (CategoryModel::createCat($input)) {
                return redirect()->back()->with('category_add_success', '新增分类成功!');
            } else {
                return redirect()->back()->with('category_add_error', '新增分类失败!');
            }
        }
        return view('Admin.category.create', ['lists' => $catArr]);
    }

    /**
     * 获取分类列表json格式数据
     * @param Request $request
     */
    public function cate_list(Request $request)
    {
        if ($request->ajax()) {
            $data = CategoryModel::get_cats();
            echo json_encode($data);
        }
    }

    /**
     * 分类修改
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request, $id)
    {
        $catArr = CategoryModel::get_cat_arr();
        if ($request->isMethod('post')) {
            $data = $request->only(['id', 'name', 'pid']);
            $result = CategoryModel::find($data['id']);
            $result->name = $data['name'];
            $result->pid = $data['pid'];
            $path_res = CategoryModel::find($data['pid']);
            $result->path = $path_res->path . ',' . $result->id;
            $result->level = substr_count($result->path, ',');
            $res = $result->save();
            if ($res) {
                return redirect()->back()->with('category_edit_success', '修改分类成功!');
            } else {
                return redirect()->back()->with('category_edit_error', '修改分类失败!');
            }
        }
        $editData = CategoryModel::find($id);
        return view('Admin.category.edit', ['data' => $editData, 'lists' => $catArr]);
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->only(['id']);
            if (CategoryModel::destroy($id['id'])) {
                $json = json_encode(['code' => 1, 'status' => 'ok', 'msg' => '删除成功!']);
            } else {
                $json = json_encode(['code' => 0, 'status' => 'error', 'msg' => '删除失败!']);
            }
            return $json;
        }
    }
}