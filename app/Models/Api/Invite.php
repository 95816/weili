<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/5
 * Time: 11:08
 */

namespace App\Models\API;


use App\Models\Admin\AppInfo;

class Invite
{
    /**
     * app_id 是appInfo 的主键id,对应
     * @param $app_key
     * @param $type
     * @param $num
     * @return int
     */
    public static function getCoinByNum($app_key, $type, $num)
    {
        $app_id = AppInfo::where('app_id', $app_key)->get(['id'])->toArray()[0];
        $inviteInfos = \App\Models\Admin\Invite::where('app_id', $app_id['id'])->where('type', $type)->get()->toArray();
        if (!empty($inviteInfos)) {
            $inviteInfos[0]['invite_coin_arr'] = explode(',', $inviteInfos[0]['invite_coin_arr']);

            if ($type == 1) {
                $returnCoin['currentUserCoin'] = $inviteInfos[0]['invite_coin_arr'][0];
                $returnCoin['first_extra_coin'] = $inviteInfos[0]['first_extra_coin'];
            } else {
                $returnCoin = $inviteInfos[0]['invite_coin_arr'][0];
            }

            /*if ($type == 1 && $num == 0) {
                //$returnCoin['inviteUserCoin'] = $inviteInfos[0]['first_extra_coin'] + $inviteInfos[0]['invite_coin_arr'][$num];
                $returnCoin['currentUserCoin'] = $inviteInfos[0]['invite_coin_arr'][$num];
                $returnCoin['first_extra_coin'] = $inviteInfos[0]['first_extra_coin'];
            } else {
                $returnCoin = $inviteInfos[0]['invite_coin_arr'][$num];
            }*/
        } else {
            $returnCoin = 0;
        }

        return $returnCoin;
    }

    /**
     * 根据app和类型获取具体奖励金币
     * @param $app_key
     * @param $type
     * @return int
     */
    public static function getRewardByType($app_key, $type)
    {
        //获取app_id对应app_info 中的 ID值
        $app_id = AppInfo::where('app_id', $app_key)->get(['id'])->toArray()[0];
        $inviteInfos = \App\Models\Admin\Invite::where('app_id', $app_id['id'])->where('type', $type)->get()->toArray();
        if (!empty($inviteInfos)) {
            return explode(',', $inviteInfos[0]['invite_coin_arr']);
        }
        return 0;

    }
}