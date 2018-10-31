<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <link rel="stylesheet" href="{{asset('statics/lib/keditor/themes/default/default.css')}}">
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add">
        <!-- 失败提示框 -->
        @if(Session::has('news_edit_fail'))
            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('news_edit_fail')}}</div>
        @endif
        <input type="hidden" class="input-text" value="{{$data->id}}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="{{$data->title}}" placeholder="任务标题必填" id="" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章种类：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input type="radio" value="1" id="sex-1" name="type" {{$data->type==1?'checked':''}}>
                    <label for="sex-1">常见问题</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" value="2" name="type" {{$data->type==2?'checked':''}}>
                    <label for="sex-2">提现问题</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-3" value="3" name="type" {{$data->type==3?'checked':''}}>
                    <label for="sex-3">问题提示</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">所属APP：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
            <span class="select-box">
              <select name="app_id" class="select" id="app_select">
                @foreach($app_infos as $app_info)
                      <option value="{{$app_info->app_id}}" @if($app_info->app_id ==$data->app_id) selected @endif>{{$app_info->app_name}}</option>
                  @endforeach
              </select>
            </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">任务描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="description" cols="200" rows="20" style="color:#999999" id="description">{{$data->description}}</textarea>
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
            description: {
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
        editor = K.create('textarea[name="description', {
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
</script>
</body>
</html>