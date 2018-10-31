<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/14
 * Time: 16:03
 */

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\Admin\News;
use App\Models\Admin\UserMoney;
use App\Service\Token;
use Illuminate\Http\Request;

class PickController extends Controller
{
    public function process(Request $request)
    {
        $token = $request->input('token');
        //获取app_id和uid
        $uid = Token::getCurrentTokenVar('uid', false, $token);
        $app_id = Token::getCurrentTokenVar('app_id', false, $token);
        //查询今天是否已经提现过.如有提现.则不允许在提现
        $todayMoneyData = UserMoney::where('app_id', $app_id)->where('uid', $uid)->orderBy('created_at', 'desc')->limit(1)->get()->toArray();
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        if (empty($todayMoneyData)) {
            return view('Api.pick.process_no', ['appInfoData' => $appInfoData]);
        } else {
            return view('Api.pick.process', ['data' => $todayMoneyData[0], 'appInfoData' => $appInfoData]);
        }
    }

    public function pickPage()
    {
        //获取id为9的文章
        $helpNews = News::where('id', 9)->get()->toArray();
        $content = htmlspecialchars_decode($helpNews[0]['description']);

        return view('Api.problem.pick_page', ['news' => $content]);
    }


}