<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/2
 * Time: 15:56
 */

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\Admin\Share;
use Illuminate\Http\Request;

class ShareController extends Controller
{
    public function getShareData(Request $request)
    {
        $shareData = Share::where('status', '1')->get(['id', 'title', 'url', 'image', 'content'])->toArray();
        return json_encode($shareData);
    }

    public function sharePage()
    {
        return view('Api.share.page');
    }
}