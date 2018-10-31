<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/6
 * Time: 16:34
 */

return [
    'login_success' => [
        'code' => 1,
        'msg' => '登录成功',
        'wait' => 3,
        'url' => '/admin/index'
    ],
    'code_fail' => [
        'code' => 0,
        'msg' => '验证码错误！',
        'wait' => 3,
        'url' => '/admin/login'
    ],
    'admin_no' => [
        'code' => 0,
        'msg' => '登录失败,账号错误或被禁用！',
        'wait' => 3,
        'url' => '/admin/login'
    ],
    'admin_add_success' => [
        'code' => 1,
        'msg' => '新增管理员成功',
        'wait' => 3,
        'url' => '/admin/lists'
    ],
    'admin_add_fail' => [
        'code' => 0,
        'msg' => '新增管理员失败',
        'wait' => 3,
        'url' => '/admin/add'
    ],
    'admin_edit_success' => [
        'code' => 1,
        'msg' => '修改管理员成功',
        'wait' => 3,
        'url' => '/admin/lists'
    ],
    'app_apply_success' => [
        'code' => 1,
        'msg' => '申请成功',
        'wait' => 3,
        'url' => '/admin/app/show'
    ],
];