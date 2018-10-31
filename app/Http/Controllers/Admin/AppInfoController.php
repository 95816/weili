<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 15:43
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\AppInfo as AppInfoModel;
use App\Models\Admin\Category as CategoryModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class AppInfoController extends Controller
{
    /**
     * 所有App
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function show()
    {
        $app_lists = AppInfoModel::paginate(10);
        return view('Admin.appinfo.show', ['lists' => $app_lists]);
    }

    public function apply(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->only('app_name', 'bg_color');
            $pic = $request->file('image');
            $save_url = $this->uploadImg($pic);
            $data['image_url'] = empty($save_url) ? '' : $save_url;
            //分配app_id和app_key
            DB::beginTransaction();
            try {
                $res = AppInfoModel::generate();
                $result = array_merge($data, $res);
                if ($return = AppInfoModel::create($result)) {
                    //申请成功此时向分类表中插入一个顶级分类
                    if ($cat = CategoryModel::create(['pid' => 0, 'app_info_id' => $return->id, 'name' => $return->app_name, 'path' => '0,', 'level' => 1])) {
                        $cat_data = CategoryModel::find($cat->id);
                        $cat_data->path = $cat_data['path'] . $cat->id;
                        $cat_data->save();
                        $jump = Config::get('jump.app_apply_success');
                        DB::commit();
                        return view('jump', ['jump' => $jump]);
                    }
                } else {
                    return redirect()->back()->with('app_apply_error', '申请APP-' . $result['app_name'] . '-接口失败!');
                }
            } catch (\Exception $exception) {
                DB::rollBack();
                throw $exception;
            }

        } else {
            return view('Admin.appinfo.apply');
        }
    }
}