<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;

class HongbaoController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
		$nonce_str = MD5(time().'chuangyou');//随机字符串，不长于32位
		$sign = '';//签名
		$mch_billno = date('YmdHis').rand(1000,9999);//商户订单号（每个订单号必须唯一。取值范围：0~9，a~z，A~Z） 
		$mch_id = '1503452921';//微信支付分配的商户号
		$wxappid = 'wxfe4411b6a3b6d592';//公众账号appid
		$send_name = '听玩游戏宝';//商户名称
		$re_openid = '';//接受红包的用户openid 
		$total_amount = '10';//付款金额，单位分
		$total_num = 1;//红包发放总人数
		$wishing = '听玩游戏宝祝你游戏快乐';//红包祝福语
		$client_ip = '';//调用接口的机器Ip地址
		$act_name = '现金提现';//活动名称
		$remark = '听玩游戏宝祝你游戏快乐';//备注信息




    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function send()
    {
        echo "hongbao";
    }

	/**
	*微信获取CODE
	**/
	public function weixin_get_code() {
		$appid = 'wxfe4411b6a3b6d592';
		$redirect_uri = 'http://newadmin.tingwan.com/hongbao';
		echo $codeUrl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.urlencode($redirect_uri)."&response_type=code&scope=snsapi_base&state=123654#wechat_redirect ";
		//$return = file_get_contents($codeUrl);
		echo "<pre>";
		print_r($return);
	}

	/**
	*获取微信用户信息
	*/
	public function weixin_user_info() {
		$appid = 'wxfe4411b6a3b6d592';
		$secret = "dc91ce3a48f967a63449943efd226128";
		
		

		$code = $_GET["code"];
		$get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid.'&secret='.$secret.'&code='.$code.'&grant_type=authorization_code';
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$get_token_url);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		$res = curl_exec($ch);
		curl_close($ch);
		$json_obj = json_decode($res,true);
		//根据openid和access_token查询用户信息
		$access_token = $json_obj['access_token'];
		$openid = $json_obj['openid'];
		$get_user_info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$access_token.'&openid='.$openid.'&lang=zh_CN';
		 
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$get_user_info_url);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		$res = curl_exec($ch);
		curl_close($ch);
		 
		//解析json
		$user_obj = json_decode($res,true);
		$_SESSION['user'] = $user_obj;
		print_r($user_obj); 
	}
}
