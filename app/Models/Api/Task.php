<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/21
 * Time: 10:53
 */

namespace App\Models\API;

use App\Http\Enum\AppKey;
use App\Http\Enum\TaskType;
use App\Http\Enum\UserKey;
use App\Models\Admin\AppInfo;
use App\Models\Admin\Category;
use App\Models\Admin\Sign;
use App\Models\Admin\Task as TaskModel;
use App\Models\Admin\User;
use App\Models\Admin\UserTask;
use App\Models\Admin\VerifyUser;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    /**
     * 根据类型获取任务
     * @param $type
     * @param $app_id
     * @param $count
     * @return string
     */
    public static function getTaskByType($type, $uid, $app_id, $count)
    {
        $aid = AppInfo::where('app_id', $app_id)->first()->id;
        $childArr = Category::where('app_info_id', $aid)->get(['id'])->toArray();
        if (!empty($type)) {
            if ($type == 'new') {
                $where = 1;
            } elseif ($type == 'everyday') {
                $where = 2;
            } elseif ($type == 'forever') {
                $where = 3;
            }
            $lists = TaskModel::whereIn('catid', $childArr)
                ->where('type', $where)
                ->where('status', 1)
                ->orderBy('created_at', 'desc')
                ->limit($count)
                ->get(['id', 'title', 'reward_coin', 'description', 'type', 'task_mark', 'request_type', 'button_title'])
                ->toArray();
        } else {
            $lists = TaskModel::whereIn('catid', $childArr)
                ->where('status', 1)
                ->orderBy('created_at', 'desc')
                ->limit($count)
                ->get(['id', 'title', 'reward_coin', 'description', 'type', 'task_mark', 'request_type', 'button_title'])
                ->toArray();
            $where = 'all';
        }

        $lists = self::checkStatus($where, $lists, $uid, $app_id);
        return json_encode($lists);
    }

    /**
     * 检测当前用户是否做过任务,给予状态
     * @param $where
     * @param $lists
     * @param $uid
     * @return mixed
     */
    private static function checkStatus($where, $lists, $uid, $app_id)
    {
        if ($where == TaskType::New_type) {
            foreach ($lists as $key => $val) {
                if ($app_id == AppKey::Tw_key && $val['id'] == 8) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                } elseif ($app_id == AppKey::Sdtt_key && $val['id'] == 19) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                }
                $data = UserTask::where('uid', $uid)->where('tid', $val['id'])->get()->toArray();
                if ($data) {
                    $lists[$key]['status'] = 'ok';
                } else {
                    $lists[$key]['status'] = 'no';
                }
            }
        } elseif ($where == TaskType::Day_type) {
            foreach ($lists as $key => $val) {
                if ($app_id == AppKey::Tw_key && $val['id'] == 8) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                } elseif ($app_id == AppKey::Sdtt_key && $val['id'] == 19) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                }
                $ling_time = strtotime(date('Ymd'));
                $data = UserTask::where('created_at', '>', $ling_time)->where('uid', $uid)->where('tid', $val['id'])->get()->toArray();
                if ($data) {
                    $lists[$key]['status'] = 'ok';
                } else {
                    $lists[$key]['status'] = 'no';
                }
            }
        } elseif ($where == 'all') {
            foreach ($lists as $key => $val) {
                if ($app_id == AppKey::Tw_key && $val['id'] == 8) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                } elseif ($app_id == AppKey::Sdtt_key && $val['id'] == 19) {
                    self::checkVerifyStatus($app_id, $uid, $val['id']);
                }
                if ($val['type'] == TaskType::Day_type) {
                    $ling_time = strtotime(date('Ymd'));
                    $data = UserTask::where('created_at', '>', $ling_time)->where('uid', $uid)->where('tid', $val['id'])->get()->toArray();
                    if ($data) {
                        $lists[$key]['status'] = 'ok';
                    } else {
                        $lists[$key]['status'] = 'no';
                    }
                } elseif ($val['type'] == TaskType::New_type) {
                    $data = UserTask::where('uid', $uid)->where('tid', $val['id'])->get()->toArray();
                    if ($data) {
                        $lists[$key]['status'] = 'ok';
                    } else {
                        $lists[$key]['status'] = 'no';
                    }
                }
            }
        }

        return $lists;
    }

    /**
     * 获取签到奖励金币
     * @param $app_key
     * @return array|int
     */
    public static function getRewardByAppID($app_key)
    {
        //获取app_id对应app_info 中的 ID值
        $app_id = AppInfo::where('app_id', $app_key)->get(['id'])->toArray()[0];
        $signInfos = Sign::where('app_id', $app_id['id'])->get()->toArray();
        if (!empty($signInfos)) {
            return explode(',', $signInfos[0]['reward_coin']);
        }
        return 0;
    }


    public static function checkVerifyStatus($app_id, $uid, $tid)
    {
        $verifyData = VerifyUser::where('app_id', $app_id)->where('uid', $uid)->get()->toArray();
        //获取此用户是否做过该任务
        $taskData = UserTask::where('uid', $uid)->where('tid', $tid)->get()->toArray();
        if (!empty($taskData)) {
            //证明已经做过
            return;
        }
        if (!empty($verifyData[0]['wxpay_account']) && !empty($verifyData[0]['unionid'])) {
            //证明是已经完成认证那么要完成这个任务
            $apiTask = new \App\Http\Controllers\Api\TaskController();
            $apiTask->completeTask($tid, false, $uid);
            $userData = User::where('uid', $uid)->where('app_id', $app_id)->first();
            $updateData['status'] = UserKey::WxPay;
            $userData->update($updateData);
            return;
        } else {
            return;
        }
    }
}