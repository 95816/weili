<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>Wei-li.admin 申请接口</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->
<link rel="stylesheet" type="text/css" href="{{asset('statics/lib/SelectColor/css/spectrum.css')}}"/>
<script type="text/javascript" src="{{asset('statics/lib/SelectColor/js/docs.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/SelectColor/js/spectrum.js')}}"></script>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        App邀请管理
        <span class="c-gray en">&gt;</span>
        邀请设置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <!-- 失败提示框 -->
            @if(Session::has('app_apply_error'))
                <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('app_apply_error')}}</div>
            @endif
            <form action="" method="post" class="form form-horizontal" id="form-admin-add" enctype="multipart/form-data">
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>APP名称：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="appName" name="app_name">
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
                    <label class="form-label col-xs-2 col-sm-1">应用背景色：</label>
                    <div class="formControls col-xs-5 col-sm-6">
                        <input type="text" class="input-text" value="" placeholder="" id="bg_color" name="bg_color">
                    </div>
                    <span style="color: #FE0000">温馨提示:请使用十六进制来表示颜色</span>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1">分享图片：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <img class="layui-upload-img img-upload-view" id="previewImg" width="120px" height="120px"
                             src="{{asset('statics/images/uploadpic.png')}}">
                        <span class="btn-upload form-group">
                          <a href="javascript:void(0);" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
                          <input type="file" name="image" class="input-file" onChange="preview(this)">
                        </span>
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1">真实姓名：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="" placeholder="" id="real_name" name="real_name">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>联系邮箱：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" placeholder="@" name="email" id="email">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1">备注：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true"
                                  onKeyUp="textarealength(this,100)"></textarea>
                        <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/jquery.validate.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/validate-methods.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/messages_zh.js')}}"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-admin-add").validate({
            rules: {
                app_name: {
                    required: true,
                    minlength: 2,
                    maxlength: 16
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",

        });
    });

    function preview(obj) {
        var img = document.getElementById("previewImg");
        img.src = window.URL.createObjectURL(obj.files[0]);
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>