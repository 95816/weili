<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//后台首页

Route::get('/', ['uses' => 'Admin\AdminController@index'])->middleware('check_login');
//公共跳转路由
Route::get('jump', ['uses' => 'Jump\JumpController@index']);
//验证码路由
Route::get('captcha/{tmp}', ['uses' => 'codeController@captcha']);

//Admin routes
Route::group(['prefix' => 'admin', 'middleware' => ['check_login']], function () {
    Route::get('index', ['uses' => 'Admin\AdminController@index']);
    Route::any('login', ['uses' => 'Admin\AdminController@login']);
    Route::any('lists', ['uses' => 'Admin\AdminController@lists']);
    Route::any('create', ['uses' => 'Admin\AdminController@create']);
    Route::any('edit/{id}', ['uses' => 'Admin\AdminController@edit'])->where(['id' => '\d+']);
    Route::post('delete', ['uses' => 'Admin\AdminController@delete']);
    Route::post('admin_status', ['uses' => 'Admin\AdminController@admin_status']);
    Route::any('logout', ['uses' => 'Admin\AdminController@logout']);
    Route::any('app/show', ['uses' => 'Admin\AppInfoController@show']);
    Route::any('app/apply', ['uses' => 'Admin\AppInfoController@apply']);
    Route::any('category', ['uses' => 'Admin\CategoryController@init']);
    Route::any('category/create', ['uses' => 'Admin\CategoryController@create']);
    Route::post('category/cate_list', ['uses' => 'Admin\CategoryController@cate_list']);
    Route::any('category/edit/id/{id}', ['uses' => 'Admin\CategoryController@edit'])->where(['id' => '\d+']);
    Route::any('category/delete', ['uses' => 'Admin\CategoryController@delete']);
    Route::any('task/show/{id?}', ['uses' => 'Admin\TaskController@show'])->where(['id' => '\d+']);
    Route::any('task/create', ['uses' => 'Admin\TaskController@create']);
    Route::any('task/edit', ['uses' => 'Admin\TaskController@edit']);
    Route::post('task/delete', ['uses' => 'Admin\TaskController@delete']);
    Route::post('task/delete_all', ['uses' => 'Admin\TaskController@delete_all']);
    Route::post('task_status', ['uses' => 'Admin\TaskController@task_status']);

    Route::any('user/lists', ['uses' => 'Admin\UserController@lists']);
    Route::any('task/do_lists', ['uses' => 'Admin\TaskController@do_lists']);

    Route::any('invite/set', ['uses' => 'Admin\InviteController@set_invite']);
    Route::any('sign/set', ['uses' => 'Admin\SignController@set_sign']);

    Route::any('coins/show', ['uses' => 'Admin\CoinsController@lists']);

    //文章系统
    Route::any('news/show', ['uses' => 'Admin\NewsController@lists']);
    Route::any('news/create', ['uses' => 'Admin\NewsController@create']);
    Route::any('news/edit', ['uses' => 'Admin\NewsController@edit']);
    Route::any('news/delete', ['uses' => 'Admin\NewsController@delete']);
    Route::any('news/delete_all', ['uses' => 'Admin\NewsController@delete_all']);
    Route::any('news/image/upload', ['uses' => 'Admin\NewsController@upload']);

    //分享
    Route::any('share/show', ['uses' => 'Admin\ShareController@lists']);
    Route::any('share/create', ['uses' => 'Admin\ShareController@create']);
    Route::any('share/edit', ['uses' => 'Admin\ShareController@edit']);
    Route::any('share/delete', ['uses' => 'Admin\ShareController@delete']);
    Route::any('share/delete_all', ['uses' => 'Admin\ShareController@delete_all']);

    //提现
    Route::any('withdraw/show', ['uses' => 'Admin\WithdrawController@lists']);

    //微信发红包
    Route::any('packet/send', ['uses' => 'Admin\WithdrawController@send_packet']);
    Route::any('packet/reject', ['uses' => 'Admin\WithdrawController@reject_packet']);


});

//输入邀请码界面
Route::any('api/enter/page', ['uses' => 'Api\InviteController@enterPage']);

//签到界面
Route::any('api/sign/page', ['uses' => 'Api\SignController@signPage']);

//问题答疑界面
Route::any('api/problem/page', ['uses' => 'Api\ProblemController@problemPage']);

//提现帮助界面
Route::any('api/pick/page', ['uses' => 'Api\PickController@pickPage']);

//分享下载界面
Route::any('api/share/page', ['uses' => 'Api\ShareController@sharePage']);

//记录机器码路由
Route::post('api/machine/record', ['uses' => 'Api\MachineController@record']);

//金币明细页面
Route::any('api/coin/show', ['uses' => 'Api\CoinController@userCoin']);
Route::any('api/verify/page', ['uses' => 'Api\VerifyController@verifyPage']);
//兑换
Route::any('api/auto/convert', ['uses' => 'Api\ConvertController@CoinToBalance']);

//提现
Route::any('api/pay/page', ['uses' => 'Api\PayController@applyPage']);
Route::any('api/check/red_packet', ['uses' => 'Api\PayController@checkRedPacket']);

//微信认证成功后提示授权流程
Route::any('api/pfc/page', ['uses' => 'Api\VerifyController@ProcessPage']);
//绑定公众号接口
Route::any('api/number/accredit', ['uses' => 'Api\VerifyController@verifyCallback']);

//提现进度
Route::any('api/pick/process', ['uses' => 'Api\PickController@process']);


//API User/Task routes
Route::group(['prefix' => 'api', 'middleware' => ['check_token']], function () {
    Route::post('user/login', ['uses' => 'Api\UserController@userLogin']);
    Route::post('task/get', ['uses' => 'Api\TaskController@getTaskByType']);
    Route::post('task/get/{id}', ['uses' => 'Api\TaskController@getTaskById']);
    Route::any('task/do/{tid}', ['uses' => 'Api\TaskController@completeTask'])->where(['tid' => '\d+']);
    Route::any('userInfo/get', ['uses' => 'Api\UserController@getUserInfo']);
    Route::any('invite/enter', ['uses' => 'Api\InviteController@enterInviteCode']);
    Route::any('user/sign', ['uses' => 'Api\SignController@userSign']);
    Route::post('shareData/get', ['uses' => 'Api\ShareController@getShareData']);

    Route::post('user/verify', ['uses' => 'Api\VerifyController@userVerify']);
    Route::post('user/convert', ['uses' => 'Api\PayController@userConvert']);
});
