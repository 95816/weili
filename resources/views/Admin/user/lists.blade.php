<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>Wei-li.admin 管理员列表</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        管理员管理
        <span class="c-gray en">&gt;</span>
        管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal">
                {{--<div class="text-c"> 日期范围：--}}
                    {{--<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="Search[start_time]"--}}
                           {{--class="input-text Wdate"--}}
                           {{--style="width:120px;">--}}
                    {{-----}}
                    {{--<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="Search[end_time]"--}}
                           {{--class="input-text Wdate"--}}
                           {{--style="width:120px;">--}}
                    {{--<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="Search[keyword]">--}}
                    {{--<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>--}}
                {{--</div>--}}
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">共有数据：<strong>{{$user_list->total()}}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg table-hover table-bg table-sort">
                <thead>
                <tr>
                    <th scope="col" colspan="12">用户列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="40">用户ID</th>
                    <th width="150">所属APP</th>
                    <th width="150">金币数</th>
                    <th>余额</th>
                    <th width="130">邀请码</th>
                    <th width="130">被邀请码</th>
                    <th width="130">被邀请时间</th>
                    <th width="100">认证情况</th>
                    <th width="90">最近登录IP</th>
                    <th width="130">最近登录时间</th>
                    <th width="130">操作</th>
                </tr>
                </thead>
                <tbody>
                @foreach($user_list as $val)
                    <tr class="text-c">
                        <td><input type="checkbox" value="{{$val->id}}" name="ids[]"></td>
                        <td>{{$val->uid}}</td>
                        <td>{{$val->app_id}}</td>
                        <td>{{$val->coins}}</td>
                        <td>{{$val->money}}</td>
                        <td>{{$val->invitation_code}}</td>
                        <td>{{$val->invited_code}}</td>
                        @if(!empty($val->invited_time))
                            <td>{{date('Y-m-d',$val->invited_time)}}</td>
                        @else
                            <td></td>
                        @endif
                        <td>{{$val->status}}</td>
                        <td>{{$val->login_ip}}</td>
                        <td>{{$val->login_time==''?'':date('Y-m-d H:i:s',$val->login_time)}}</td>
                        <td class="td-manage">
                            {{--<a title="编辑" href="/admin/user/get_task/{{$val->id}}" class="btn btn-primary radius" style="text-decoration:none">查看任务记录</a>--}}
                            <a title="编辑" href="javascript:void(0);" class="btn btn-primary radius" style="text-decoration:none">查看任务记录</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </article>
        <div id="pull_right">
            <div class="pull-right">
                {!! $user_list->render() !!}
            </div>
        </div>
    </div>

</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="{{asset('statics/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/layer/2.4/layer.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui/js/H-ui.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui.admin/js/H-ui.admin.page.js')}}"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="{{asset('statics/lib/My97DatePicker/4.8/WdatePicker.js')}}"></script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>