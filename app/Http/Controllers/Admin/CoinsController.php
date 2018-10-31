<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/7/11
 * Time: 13:46
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\CoinsLog;

class CoinsController extends Controller
{
    public function lists()
    {
        $coinsLogData = CoinsLog::orderBy('created_at', 'desc')
            ->paginate(15);
        return view('Admin.coins.show', ['data' => $coinsLogData]);
    }
}