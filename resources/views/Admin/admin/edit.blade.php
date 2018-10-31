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
        管理员修改 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <!-- 失败提示框 -->
            @if(Session::has('admin_edit_error'))
                <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('admin_edit_error')}}</div>
            @endif
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>管理员：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="{{old('Admin')['username']?old('Admin')['username']:$adminInfo->username}}" placeholder="" id="userName"
                               name="Admin[username]">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>初始密码：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="Admin[password]">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>确认密码：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="password" class="input-text" autocomplete="off" placeholder="确认新密码" id="password2" name="Admin[password2]">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>启用：</label>
                    <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                        <div class="radio-box">
                            <input name="Admin[status]" type="radio" id="sex-1"
                                   {{(old('Admin')['status']?old('Admin')['status']:$adminInfo->status) == 1 ? 'checked=checked': ''}} value="1">
                            <label for="sex-1">启用</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" id="sex-2" name="Admin[status]"
                                   {{(old('Admin')['status']?old('Admin')['status']:$adminInfo->status) == 2 ? 'checked=checked': ''}} value="2">
                            <label for="sex-2">禁用</label>
                        </div>
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1">真实姓名：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" value="{{old('Admin')['real_name']?old('Admin')['real_name']:$adminInfo->real_name}}" placeholder="" id="real_name"
                               name="Admin[real_name]">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>邮箱：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" class="input-text" placeholder="@" name="Admin[email]" id="email" value="{{old('Admin')['email']?old('Admin')['email']:$adminInfo->email}}">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-2 col-sm-1"><span class="c-red">*</span>角色：</label>
                    <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="Admin[role_id]" size="1">
					<option value="1" {{(old('Admin')['role_id']?old('Admin')['role_id']:$adminInfo->role_id) == 1 ? 'selected=selected': ''}}>超级管理员</option>
					<option value="2" {{(old('Admin')['role_id']?old('Admin')['role_id']:$adminInfo->role_id) == 2 ? 'selected=selected': ''}}>总编</option>
					<option value="3" {{(old('Admin')['role_id']?old('Admin')['role_id']:$adminInfo->role_id) == 3 ? 'selected=selected': ''}}>栏目主辑</option>
					<option value="4" {{(old('Admin')['role_id']?old('Admin')['role_id']:$adminInfo->role_id) == 4 ? 'selected=selected': ''}}>栏目编辑</option>
				</select>
				</span></div>
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
                username: {
                    required: true,
                    minlength: 2,
                    maxlength: 16
                },
                password: {
                    required: false,
                    minlength: 6,
                    maxlength: 16
                },
                password2: {
                    required: false,
                    equalTo: "#password"
                },
                status: {
                    required: true,
                },
                email: {
                    required: false,
                    email: true,
                },
                role_id: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",

        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>