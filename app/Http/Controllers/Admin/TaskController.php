<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/13
 * Time: 16:57
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\AppInfo;
use App\Models\Admin\Category as CategoryModel;
use App\Models\Admin\Category;
use App\Models\Admin\Task as TaskModel;
use App\Models\Admin\Task;
use App\Models\Admin\UserTask;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class TaskController extends Controller
{
    /**
     * 任务list
     * @param Request $request
     * @param string $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function show(Request $request, $id = '')
    {
        $search = array();
        if (array_key_exists('submit', $request->input()) or !empty(Input::get('title'))) {
            $search = $request->input('Search');
            $search['keyword'] = empty($search['keyword']) ? Input::get('title') : $search['keyword'];
            $search['id'] = empty($search['id']) ? Input::get('id') : $search['id'];
            //3种情况.1-某个分类中搜索,2-所有任务搜索
            if (!empty($search['id']) && !empty($search['keyword'])) {
                //获取所有子类数组
                $childArr = TaskModel::getChildArr($id);
                $lists = TaskModel::whereIn('catid', $childArr)
                    ->orderBy('created_at', 'desc')
                    ->where('title', 'like', '%' . $search['keyword'] . '%')
                    ->paginate(15);
            } elseif (empty($search['id'])) {
                $lists = TaskModel::orderBy('created_at', 'desc')
                    ->where('title', 'like', '%' . $search['keyword'] . '%')
                    ->paginate(15);
            } else {
                $childArr = TaskModel::getChildArr($id);
                $lists = TaskModel::whereIn('catid', $childArr)
                    ->orderBy('created_at', 'desc')
                    ->paginate(15);
            }
            $id = $search['id'];

        } else {
            if (!empty($id)) {
                //获取所有子类数组
                $childArr = TaskModel::getChildArr($id);
                $lists = TaskModel::whereIn('catid', $childArr)->orderBy('created_at', 'desc')->paginate(15);
            } else {
                $lists = TaskModel::orderBy('created_at', 'desc')->paginate(15);
            }
        }
        return view('Admin.task.show', ['lists' => $lists, 'keyword' => empty($search['keyword']) ? '' : $search['keyword'], 'id' => $id]);
    }

    /**
     * 任务create
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function create(Request $request)
    {
        $catArr = CategoryModel::get_cat_arr();
        if ($request->isMethod('post')) {
            $input = $request->input();
            $result = TaskModel::createTask($input);
            if ($result) {
                return redirect()->action('Admin\TaskController@show');
            } else {
                return redirect()->back()->with('task_add_fail', '新增任务失败!');
            }
        }
        return view('Admin.task.create', ['catArr' => $catArr]);
    }

    /**
     * 编辑
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View|\think\response\View
     */
    public function edit(Request $request)
    {
        if ($request->isMethod('post')) {
            $id = $request->input('id');
            $updateData = $request->input('Task');
            $data = TaskModel::find($id);
            $updateData['start_time'] = strtotime($updateData['start_time']);
            $updateData['end_time'] = strtotime($updateData['end_time']);
            if ($data->update($updateData)) {
                return redirect()->action('Admin\TaskController@show');
            } else {
                return redirect()->back()->with('task_add_fail', '修改任务失败!');
            }
        } else {
            $id = $request->input('id');
            if (!empty($id) && is_numeric($id) && is_integer($id + 0) && (($id + 0) > 0)) {
                $data = TaskModel::find($id);
                $catArr = CategoryModel::get_cat_arr();
                return view('Admin.task.edit', ['data' => $data, 'catArr' => $catArr]);
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
            $task = TaskModel::find($id);
            if ($task->delete($id)) {
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
                $task = TaskModel::find($id);
                $task->delete($id);
            }
            return json_encode(['msg' => '删除成功!', 'code' => 1, 'status' => 'ok']);
        }
    }

    public function task_status(Request $request)
    {
        $id = $request->input('id');
        $type = $request->input('type');
        $task = TaskModel::find($id);
        if ($type == 'stop') {
            $data['status'] = 2;
        } elseif ($type == 'start') {
            $data['status'] = 1;
        }
        if ($task->update($data)) {
            return json_encode(['msg' => '更改状态成功!', 'code' => 1, 'status' => 'ok', 'id' => $id]);
        } else {
            return json_encode(['msg' => '更改状态失败!', 'code' => 0, 'status' => 'no', 'id' => $id]);
        }
    }

    public function do_lists()
    {
        $taskData = UserTask::paginate(15);
        foreach ($taskData as $k => $v) {
            $catid = Task::where('id', $v->tid)->get(['catid'])->toArray()[0]['catid'];
            $app_info_id = Category::where('id', $catid)->get(['app_info_id'])->toArray()[0]['app_info_id'];
            $app_name = AppInfo::where('id', $app_info_id)->get(['app_name'])->toArray()[0]['app_name'];
            $taskData[$k]['app_name'] = $app_name;
            $taskName = Task::where('id', $v->tid)->get(['title'])->toArray()[0]['title'];
            $taskData[$k]['task_name'] = $taskName;
        }
        return view('Admin.task.doLists', ['result' => $taskData]);
    }
}