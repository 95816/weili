<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/31
 * Time: 13:22
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\AppInfo;
use App\Models\Admin\News;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function lists()
    {
        $lists = News::orderBy('created_at', 'desc')
            ->paginate(15);
        return view('Admin.news.show', ['lists' => $lists]);
    }

    /**
     * 添加文章
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function create(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->input();
            $result = News::create($input);
            if ($result) {
                return redirect()->action('Admin\NewsController@lists');
            } else {
                return redirect()->back()->with('news_add_fail', '新增文章失败!');
            }
        }
        //获得所有的APP 的信息
        $app_infos = AppInfo::all();
        return view('Admin.news.create', ['app_infos' => $app_infos]);
    }

    /**
     * 修改文章
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request)
    {
        if ($request->isMethod('post')) {

            $id = $request->input('id');
            $updateData['title'] = $request->input('title');
            $updateData['type'] = $request->input('type');
            $updateData['description'] = $request->input('description');
            $updateData['app_id'] = $request->input('app_id');
            $data = News::find($id);

            if ($data->update($updateData)) {
                return redirect()->action('Admin\NewsController@lists');
            } else {
                return redirect()->back()->with('news_edit_fail', '修改文章失败!');
            }
        } else {
            $id = $request->input('id');
            //获得所有的APP 的信息
            $app_infos = AppInfo::all();
            if (!empty($id) && is_numeric($id) && is_integer($id + 0) && (($id + 0) > 0)) {
                $data = News::find($id);
                return view('Admin.news.edit', ['data' => $data, 'app_infos' => $app_infos]);
            } else {
                return redirect()->back();
            }
        }
    }

    /**
     * 批量删除
     * @param Request $request
     * @return string
     */
    public function delete(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->input('id');
            $new = News::find($id);
            if ($new->delete($id)) {
                return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
            } else {
                return json_encode(['msg' => '删除失败!', 'code' => 0, 'status' => 'no']);
            }
        }
    }

    /**
     * 批量删除
     * @param Request $request
     * @return string
     */
    public function delete_all(Request $request)
    {
        if ($request->ajax()) {
            $ids = $request->input('ids');
            $ids = explode(',', $ids);
            foreach ($ids as $id) {
                $task = News::find($id);
                $task->delete($id);
            }
            return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
        }
    }

    public function upload(Request $request)
    {
        $status = 0;
        $data = [];
        if ($request->method() == 'POST') {
            $date = date('Ymd');
            $path = $request->file('description');
            if ($path) {
                $fileUrl = '/upload/' . $date . '/' . $path;
                $status = 1;
                $data['url'] = $fileUrl;
                $message = '上传成功';
            } else {
                $message = "上传失败";
            }
        } else {
            $message = "参数错误";
        }
        return json_encode(['status' => $status, 'msg' => $message, 'data' => $data]);
    }
}