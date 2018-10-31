<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/6
 * Time: 17:45
 */

namespace App\Http\Controllers\Api;


use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use App\Http\Enum\AppKey;
use App\Http\Enum\UserKey;
use App\Models\Admin\User;
use App\Models\Admin\VerifyUser;
use App\Service\Token;
use Illuminate\Http\Request;

class VerifyController extends Controller
{
    /**
     * 认证支付宝微信界面
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     * @throws \App\Exceptions\TaskException
     */
    public function verifyPage(Request $request)
    {
        $input = $request->all('get.');
        if (empty($input['token'])) {
            throw new UserException([
                'errorCode' => 20005,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        //获取app_id和uid
        $uid = Token::getCurrentTokenVar('uid', false, $input['token']);
        $app_id = Token::getCurrentTokenVar('app_id', false, $input['token']);
        //根据app_id 获取name和bg_color
        $appInfoData = $this->getAppInfoData($app_id);
        if ($input['type'] == 'alipay') {
            //支付宝
            if (!$this->checkVerify($uid, $app_id, 'alipay')) {
                return view('Api.verify.had_alipage', ['token' => $input['token']]);
            }
            return view('Api.verify.alipay_page', ['token' => $input['token'], 'appInfoData' => $appInfoData]);
        } elseif ($input['type'] == 'wxpay') {
            //微信
            if (!$this->checkVerify($uid, $app_id, 'wxpay')) {
                //完成一次任务
                if ($app_id == AppKey::Tw_key) {
                    $apiTask = new \App\Http\Controllers\Api\TaskController();
                    $apiTask->completeTask('8', false, $uid);
                } elseif ($app_id == AppKey::Sdtt_key) {
                    $apiTask = new \App\Http\Controllers\Api\TaskController();
                    $apiTask->completeTask('19', false, $uid);
                }
                return view('Api.verify.had_wxpage', ['token' => $input['token']]);
            }
            return view('Api.verify.wxpay_page', ['token' => $input['token'], 'appInfoData' => $appInfoData]);
        }

    }

    /**
     * 检测是否已经验证
     * @param $uid
     * @param $app_id
     * @param $type
     * @return bool
     */
    private function checkVerify($uid, $app_id, $type)
    {
        $res = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->get()->toArray();
        if (!empty($res)) {
            if ($type == 'alipay' && !empty($res[0]['alipay_account'])) {
                return false;
            } elseif ($type == 'wxpay' && !empty($res[0]['wxpay_account'])) {
                return false;
            }
        }
        return true;
    }

    /**
     * @param Request $request
     * @throws \App\Exceptions\TokenException
     * @throws \App\Exceptions\TaskException
     */
    public function userVerify(Request $request)
    {
        //获取真实姓名和身份证号码
        $realName = $request->input('realName');
        $idCard = $request->input('idCard');
        $type = $request->input('type');

        if ($type == 'alipay') {
            $account = $request->input('account');
        } elseif ($type == 'wxpay') {
            $unionid = $request->input('unionid');
        }

        $uid = Token::getCurrentTokenVar('uid');
        $app_id = Token::getCurrentTokenVar('app_id');

        //检测是否有其他人用过这个身份证
        $isHasIdCard = VerifyUser::where('uid', '!=', $uid)->where('app_id', $app_id)->where('id_card', $idCard)->get()->toArray();
        if (!empty($isHasIdCard)) {
            $result = [
                'msg' => '身份证已被认证过!',
                'code' => '401',
            ];
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
            return;
        }
        //判断是支付宝或是微信
        if ($type == 'alipay') {
            if (!$this->checkVerify($uid, $app_id, $type)) {
                $result = [
                    'msg' => '支付宝已认证成功,无需重复认证!',
                    'code' => '401',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }
        } elseif ($type == 'wxpay') {
            if (!$this->checkVerify($uid, $app_id, $type)) {
                $result = [
                    'msg' => '微信已认证成功!',
                    'code' => '401',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }
        }
        //匹配姓名
        if (!$this->checkUserName($realName)) {
            $result = [
                'msg' => '姓名格式不符!',
                'code' => '401',
            ];
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
            return;
        }
        //匹配身份证
        if (!$this->idcard_checksum18($idCard)) {
            $result = [
                'msg' => '身份证不正确!',
                'code' => '401',
            ];
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
            return;
        }
        //检验账户是否合法
        if ($type == 'alipay') {
            if (!($this->checkAliAccount($account) OR $this->checkPhone($account))) {
                $result = [
                    'msg' => '支付宝账号有误,请重新输入!',
                    'code' => '403',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }
            //验证全部通过.组装数据格式,写入数据库表
            $data['name'] = $realName;
            $data['id_card'] = $idCard;
            $data['alipay_account'] = $account;
            $data['uid'] = $uid;
            $data['app_id'] = $app_id;

            //更改当前用户的认证信息
            $userData = User::where('uid', $uid)->where('app_id', $app_id)->first();
            $updateData['status'] = UserKey::AliPay;

            //检查用户是否有过认证记录,如果有应该是更新,而不是写入
            $verifyData = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->first();
            if ($userData->update($updateData)) {
                //为空则写入
                if (empty($verifyData)) {
                    VerifyUser::create($data);
                } else {
                    $verifyUpdateData['alipay_account'] = $account;
                    $verifyData->update($verifyUpdateData);
                }
                //成功之时还要完成一次任务
                if ($app_id == AppKey::Tw_key) {
                    $apiTask = new \App\Http\Controllers\Api\TaskController();
                    $apiTask->completeTask('9', false, $uid, $app_id);
                } elseif ($app_id == AppKey::Sdtt_key) {
                    $apiTask = new \App\Http\Controllers\Api\TaskController();
                    $apiTask->completeTask('20', false, $uid, $app_id);
                }
                $result = [
                    'msg' => '认证支付宝成功!',
                    'code' => '200',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            } else {
                $result = [
                    'msg' => '认证支付宝失败!',
                    'code' => '400',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }

        } elseif ($type == 'wxpay') {
            if (empty($unionid)) {
                $result = [
                    'msg' => '微信认证失败!!',
                    'code' => '400',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }
            //验证全部通过.组装数据格式,写入数据库表

            $data['name'] = $realName;
            $data['id_card'] = $idCard;
            $data['unionid'] = $unionid;
            $data['uid'] = $uid;
            $data['app_id'] = $app_id;
            $userData = User::where('uid', $uid)->where('app_id', $app_id)->first();
            $updateData['status'] = UserKey::WxPay;
            //检查用户是否有过认证记录,如果有应该是更新,而不是写入
            $verifyData = VerifyUser::where('uid', $uid)->where('app_id', $app_id)->first();

            if ($userData->update($updateData)) {
                //为空则写入
                if (empty($verifyData)) {
                    VerifyUser::create($data);
                } else {
                    $verifyUpdateData['unionid'] = $unionid;
                    $verifyData->update($verifyUpdateData);
                }
                $result = [
                    'msg' => '认证微信第一步成功!',
                    'code' => '200',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            } else {
                $result = [
                    'msg' => '认证微信失败!',
                    'code' => '400',
                ];
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
                return;
            }
        }


    }


    /**
     *判断姓名是否全是中文
     */
    protected function checkUserName($name)
    {
        //新疆等少数民族可能有·
        if (strpos($name, '·')) {
            //将·去掉，看看剩下的是不是都是中文
            $name = str_replace("·", '', $name);
            if (preg_match('/^[\x7f-\xff]+$/', $name)) {
                return true;//全是中文
            } else {
                return false;//不全是中文
            }
        } else {
            if (preg_match('/^[\x7f-\xff]+$/', $name)) {
                return true;//全是中文
            } else {
                return false;//不全是中文
            }
        }

    }

    // 计算身份证校验码,根据国家标准GB 11643-1999
    protected function idcard_verify_number($idcard_base)
    {
        if (strlen($idcard_base) != 17) {
            return false;
        }
        // 加权因子
        $factor = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
        // 校验码对应值
        $verify_number_list = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        $checksum = 0;
        for ($i = 0; $i < strlen($idcard_base); $i++) {
            $checksum += substr($idcard_base, $i, 1) * $factor[$i];
        }
        $mod = $checksum % 11;
        $verify_number = $verify_number_list[$mod];
        return $verify_number;
    }

    // 将15位身份证升级到18位
    protected function idcard_15to18($idcard)
    {
        if (strlen($idcard) != 15) {
            return false;
        } else {
            // 如果身份证顺序码是996 997 998 999,这些是为百岁以上老人的特殊编码
            if (array_search(substr($idcard, 12, 3), array('996', '997', '998', '999')) !== false) {
                $idcard = substr($idcard, 0, 6) . '18' . substr($idcard, 6, 9);
            } else {
                $idcard = substr($idcard, 0, 6) . '19' . substr($idcard, 6, 9);
            }
        }
        $idcard = $idcard . $this->idcard_verify_number($idcard);
        return $idcard;
    }

    // 18位身份证校验码有效性检查
    protected function idcard_checksum18($idcard)
    {
        if (strlen($idcard) != 18) {
            return false;
        }
        $idcard_base = substr($idcard, 0, 17);
        if ($this->idcard_verify_number($idcard_base) != strtoupper(substr($idcard, 17, 1))) {
            return false;
        } else {
            return true;
        }
    }

    protected function checkAliAccount($account)
    {
        $pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
        if (preg_match($pattern, $account)) {
            return true;
        } else {
            return false;
        }
    }

    protected function checkPhone($phone)
    {

        if (preg_match("/^1[345678]{1}\d{9}$/", $phone)) {
            return true;
        } else {
            return false;
        }
    }

    //展示认证微信流程界面
    public function ProcessPage()
    {
        return view('Api.verify.process');
    }

    public function verifyCallback(Request $request)
    {
        $openid = $request->input('openid');
        $unionid = $request->input('unionid');
        if (empty($openid) || empty($unionid)) {
            $result = [
                'msg' => 'openid和unionid不可为空!',
                'code' => 403,
                'status' => 'no'
            ];
            return json_encode($result, JSON_UNESCAPED_UNICODE);
        }


        //查一下数据库里是否有unionid这个
        $verifyData = VerifyUser::where('unionid', $unionid)->get()->toArray();
        if (!empty($verifyData)) {
            foreach ($verifyData as $key => $val) {
                $verifyData = VerifyUser::where('uid', $val['uid'])->where('app_id', $val['app_id'])->first();
                $verifyUpdateData['wxpay_account'] = $openid;
                if ($verifyData->update($verifyUpdateData)) {
                    $result = [
                        'msg' => '认证成功!',
                        'code' => 200,
                        'status' => 'ok'
                    ];
                } else {
                    $result = [
                        'msg' => '认证失败!',
                        'code' => 400,
                        'status' => 'no'
                    ];
                }


            }
            //执行完成微信认证任务
        } else {
            $result = [
                'msg' => '不存在的用户信息!',
                'code' => 403,
                'status' => 'no'
            ];
        }
        return json_encode($result, JSON_UNESCAPED_UNICODE);
    }

}