<?php

namespace App\Http\Controllers;

use App\Models\Admin\AppInfo;
use App\Models\Admin\CoinsLog;
use App\Models\Admin\User;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * 记录金币日志
     * @param $app_id
     * @param $receiveCoin
     * @param $uid
     * @param $operate
     * @param $type
     * @return bool
     */
    protected function recordCoinLog($app_id, $receiveCoin, $uid, $operate, $type)
    {
        if (CoinsLog::create(['coin' => $receiveCoin, 'uid' => $uid, 'operate' => $operate, 'app_id' => $app_id, 'type' => $type])) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @param $uid
     * @param $app_id
     * @param $receiveCoin
     * @return bool
     */
    protected function addUserCoin($app_id, $uid, $receiveCoin)
    {
        $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->first();
        $userInfo->coins = $userInfo->coins + $receiveCoin;
        if ($userInfo->save()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @param $app_id
     * @param $uid
     * @param $reduceCoin
     * @return bool bool
     * bool
     */
    protected function reduceUserCoin($app_id, $uid, $reduceCoin)
    {
        $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->first();
        $userInfo->coins = $userInfo->coins - $reduceCoin;
        if ($userInfo->save()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取应用背景颜色和名称
     * @param $app_id
     * @return mixed
     */
    protected function getAppInfoData($app_id)
    {
        $appInfoData = AppInfo::where('app_id', $app_id)->get(['bg_color', 'app_name','image_url'])->toArray();
        if (!empty($appInfoData)) {
            return $appInfoData[0];
        }
    }

    /**
     * 图片上传类
     * @param $pic
     * @return string
     */
    protected function uploadImg($pic)
    {
        $name = $pic->getClientOriginalName();//得到图片名；
        $ext = $pic->getClientOriginalExtension();//得到图片后缀；
        $fileName = md5(uniqid($name));
        $fileName = $fileName . '.' . $ext;//生成新的的文件名
        $save_path = './upload/image/';
        $ymd = date("Ymd");
        $save_path .= $ymd . "/";
        if (!file_exists($save_path)) {
            mkdir($save_path);
        }
        if ($pic->move($save_path, $fileName)) {
            $save_url = $save_path . $fileName;
        }
        return empty($save_url) ? '' : $save_url;
    }

}
