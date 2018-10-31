<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/8
 * Time: 15:22
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Pay\WxPay;
use App\Http\Enum\Operate;
use App\Http\Enum\TaskType;
use App\Models\Admin\AppInfo;
use App\Models\Admin\User;
use App\Models\Admin\UserMoney;
use App\Models\Admin\VerifyUser;
use App\Service\Token;
use Illuminate\Http\Request;

class PayController extends Controller
{
    /**
     * 提现页面
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     */
    public function applyPage(Request $request)
    {
        $token = $request->input('token');
        if (empty($token)) {
            throw new UserException([
                'errorCode' => 20005,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        //获取app_id和uid
        $uid = Token::getCurrentTokenVar('uid', false, $token);
        $app_id = Token::getCurrentTokenVar('app_id', false, $token);
        //获取支付宝和微信认证状态
        $verifyStatus = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->get(['alipay_account', 'wxpay_account'])->toArray();
        $alipayMark = $wxpayMark = null;
        if (!empty($verifyStatus)) {
            $alipayMark = $verifyStatus[0]['alipay_account'];
            $wxpayMark = $verifyStatus[0]['wxpay_account'];
        }
        //获取当前用户的金币余额
        /*$coins = 0;
        $userData = User::where('uid', $uid)->where('app_id', $app_id)->get(['coins'])->toArray();
        if (!empty($userData)) {
            $coins = $userData[0]['coins'];
        }*/
        $coins = $this->getRemainCoins($uid, $app_id);
        //查询今天是否已经提现过.如有提现.则不允许在提现
        /*$todayMoneyData = UserMoney::where('app_id', $app_id)->where('uid', $uid)->where('created_at', '>', strtotime(date('Ymd', time())))->get()->toArray();
        if (!empty($todayMoneyData)) {
            $submitMark = 1;
        } else {
            $submitMark = 0;
        }*/
        $submitMark = $this->checkHasConvert($uid, $app_id);
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        return view('Api.pay.page', ['alipayMark' => $alipayMark, 'wxpayMark' => $wxpayMark, 'token' => $token, 'coins' => $coins, 'sMark' => $submitMark, 'appInfoData' => $appInfoData]);
    }

    //获取当前用户的金币余额
    private function getRemainCoins($uid, $app_id)
    {
        $coins = 0;
        $userData = User::where('uid', $uid)->where('app_id', $app_id)->get(['coins'])->toArray();
        if (!empty($userData)) {
            $coins = $userData[0]['coins'];
        }
        return $coins;
    }

    //查询今天是否已经提现过.如有提现.则不允许在提现
    private function checkHasConvert($uid, $app_id)
    {
        $todayMoneyData = UserMoney::where('app_id', $app_id)->where('uid', $uid)->where('created_at', '>', strtotime(date('Ymd', time())))->get()->toArray();
        if (!empty($todayMoneyData)) {
            $submitMark = 1;
        } else {
            $submitMark = 0;
        }
        return $submitMark;
    }


    /**
     * 用户申请提现
     * @param Request $request
     * @throws \App\Exceptions\TokenException
     */
    public function userConvert(Request $request)
    {
        //获取提现金币数量
        $data['coins'] = $request->input('coins');
        $data['money'] = $request->input('money');
        $data['type'] = $request->input('type');
        //获取uid和app_id
        $data['uid'] = Token::getCurrentTokenVar('uid');
        $data['app_id'] = Token::getCurrentTokenVar('app_id');
        //生成订单号
        $data['order_no'] = $this->makeOrderNo();
        //再次检测金币是否符合提现要求
        $coins = $this->getRemainCoins($data['uid'], $data['app_id']);
        $submitMark = $this->checkHasConvert($data['uid'], $data['app_id']);
        if ($submitMark == 1 || $coins < $data['coins']) {
            $result = [
                'msg' => '申请提现失败,请重新尝试哦!',
                'code' => '401',
            ];
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
            return;
        }
        //减去对应的金币数量
        if (UserMoney::create($data) && $this->reduceUserCoin($data['app_id'], $data['uid'], $data['coins']) && $this->recordCoinLog($data['app_id'], $data['coins'], $data['uid'], Operate::reduce, TaskType::Convert_type)) {
            $result = [
                'msg' => '申请提现成功!',
                'code' => '200',
            ];
        } else {
            $result = [
                'msg' => '申请提现失败,请重新尝试!',
                'code' => '401',
            ];
        }
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
        return;
    }

    private function makeOrderNo()
    {
        $yCode = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
        $orderSn = $yCode[intval(date('Y') - 2018)] . strtoupper(dechex(date('m'))) .
            date('d') . substr(time(), -5) . substr(microtime(), 2, 5) .
            sprintf('%02d', rand(0, 99));
        return $orderSn;
    }

    public function checkRedPacket(Request $request)
    {
        $app_key = $request->input('app_key');
        $app_id = $request->input('app_id');
        $appInfo = AppInfo::where('app_key', $app_key)->where('app_id', $app_id)->get()->toArray();
        if (empty($appInfo)) {
            dd('错误的参数信息,请联系管理员!');
        }
        //获取所有已发放订单的状态(不找关闭状态的并且是关闭状态);
        $allDatas = UserMoney::where('app_id', $app_id)
            ->where('is_send', 1)
            ->where('is_get', 0)
            ->where('is_close', 0)->get()->toArray();
        $wxPay = new WxPay();
        foreach ($allDatas as $key => $val) {
            $red_packet_status = $wxPay->hongbao_query($val['order_no']);
            //失败和退款状态
            if ($red_packet_status['status'] == 'FAILED' || $red_packet_status['status'] == 'RFUND_ING' || $red_packet_status['status'] == 'REFUND') {
                //将is_get 状态改为2.即失败/为领取,然后把此刻的订单中的金币返回回去
                $this->updateStatus($red_packet_status['mch_billno'], 2);
            } elseif ($red_packet_status['status'] == 'RECEIVED') {
                //将is_get 状态改为1,即成功领取.
                $this->updateStatus($red_packet_status['mch_billno'], 1);
            }
            //dd($red_packet_status);
        }
        dd('检查完成!');

    }

    public function updateStatus($order_no, $status)
    {
        $order_info = UserMoney::where('order_no', $order_no)->first();
        $order_info->is_get = $status;

        if ($status == 2) {
            //返回用户金币
            if ($this->addUserCoin($order_info->app_id, $order_info->uid, $order_info->coins) && $order_info->save() && $this->recordCoinLog($order_info->app_id, $order_info->coins, $order_info->uid, Operate::add, 9)) {
                return true;
            } else {
                return false;
            }

        } else {
            if ($order_info->save()) {
                return true;
            } else {
                return false;
            }
        }
    }
}