<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->

    <title>任务列表</title>
    <link rel="stylesheet" href="{{asset('statics/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css')}}" type="text/css">
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->


<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 任务管理 <span class="c-gray en">&gt;</span> 任务列表 <a
                class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <div class="pos-a" style="width:150px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5">
            <ul id="treeDemo" class="ztree">
            </ul>
        </div>
        <div style="margin-left:150px;">
            <div class="pd-20">
                <form action="" method="post" class="form form-horizontal">
                    <div class="text-c"> 日期范围：
                        <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate"
                               style="width:120px;">
                        -
                        <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate"
                               style="width:120px;">
                        <input type="text" id="" placeholder=" 任务名称" style="width:250px" class="input-text" name="Search[keyword]">
                        <input type="hidden" id="" value="{{$id}}" name="Search[id]">
                        <button name="submit" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜任务</button>
                    </div>
                </form>
                <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i
                                    class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius"
                                                                                  onclick="product_add('添加任务','/admin/task/create')" href="javascript:;"><i
                                    class="Hui-iconfont">&#xe600;</i> 添加任务</a></span> <span class="r">共有数据：<strong>{{$lists->total()}}</strong> 条</span></div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40"><input name="" type="checkbox" value=""></th>
                            <th width="40">ID</th>
                            <th width="150">任务名称</th>
                            <th>描述</th>
                            <th width="100">奖励金币</th>
                            <th width="80">添加人</th>
                            <th width="80">任务标识</th>
                            <th width="80">任务请求类型</th>
                            <th width="80">按钮标题</th>
                            <th width="120">状态</th>
                            <th width="80">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($lists as $val)
                            <tr class="text-c va-m">
                                <td><input name="" type="checkbox" value="{{$val->id}}"></td>
                                <td>{{$val->id}}</td>
                                <td>{{$val->title}}</td>
                                <td class="text-l">{{strip_tags(htmlspecialchars_decode($val->description))}}</td>
                                <td><span class="price">{{$val->reward_coin}}</span></td>
                                <td>{{$val->add_admin}}</td>
                                @if($val->task_mark == 'new')
                                    <td>新</td>
                                @elseif($val->task_mark == 'hot')
                                    <td>热</td>
                                @elseif($val->task_mark == 'normal')
                                    <td>正常</td>
                                @else
                                    <td>错误类型</td>
                                @endif

                                @if($val->request_type == 1)
                                    <td>邀请弹窗</td>
                                @elseif($val->request_type == 2)
                                    <td>邀请界面</td>
                                @elseif($val->request_type == 3)
                                    <td>认证手机</td>
                                @elseif($val->request_type == 4)
                                    <td>认证支付宝</td>
                                @elseif($val->request_type == 5)
                                    <td>认证微信</td>
                                @elseif($val->request_type == 6)
                                    <td>开启特权</td>
                                @elseif($val->request_type == 7)
                                    <td>去签到</td>
                                @elseif($val->request_type == 8)
                                    <td>分享微信</td>
                                @elseif($val->request_type == 9)
                                    <td>分享朋友圈</td>
                                @elseif($val->request_type == 10)
                                    <td>去首页</td>
                                @elseif($val->request_type == 11)
                                    <td>玩游戏</td>
                                @else
                                    <td>其他</td>
                                @endif
                                <td>{{$val->button_title}}</td>
                                @if($val->status == 1)
                                    <td class="td-status"><span class="label label-success radius">已启用</span></td>
                                @elseif($val->status == 2)
                                    <td class="td-status"><span class="label radius">已停用</span></td>
                                @endif
                                <td class="td-manage">
                                    @if($val->status == 1)
                                        <a style="text-decoration:none" onClick="task_stop(this,{{$val->id}})" href="javascript:;" title="停用"><i
                                                    class="Hui-iconfont">&#xe631;</i></a>
                                    @elseif($val->status == 2)
                                        <a style="text-decoration:none" onClick="task_start(this,{{$val->id}})" href="javascript:;" title="启用"><i
                                                    class="Hui-iconfont">&#xe615;</i></a>
                                    @endif
                                    <a style="text-decoration:none" class="ml-5" onClick="product_edit('修改任务','/admin/task/edit?id={{$val->id}}',{{$val->id}})"
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
                        {!! $lists->appends(['title'=>$keyword,'id'=>$id])->render() !!}
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
<script type="text/javascript" src="{{asset('statics/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js')}}"></script>
<script type="text/javascript">
    var zNodes;
    $.ajax({
        type: 'post',
        url: '/admin/category/cate_list',
        dataType: "json",
        async: false,
        success: function (data) {
            zNodes = data;
        }
    });

    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                window.location.href = "/admin/task/show/" + treeNode.id;
            }
        }
    };
    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>" + str + "</li>");
    }

    $(document).ready(function () {
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.selectNode(zTree.getNodeByParam("id", '11'));
    });


    /*图片-添加*/
    function product_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function product_show(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-审核*/
    function product_shenhe(obj, id) {
        layer.confirm('审核文章？', {
                btn: ['通过', '不通过'],
                shade: false
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon: 6, time: 1000});
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon: 5, time: 1000});
            });
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

    /*图片-申请上线*/
    function product_shenqing(obj, id) {
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1, time: 2000});
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

    /*状态-停用*/
    function task_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post', //请求方式
                url: '/admin/task_status', //请求url
                data: {'id': id, 'type': 'stop'},
                dataType: "json",
                //请求成功的处理
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="task_start(this,' + data.id + ')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
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

    /*状态-启用*/
    function task_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'post', //请求方式
                url: '/admin/task_status', //请求url
                data: {'id': id, 'type': 'start'},
                dataType: "json",
                //请求成功的处理
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="task_stop(this,' + data.id + ')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
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

    /*图片-删除*/
    function product_del(obj, id) {
        layer.msg('功能关闭,如有问题请联系管理员!', {icon: 2, time: 3000});
        return;
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'post',
                url: '/admin/task/delete',
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
        layer.msg('功能关闭,如有问题请联系管理员!', {icon: 2, time: 3000});
        return;
        var str = "";
        $("input:checkbox:checked").each(function () {
            console.log($(this).val());
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
                url: '/admin/task/delete_all',
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