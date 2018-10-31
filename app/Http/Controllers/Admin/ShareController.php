<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/2
 * Time: 9:56
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Share;
use Illuminate\Http\Request;

class ShareController extends Controller
{
    /**
     * 列表
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function lists()
    {
        $lists = Share::orderBy('created_at', 'desc')
            ->paginate(15);
        return view('Admin.share.show', ['lists' => $lists]);
    }

    /**
     * 新增
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function create(Request $request)
    {
        if ($request->isMethod('post')) {
            $pic = $request->file('image');
            $save_url = $this->uploadImg($pic);
            $input = $request->input();
            $input['image'] = empty($save_url) ? '' : $save_url;
            $result = Share::create($input);
            if ($result) {
                return redirect()->action('Admin\ShareController@lists');
            } else {
                return redirect()->back()->with('share_add_fail', '新增文章失败!');
            }
        }
        return view('Admin.share.create');
    }

    /**
     * 修改
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request)
    {
        if ($request->isMethod('post')) {

            $id = $request->input('id');
            $pic = $request->file('image');
            if (!empty($pic)){
                $save_url = $this->uploadImg($pic);
                $updateData['image'] = empty($save_url) ? '' : $save_url;
            }
            $updateData['title'] = $request->input('title');
            $updateData['url'] = $request->input('url');
            $updateData['content'] = $request->input('content');
            $updateData['status'] = $request->input('status');
            $data = Share::find($id);

            if ($data->update($updateData)) {
                return redirect()->action('Admin\ShareController@lists');
            } else {
                return redirect()->back()->with('share_edit_fail', '修改文章失败!');
            }
        } else {
            $id = $request->input('id');
            if (!empty($id) && is_numeric($id) && is_integer($id + 0) && (($id + 0) > 0)) {
                $data = Share::find($id);
                return view('Admin.share.edit', ['data' => $data]);
            } else {
                return redirect()->back();
            }
        }
    }

    /**
     * 删除
     * @param Request $request
     * @return string
     */
    public function delete(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->input('id');
            $new = Share::find($id);
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
                $task = Share::find($id);
                $task->delete($id);
            }
            return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
        }
    }


}