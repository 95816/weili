<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/6
 * Time: 14:11
 */

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Http\Enum\Operate;
use App\Models\Admin\CoinsLog;
use App\Models\Admin\User;
use App\Service\Token;
use Illuminate\Http\Request;

class CoinController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     * @throws \App\Exceptions\TokenException
     */
    public function userCoin(Request $request)
    {
        //获取真实的用户id
        $input = $request->all('get.');
        if (empty($input['token'])) {
            throw new UserException([
                'errorCode' => 20005,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        //获取app_id是为了效验token
        $uid = Token::getCurrentTokenVar('uid', false, $input['token']);
        $app_id = Token::getCurrentTokenVar('app_id', false, $input['token']);
        //今日金币
        $currentDayTime = strtotime(date('Ymd'));
        $today_task_record = CoinsLog::where('uid', $uid)
            ->where('app_id', $app_id)
            ->where('created_at', '>', $currentDayTime)
            ->where('operate', Operate::add)
            ->get()->toArray();
        $today_coins = 0;
        foreach ($today_task_record as $key => $val) {
            $today_coins += $val['coin'];
        }
        //剩余金币 ,零钱余额
        $remain = User::where('uid', $uid)->where('app_id', $app_id)->get(['coins', 'money'])->toArray();
        //总共获得金币
        $userAddCoins = CoinsLog::where('uid', $uid)->where('app_id', $app_id)->where('operate', Operate::add)->get(['coin'])->toArray();
        $totalCoins = 0;
        foreach ($userAddCoins as $kk => $vv) {
            $totalCoins += $vv['coin'];
        }
        //获取历史十条金币明细
        $lastTen = CoinsLog::where('uid', $uid)
            ->where('app_id', $app_id)
            ->orderBy('id', 'desc')
            //->where('created_at', '>', $currentDayTime)
            ->limit(10)
            ->get();
        $mark = isset($input['mark']) ? $input['mark'] : 'coin';
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        return view('Api.user.coin_page', ['today_coins' => $today_coins, 'remain_coin' => $remain[0]['coins'],
                'money' => $remain[0]['money'],
                'lastTen' => $lastTen,
                'mark' => $mark,
                'totalCoins' => $totalCoins,
                'token' => $input['token'],
                'appInfoData' => $appInfoData]
        );
    }
}