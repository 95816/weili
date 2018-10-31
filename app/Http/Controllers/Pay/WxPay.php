<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/10
 * Time: 14:38
 */

namespace App\Http\Controllers\Pay;

/**
 *微信红包发放，用于微信公众号向用户发放红包用
 **/
class WxPay
{
    protected $mchid;//微信支付分配的商户号
    protected $appid;//微信分配的公众账号ID
    protected $apiKey;//微信分配的公众账号密钥

    public function __construct()
    {
        $this->mchid = '1503452921';
        $this->appid = 'wxfe4411b6a3b6d592';
        $this->apiKey = 'uiorqjlUOUJJi42380IOJREWQfdafsdf';
    }

    /**
     *发放红包
     * @parma string $sendName 红包发送者名称
     * @parma string $openid 接受红包的用户openid
     * @parma string $ip 用户客户端IP
     * @parma string $outTradeNo 红包订单号
     * @parma string $totalAmount 付款金额，单位分
     * @parma string $wishing 红包祝福语：感谢您参加猜灯谜活动，祝您元宵节快乐！
     * @parma string $actName 活动名称:参加任务红包现金兑换
     * @parma string $remark 备注
     * @parma string $sceneId 红包场景 PRODUCT_1:商品促销 PRODUCT_2:抽奖 PRODUCT_3:虚拟物品兑奖 PRODUCT_4:企业内部福利 PRODUCT_5:渠道分润 PRODUCT_6:保险回馈 PRODUCT_7:彩票派奖 PRODUCT_8:税务刮奖
     **/
    public function send_hongbao($sendName, $openid, $outTradeNo, $ip, $totalAmount, $wishing, $actName, $remark, $sceneId)
    {
        $config = array(
            'mch_id' => $this->mchid,
            'appid' => $this->appid,
            'key' => $this->apiKey,
        );
        $parameter = array(
            'wxappid' => $config['appid'],
            'send_name' => $sendName,
            'mch_id' => $config['mch_id'],
            'nonce_str' => self::create_random_string(),  //随机字符串，不长于32位
            're_openid' => $openid,
            'mch_billno' => $outTradeNo,
            'client_ip' => $ip,
            'total_amount' => intval($totalAmount * 100),       //单位 转为分
            'total_num' => 1,                 //红包发放总人数
            'wishing' => $wishing,            //红包祝福语
            'act_name' => $actName,           //活动名称
            'remark' => $remark,            //备注信息，如为中文注意转为UTF8编码
            'scene_id' => $sceneId,      //发放红包使用场景，红包金额大于200时必传。https://pay.weixin.qq.com/wiki/doc/api/tools/cash_coupon.php?chapter=13_4&index=3
        );
        $parameter['sign'] = self::get_sign($parameter, $config['key']);

        $responseXml = $this->curl_Post('https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack', self::array2xml($parameter));
        $parameterOrder = simplexml_load_string($responseXml, 'SimpleXMLElement', LIBXML_NOCDATA);
        return $parameterOrder;
        /*echo "<pre>";
        print_r($parameterOrder);
        if ($parameterOrder === false) {
            die('parse xml error');
        }
        if ($parameterOrder->return_code != 'SUCCESS') {
            die($parameterOrder->return_msg);
        }
        if ($parameterOrder->result_code != 'SUCCESS') {
            die($parameterOrder->err_code);
        }
        return true;*/

    }

    /**
     *查看红包记录，用于查看红包是否领取，未领取则返还余额
     * @parma string $outTradeNo 红包订单号
     **/
    public function hongbao_query($outTradeNo = '')
    {
        $config = array(
            'mch_id' => $this->mchid,
            'appid' => $this->appid,
            'key' => $this->apiKey,
        );
        $parameter = array(
            'appid' => $config['appid'],
            'mch_id' => $config['mch_id'],
            'nonce_str' => self::create_random_string(),  //随机字符串，不长于32位
            'mch_billno' => $outTradeNo,
            'bill_type' => ''
        );
        $parameter['sign'] = self::get_sign($parameter, $config['key']);
        $responseXml = $this->curl_Post('https://api.mch.weixin.qq.com/mmpaymkttransfers/gethbinfo', self::array2xml($parameter));
        $parameterOrder = simplexml_load_string($responseXml, 'SimpleXMLElement', LIBXML_NOCDATA);
        $parameterOrder = $this->xml2array($parameterOrder);
        return $parameterOrder;
    }

