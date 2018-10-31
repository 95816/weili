<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="{{asset('statics/lib/html5.js')}}"></script>
    <script type="text/javascript" src="{{asset('statics/lib/respond.min.js')}}"></script>
    <![endif]-->
    <link href="{{asset('statics/static/h-ui/css/H-ui.min.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/h-ui.admin/css/H-ui.admin.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/lib/Hui-iconfont/1.0.8/iconfont.css')}}" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <title>添加APP任务分类</title>
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-user-add">
        <!-- 失败提示框 -->
        @if(Session::has('category_edit_success'))
            <div class="Huialert Huialert-success"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('category_edit_success')}}</div>
        @elseif(Session::has('category_edit_error'))
            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('category_edit_error')}}</div>
        @endif
        <input type="hidden" value="{{$data->id}}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                分类名称：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="{{$data->name}}" placeholder="" id="user-name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">所属分类：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <span class="select-box">
                  <select class="select" size="1" name="pid">
                      @foreach($lists as $val)
                          <option value="{{$val->id}}" {{$data->pid == $val->id?'selected':''}}>{{$val->level}}级分类&nbsp;{{$val->name}}</option>
                      @endforeach
                  </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <a class="btn btn-danger radius" onclick="deleteCat({{$data->id}})">&nbsp;&nbsp;删除&nbsp;&nbsp;</a>
            </div>
        </div>
    </form>
</div>
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
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        $("#form-user-add").validate({
            rules: {
                name: {
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
    function deleteCat(id) {
        $.ajax({
            type: 'post',
            data: {id: id},
            dataType: 'json',
            url: '/admin/category/delete',
            success: function (data) {
                if (data.code) {
                    parent.layer.alert(data.msg, {
                        skin: 'layui-layer-molv' //样式类名  自定义样式
                        ,closeBtn: 1    // 是否显示关闭按钮
                        ,anim: 1 //动画类型
                        ,btn: ['确定'] //按钮
                        ,icon: 6    // icon
                        ,yes:function(){
                            window.parent.location.reload();
                        }});
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("错误信息：" + XMLHttpRequest.responseText); //获取的信息即是异常中的Message
            }
        });
    }
</script>
</body>
</html>