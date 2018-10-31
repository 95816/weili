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
                <span class="r">共有数据：<strong>{{$result->total()}}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg table-hover table-bg table-sort">
                <thead>
                <tr>
                    <th scope="col" colspan="10">任务记录展示</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="40">用户ID</th>
                    <th width="150">所属APP</th>
                    <th>任务名/任务ID</th>
                    <th width="130">执行任务时间</th>
                </tr>
                </thead>
                <tbody>
                @foreach($result as $val)
                    <tr class="text-c">
                        <td><input type="checkbox" value="{{$val->id}}" name="ids[]"></td>
                        <td>{{$val->uid}}</td>
                        <td>{{$val->app_name}}</td>
                        <td>{{$val->task_name}} / {{$val->tid}}</td>
                        <td>{{$val->created_at}}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </article>
        <div id="pull_right">
            <div class="pull-right">
                {!! $result->render() !!}
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