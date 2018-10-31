<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/25
 * Time: 16:48
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\User;

class UserController extends Controller
{
    public function lists()
    {
        $userAllData = User::orderBy('created_at', 'desc')->paginate(15);
        return view('Admin.user.lists', ['user_list' => $userAllData]);
    }
}