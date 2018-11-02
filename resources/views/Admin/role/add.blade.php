<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>新建网站角色 - 管理员管理 - H-ui.admin v3.0</title>
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
        角色新增 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>角色名称：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg="角色名称不能为空"
                               autocomplete="off">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>描述：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="" name="description">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>启用：</label>
                    <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                        <div class="radio-box">
                            <input name="status" type="radio" id="sex-1" checked value="1">
                            <label for="sex-1">启用</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" id="sex-2" name="status" value="2">
                            <label for="sex-2">禁用</label>
                        </div>
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1">网站角色：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        @foreach($powers as $key=>$val)
                            <dl class="permission-list">
                                <dt>
                                    <label>
                                        <input type="checkbox" value="" name="" id="user-Character-0">
                                        {{$val['name']}}</label>
                                </dt>
                                <dd>
                                    <dl class="cl permission-list2">
                                        <dt>
                                            <label class="">
                                                <input type="checkbox" value="" name="" id="user-Character-{{$key}}-0">
                                                勾选节点</label>
                                        </dt>
                                        <dd>
                                            @foreach($val['childs'] as $k=>$v)
                                                <label class="">
                                                    <input type="checkbox" value="{{$v['id']}}" name="power[]" id="user-Character-0-0-{{$k}}">
                                                    {{$v['name']}}</label>
                                            @endforeach
                                        </dd>
                                    </dl>
                                </dd>
                            </dl>
                        @endforeach
                        {{--<dl class="permission-list">
                            <dt>
                                <label>
                                    <input type="checkbox" value="" name="user-Character-0" id="user-Character-1">
                                    用户中心</label>
                            </dt>
                            <dd>
                                <dl class="cl permission-list2">
                                    <dt>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0" id="user-Character-1-0">
                                            用户管理</label>
                                    </dt>
                                    <dd>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-0">
                                            添加</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-1">
                                            修改</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-2">
                                            删除</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-3">
                                            查看</label>
                                        <label class="">
                                            <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-4">
                                            审核</label>
                                    </dd>
                                </dl>
                            </dd>
                        </dl>--}}
                    </div>
                </div>
                <div class="row cl">
                    <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-1">
                        <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                    </div>
                </div>
            </form>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="{{asset('statics/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/layer/2.4/layer.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui/js/H-ui.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui.admin/js/H-ui.admin.page.js')}}"></script>

<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/jquery.validate.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/validate-methods.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/messages_zh.js')}}"></script>
<script type="text/javascript">
    $(function () {
        $(".permission-list dt input:checkbox").click(function () {
            $(this).closest("dl").find("dd input:checkbox").prop("checked", $(this).prop("checked"));
        });
        $(".permission-list2 dd input:checkbox").click(function () {
            var l = $(this).parent().parent().find("input:checked").length;
            var l2 = $(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
            if ($(this).prop("checked")) {
                $(this).closest("dl").find("dt input:checkbox").prop("checked", true);
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", true);
            }
            else {
                if (l == 0) {
                    $(this).closest("dl").find("dt input:checkbox").prop("checked", false);
                }
                if (l2 == 0) {
                    $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", false);
                }
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>