    /**
     *模拟post提交表单
     * @parma string $url 提交地址
     * @parma xml 参数
     * @parma array $options
     **/
    public function curl_Post($url = '', $postData = '', $options = array())
    {

        if (is_array($postData)) {//如果参数是数组格式就生成url地址 & 连接的url参数格式
            $postData = http_build_query($postData);
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30); //设置cURL允许执行的最长秒数
        if (!empty($options)) {
            curl_setopt_array($ch, $options);
        }
        //https请求 不验证证书和host
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        //第一种方法，cert 与 key 分别属于两个.pem文件
        //默认格式为PEM，可以注释
        curl_setopt($ch, CURLOPT_SSLCERTTYPE, 'PEM');
        curl_setopt($ch, CURLOPT_SSLCERT, getcwd() . '/certificate/apiclient_cert.pem');
        //默认格式为PEM，可以注释
        curl_setopt($ch, CURLOPT_SSLKEYTYPE, 'PEM');
        curl_setopt($ch, CURLOPT_SSLKEY, getcwd() . '/certificate/apiclient_key.pem');
        //第二种方式，两个文件合成一个.pem文件
        //curl_setopt($ch,CURLOPT_SSLCERT,getcwd().'/all.pem');
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    /**
     *生成签名 详见签名算法 https://pay.weixin.qq.com/wiki/doc/api/tools/cash_coupon.php?chapter=4_3
     * @parma array $params 参数信息用于生成签名
     * @parma string $key 加密Key
     **/
    public static function get_sign($params, $key)
    {
        ksort($params, SORT_STRING);//把参数进行升序排序
        $unSignParaString = self::format_query_para_map($params, false);
        $signStr = strtoupper(md5($unSignParaString . "&key=" . $key));
        return $signStr;
    }

    /**
     *把数组转成url参数格式
     * @parma array $paraMap 参数数组
     * @parma bool $urlEncode 是否使用urlencode转码
     **/
    protected static function format_query_para_map($paraMap, $urlEncode = false)
    {
        $buff = "";
        ksort($paraMap);
        foreach ($paraMap as $k => $v) {
            if (null != $v && "null" != $v) {
                if ($urlEncode) {
                    $v = urlencode($v);
                }
                $buff .= $k . "=" . $v . "&";
            }
        }
        $reqPar = '';
        if (strlen($buff) > 0) {
            $reqPar = substr($buff, 0, strlen($buff) - 1);
        }
        return $reqPar;
    }

    /**
     *把数组转成XML参数格式
     * @parma array $arr 参数数组
     **/
    public static function array2xml($arr = array())
    {
        $xml = "<xml>";
        foreach ($arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
        }
        $xml .= "</xml>";
        return $xml;
    }

    /**
     *把XML转成数组参数格式
     * @parma xml $simxml 参数xml
     **/
    public function xml2array($simxml)
    {
        $simxml = (array)$simxml;//强转
        foreach ($simxml as $k => $v) {
            if (is_array($v) || is_object($v)) {
                $simxml[$k] = $this->xml2array($v);
            }
        }
        return $simxml;
    }

    /**
     *用于生成随机字符
     * @parma int $length 随机数长度
     **/
    public static function create_random_string($length = 16)
    {
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $str = '';
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }
}

//$obj = new WxPay();
//if ($_GET['order_no']) {
//    //查询红包状态
//    /**
//     *status状态解释
//     *SENDING:发放中
//     *SENT:已发放待领取
//     *FAILED：发放失败
//     *RECEIVED:已领取
//     *RFUND_ING:退款中
//     *REFUND:已退款
//     **/
//    $queryArr = $obj->hongbao_query($_GET['order_no']);
//    echo "<pre>";
//    print_r($queryArr);
//} else {
//    $openid = 'o-p2twLeTJQQ5sGzCGurFQ-R4dvg';
//    $sendName = '创游';
//    $outTradeNo = time();
//    $ip = '127.0.0.1';
//    $totalAmount = '1';
//    $wishing = '恭喜1';
//    $actName = '恭喜2';
//    $remark = 'gongxi';
//    $obj->send_hongbao($sendName, $openid, $outTradeNo, $ip, $totalAmount, $wishing, $actName, $remark, 'PRODUCT_2');
//
//}