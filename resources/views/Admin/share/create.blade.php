<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <link rel="stylesheet" href="{{asset('statics/lib/keditor/themes/default/default.css')}}">
    <style>
        .btn-upload {
            position: relative;
            display: inline-block;
            height: 36px;
            *display: inline;
            overflow: hidden;
            vertical-align: middle;
            cursor: pointer
        }

        .upload-url {
            cursor: pointer
        }

        .input-file {
            position: absolute;
            right: 0;
            top: 0;
            cursor: pointer;
            z-index: 1;
            font-size: 30em;
            *font-size: 30px;
            opacity: 0;
            filter: alpha(opacity=0)
        }

        .btn-upload .input-text {
            width: auto
        }

        .form-group .upload-btn {
            margin-left: -1px
        }
    </style>
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
        <!-- 失败提示框 -->
        @if(Session::has('share_add_fail'))
            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('share_add_fail')}}</div>
        @endif
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分享标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="分享标题必填" id="" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分享URL：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="分享URL必填" id="" name="url">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">分享内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="content" cols="200" rows="20" style="color:#999999"></textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">分享图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <img class="layui-upload-img img-upload-view" id="previewImg" width="120px" height="120px" src="{{asset('statics/images/uploadpic.png')}}">
                <span class="btn-upload form-group">
              <a href="javascript:void(0);" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
              <input type="file" name="image" class="input-file" onChange="preview(this)">
            </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否启用：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="status" type="radio" value="1" id="sex-1" checked>
                    <label for="sex-1">启用</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" value="2" name="status">
                    <label for="sex-2">禁用</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
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
<script type="text/javascript" src="{{asset('statics/lib/My97DatePicker/4.8/WdatePicker.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/jquery.validate.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/validate-methods.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/jquery.validation/1.14.0/messages_zh.js')}}"></script>
<script charset="utf-8" src="{{asset('statics/lib/keditor/kindeditor-min.js')}}"></script>
<script charset="utf-8" src="{{asset('statics/lib/keditor/kindeditor-all-min.js')}}"></script>
<script charset="utf-8" src="{{asset('statics/lib/keditor/lang/zh_CN.js')}}"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

    });
    $("#form-article-add").validate({
        rules: {
            title: {
                required: true,
                minlength: 2,
                maxlength: 16
            },
            content: {
                required: true,
            },
            url: {
                required: true,
            },

        },
        onkeyup: false,
        focusCleanup: true,
        success: "valid",

    });
</script>
<script>
    var editor;
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="content', {
            allowFileManager: true,
            autoHeightMode: true,
            afterCreate: function () {
                this.loadPlugin('autoheight');
            },
            afterUpload: function (url) {
                var firstimageoption = '<option value="' + url + '">' + url + '</option>';
                var selectoption = '<option value="' + url + '" selected="selected">' + url + '</option>';
                $("#firstimage").append(firstimageoption);
                $("#images").append(selectoption);
            }
        });
    });

    function preview(obj) {
        var img = document.getElementById("previewImg");
        img.src = window.URL.createObjectURL(obj.files[0]);
    }
</script>

</body>
</html>