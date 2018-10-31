<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/8
 * Time: 10:46
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Enum\Operate;
use App\Http\Enum\TaskType;
use App\Models\Admin\CoinsLog;
use App\Models\Admin\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ConvertController extends Controller
{
    /**
     * @param Request $request
     * @throws UserException
     */
    public function CoinToBalance(Request $request)
    {
        $input = $request->all('get.');
        $key = $input['key'];
        if (empty($key)) {
            throw new UserException([
                'errorCode' => 50001,
                'code' => 403,
                'msg' => '必须在url中携带app_key值!'
            ]);
        }
        $this->HandleConvert($key);


    }

    /**
     * 处理兑换流程
     * @param $key
     * @throws \Exception
     */
    private function HandleConvert($key)
    {
        $user_lists = User::where('app_id', $key)->orderBy('id', 'desc')->get()->toArray();
        //查询每个人还剩多少金币
        foreach ($user_lists as $k => &$v) {
            $userAddCoins = CoinsLog::where('uid', $v['uid'])->where('app_id', $key)->where('operate', Operate::add)->get(['coin'])->toArray();
            $addCoins = $reduceCoins = 0;
            foreach ($userAddCoins as $kk => $vv) {
                $addCoins += $vv['coin'];
            }
            $userReduceCoins = CoinsLog::where('uid', $v['uid'])->where('app_id', $key)->where('operate', Operate::reduce)->get(['coin'])->toArray();
            foreach ($userReduceCoins as $kk => $vv) {
                $reduceCoins += $vv['coin'];
            }
            $v['remain_coin'] = $addCoins - $reduceCoins;
            DB::beginTransaction();
            try {
                //记录金币日.此次为减金币操作.
                if ($v['remain_coin'] != 0) {
                    $this->recordCoinLog($key, $v['remain_coin'], $v['uid'], Operate::reduce, TaskType::Convert_type);
                }
                //更新用户所剩金币
                $this->reduceUserCoin($key, $v['uid'], $v['remain_coin']);
                //账户余额新增
                $this->addUserMoney($key, $v['uid'], number_format($v['remain_coin'] / 10000, 2));
                DB::commit();
            } catch (\Exception $exception) {
                DB::rollBack();
                throw $exception;
            }
        }
        $result = [
            'status' => 0,
            'msg' => 'success!',
        ];
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }

    /**
     * 更新账户余额
     * @param $app_id
     * @param $uid
     * @param $money
     */
    private function addUserMoney($app_id, $uid, $money)
    {
        $userInfo = User::where('uid', $uid)->where('app_id', $app_id)->first();
        $userInfo->money = $userInfo->money + $money;
        $userInfo->save();
    }
}