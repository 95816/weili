<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>任务列表</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->


<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 分享系统 <span class="c-gray en">&gt;</span> 分享列表 <a
                class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <div>
            <div class="pd-20">
                <form action="" method="post" class="form form-horizontal">
                    <div class="text-c"> 日期范围：
                        <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate"
                               style="width:120px;">
                        -
                        <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate"
                               style="width:120px;">
                        <input type="text" id="" placeholder=" 文章名称" style="width:250px" class="input-text" name="Search[keyword]">
                        <button name="submit" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜一下</button>
                    </div>
                </form>
                <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i
                                    class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius"
                                                                                  onclick="product_add('添加任务','/admin/share/create')" href="javascript:;"><i
                                    class="Hui-iconfont">&#xe600;</i> 新增分享</a></span> <span class="r">共有数据：<strong>{{$lists->total()}}</strong> 条</span></div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40"><input name="" type="checkbox" value=""></th>
                            <th width="40">ID</th>
                            <th width="150">分享标题</th>
                            <th width="150">分享图片</th>
                            <th>分享内容</th>
                            <th width="150">分享URL</th>
                            <th width="150">状态</th>
                            <th width="200">添加时间</th>
                            <th width="200">更新时间</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($lists as $val)
                            <tr class="text-c va-m">
                                <td><input name="" type="checkbox" value="{{$val->id}}"></td>
                                <td>{{$val->id}}</td>
                                <td>{{$val->title}}</td>
                                <td><img width="80px" height="80px" src="{{$val->image}}"></td>
                                <td>{{strip_tags(htmlspecialchars_decode($val->content))}}</td>
                                <td>{{$val->url}}</td>
                                @if($val->status == 1)
                                    <td>启用</td>
                                @elseif($val->status == 2)
                                    <td>禁用</td>
                                @endif
                                <td>{{$val->created_at}}</td>
                                <td>{{$val->updated_at}}</td>
                                <td class="td-manage">
                                    <a style="text-decoration:none" class="ml-5" onClick="product_edit('修改','/admin/share/edit?id={{$val->id}}',{{$val->id}})"
                                       href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                                    <a style="text-decoration:none" class="ml-5" onClick="product_del(this,{{$val->id}})" href="javascript:;" title="删除"><i
                                                class="Hui-iconfont">&#xe6e2;</i></a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <div id="pull_right">
                    <div class="pull-right">
                        {{--分页代码--}}

                    </div>
                </div>
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
    /*图片-添加*/
    function product_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-下架*/
    function product_stop(obj, id) {
        layer.confirm('确认要下架吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!', {icon: 5, time: 1000});
        });
    }

    /*图片-发布*/
    function product_start(obj, id) {
        layer.confirm('确认要发布吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        });
    }


    /*图片-编辑*/
    function product_edit(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url,
        });
        layer.full(index);
    }

    /*图片-删除*/
    function product_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'post',
                url: '/admin/share/delete',
                data: {'id': id},
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.code) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg('删除失败!', {icon: 2, time: 1000});
                    }
                    console.log(data);
                }
            });

        });
    }

    //批量删除

    function datadel() {
        var str = "";
        $("input:checkbox:checked").each(function () {
            if ($(this).val()) {
                str += $(this).val() + ",";
            }
        });
        str = str.substring(0, str.length - 1);
        if (str == '') {
            layer.msg('一个也不选,删你妹啊!', {icon: 2, time: 1000});
            return;
        } else {
            $.ajax({
                type: 'post',
                url: '/admin/share/delete_all',
                data: {'ids': str},
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.code) {
                        layer.msg(
                            '删除成功！<br/>',
                            {
                                icon: 6,
                                time: 1500,
                                shade: 0.3,
                                end: function () {
                                    location.reload();
                                }
                            });
                    }
                }
            });
        }

    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>