<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/10
 * Time: 10:41
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\UserMoney;
use Illuminate\Http\Request;
use App\Http\Controllers\Pay\WxPay;


class WithdrawController extends Controller
{
    public function lists(Request $request)
    {
        $lists = UserMoney::orderBy('created_at', 'desc')->paginate(15);

        //获取支付账号
        $res = UserMoney::handleAccount($lists);

        return view('Admin.withdraw.show', ['lists' => $res]);
    }

    //发红包
    public function send_packet(Request $request)
    {
        //type为1是微信,2是支付宝
        $type = $request->input('type');
        //获取提现账号
        $account = $request->input('account');
        //红包金额
        $money = $request->input('money');
        //订单号
        $order_no = $request->input('order_no');

        $wxPay = new WxPay();


        //1.发送 红包
        if ($type == 1) {
            $wxOrder = $wxPay->send_hongbao('创游科技', $account, $order_no, $_SERVER["REMOTE_ADDR"], $money, '恭喜发财', '恭喜发财', '多看多得到!', 'PRODUCT_2');
            if ($wxOrder->return_code != 'SUCCESS' || $wxOrder->result_code != 'SUCCESS') {
                $result = [
                    'code' => 403,
                    'msg' => '发放红包失败!',
                    'wxRes' => $wxOrder,
                ];
            } else {
                //更改申请状态为已发放
                $data = UserMoney::where('order_no', $order_no)->first();
                $data->is_send = 1;
                if ($data->save()) {
                    $result = [
                        'code' => 200,
                        'msg' => '发放红包成功!',
                        'wxRes' => $wxOrder,
                    ];
                } else {
                    $result = [
                        'code' => 401,
                        'msg' => '发放红包失败!',
                        'wxRes' => $wxOrder,
                    ];
                }
            }
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
        }
    }

    //管理员拒发
    public function reject_packet(Request $request)
    {
        //订单号
        $order_no = $request->input('order_no');
        //更改申请状态为已发放
        $data = UserMoney::where('order_no', $order_no)->first();
        $data->is_close = 1;
        if ($data->save()) {
            $result = [
                'code' => 200,
                'msg' => '处理成功!',
            ];
        } else {
            $result = [
                'code' => 401,
                'msg' => '处理失败!',
            ];
        }
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }
}