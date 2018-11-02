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
                <div class="text-c"> 日期范围：
                    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="Search[start_time]"
                           class="input-text Wdate"
                           style="width:120px;">
                    -
                    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="Search[end_time]"
                           class="input-text Wdate"
                           style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" value="{{$keyword}}" name="Search[keyword]">
                    <button type="submit" class="btn btn-success" id="" name="submit"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
                </div>
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
                    <a href="/admin/create" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a> </span>
                <span class="r">共有数据：<strong>{{$list->total()}}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg table-hover table-bg table-sort">
                <thead>
                <tr>
                    <th scope="col" colspan="10">管理员列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="40">ID</th>
                    <th width="150">登录名</th>
                    <th width="150">邮箱</th>
                    <th>角色</th>
                    <th width="130">加入时间</th>
                    <th width="90">最近登录IP</th>
                    <th width="130">最近登录时间</th>
                    <th width="100">是否已启用</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                @foreach($list as $val)
                    <tr class="text-c">
                        <td><input type="checkbox" value="{{$val->id}}" name="ids[]"></td>
                        <td>{{$val->id}}</td>
                        <td>{{$val->username}}</td>
                        <td>{{$val->email}}</td>
                        <td>{{$val->role_id}}</td>
                        <td>{{$val->create_time}}</td>
                        <td>{{$val->login_ip}}</td>
                        <td>{{$val->login_time==''?'':date('Y-m-d H:i:s',$val->login_time)}}</td>
                        @if($val->status == 1)
                            <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        @else
                            <td class="td-status"><span class="label radius">已停用</span></td>
                        @endif

                        <td class="td-manage">
                            @if($val->status == 1)
                                <a style="text-decoration:none" onClick="admin_stop(this,{{$val->id}})" href="javascript:;" title="停用"><i
                                            class="Hui-iconfont">&#xe631;</i></a>
                            @else
                                <a style="text-decoration:none" onClick="admin_start(this,{{$val->id}})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>
                            @endif
                            <a title="编辑" href="/admin/edit/{{$val->id}}" class="ml-5"
                               style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a title="删除" href="javascript:;" onclick="admin_del(this,{{$val->id}})" class="ml-5" style="text-decoration:none"><i
                                        class="Hui-iconfont">&#xe6e2;</i></a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </article>
        <div id="pull_right">
            <div class="pull-right">
                {!! $list->appends(['username'=>$keyword])->render() !!}
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
<script type="text/javascript">

    /*管理员-删除*/
    function admin_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post', //请求方式
                url: '/admin/delete', //请求url
                data: {'id': id},
                dataType: "json",
                //请求成功的处理
                success: function (data) {
                    if (data.code) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg('删除失败!', {icon: 2, time: 1000});
                    }
                }
            })

            //$(obj).parents("tr").remove();
            //layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    /*管理员-停用*/
    function admin_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post', //请求方式
                url: '/admin/admin_status', //请求url
                data: {'id': id, 'type': 'stop'},
                dataType: "json",
                //请求成功的处理
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,' + data.id + ')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label radius">已禁用</span>');
                        $(obj).remove();
                        layer.msg('已停用!', {icon: 6, time: 1000});
                    } else {
                        layer.msg('停用失败!', {icon: 2, time: 1000});
                    }
                }
            })

        });
    }

    /*管理员-启用*/
    function admin_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post', //请求方式
                url: '/admin/admin_status', //请求url
                data: {'id': id, 'type': 'start'},
                dataType: "json",
                //请求成功的处理
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,' + data.id + ')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        layer.msg('已启用!', {icon: 6, time: 1000});
                    } else {
                        layer.msg('停用失败!', {icon: 2, time: 1000});
                    }
                }
            })
        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>