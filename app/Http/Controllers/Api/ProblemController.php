<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/8/1
 * Time: 14:40
 */

namespace App\Http\Controllers\Api;

use App\Models\Admin\News;
use App\Service\Token;
use App\Exceptions\UserException;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ProblemController extends Controller
{
    /**
     * @param Request $request
     * @return Factory|View|\think\response\View
     * @throws UserException
     * @throws \App\Exceptions\TokenException
     */
    public function problemPage(Request $request)
    {
        //获取真实的用户id
        $input = $request->all('get.');
        if (empty($input['token'])) {
            throw new UserException([
                'errorCode' => 20005,
                'code' => 403,
                'msg' => '必须在url中携带token值!'
            ]);
        }
        //获取app_id是为了效验token
        $app_id = Token::getCurrentTokenVar('app_id', false, $input['token']);
        //获取常见问题
        $normalProblems = News::where('type', '1')->where('app_id', $app_id)->orderBy('created_at', 'asc')->get(['title', 'description']);
        //获取提现问题
        $payProblems = News::where('type', '2')->where('app_id', $app_id)->orderBy('created_at', 'asc')->get(['title', 'description']);
        //获取问题提示
        //$tipProblems = News::where('type', '3')->orderBy('created_at', 'asc')->get(['title', 'description']);
        return view('Api.problem.page', [
            'normalProblems' => $normalProblems,
            'payProblems' => $payProblems,
            //'tipProblems' => $tipProblems
        ]);
    }
}