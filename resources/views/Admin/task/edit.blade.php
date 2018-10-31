<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->

    <link href="{{asset('statics/lib/webuploader/0.1.5/webuploader.css')}}" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add">
        <!-- 失败提示框 -->
        @if(Session::has('task_add_fail'))
            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('task_add_fail')}}</div>
        @endif
        <input type="hidden" class="input-text" value="{{$data->id}}" name="id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>任务标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="{{$data->title}}" placeholder="任务标题必填" id="" name="Task[title]">
            </div>
        </div>
        <div class="row cl">

            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="Task[catid]" class="select">
                    @foreach($catArr as $val)
                        <option value="{{$val->id}}" {{$val->id==$data->catid?'selected':''}}>{{$val->level}}级分类&nbsp;{{$val->name}}</option>
                    @endforeach
				</select>
				</span></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>任务种类：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="Task[type]" type="radio" id="sex-1" value="1" {{$data->type==1?'checked':''}}>
                    <label for="sex-1">新手任务</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" value="2" name="Task[type]" {{$data->type==2?'checked':''}}>
                    <label for="sex-2">每日任务</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-3" value="3" name="Task[type]" {{$data->type==3?'checked':''}}>
                    <label for="sex-3">永久任务</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>任务标识：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="Task[task_mark]" type="radio" value="new" id="sex-4" {{$data->task_mark=='new'?'checked':''}}>
                    <label for="sex-4">新任务</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-5" value="hot" name="Task[task_mark]" {{$data->task_mark=='hot'?'checked':''}}>
                    <label for="sex-5">热门任务</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-6" value="normal" name="Task[task_mark]" {{$data->task_mark=='normal'?'checked':''}}>
                    <label for="sex-6">正常显示</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>任务请求类型：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="Task[request_type]" type="radio" value="1" id="sex-7" {{$data->request_type==1?'checked':''}}>
                    <label for="sex-7">邀请弹窗</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-8" value="2" name="Task[request_type]" {{$data->request_type==2?'checked':''}}>
                    <label for="sex-8">邀请界面</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-9" value="3" name="Task[request_type]" {{$data->request_type==3?'checked':''}}>
                    <label for="sex-9">认证手机</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-10" value="4" name="Task[request_type]" {{$data->request_type==4?'checked':''}}>
                    <label for="sex-10">认证支付宝</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-11" value="5" name="Task[request_type]" {{$data->request_type==5?'checked':''}}>
                    <label for="sex-11">认证微信</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-12" value="6" name="Task[request_type]" {{$data->request_type==6?'checked':''}}>
                    <label for="sex-12">开启特权</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-13" value="7" name="Task[request_type]" {{$data->request_type==7?'checked':''}}>
                    <label for="sex-13">去签到</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-14" value="8" name="Task[request_type]" {{$data->request_type==8?'checked':''}}>
                    <label for="sex-14">分享微信</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-15" value="9" name="Task[request_type]" {{$data->request_type==9?'checked':''}}>
                    <label for="sex-15">分享朋友圈</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-16" value="10" name="Task[request_type]" {{$data->request_type==10?'checked':''}}>
                    <label for="sex-16">去首页</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-17" value="11" name="Task[request_type]" {{$data->request_type==11?'checked':''}}>
                    <label for="sex-17">玩游戏</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>按钮标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="{{$data->button_title}}" placeholder="按钮标题" id="" name="Task[button_title]">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">任务奖励金币：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="Task[reward_coin]" id="" placeholder="" value="{{$data->reward_coin}}" class="input-text" style="width:90%">金币
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">任务开始时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="Task[start_time]" value="{{date('Y-m-d H:i:s',$data->start_time)}}"
                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin"
                       class="input-text Wdate" style="width:180px;">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">任务结束时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="Task[end_time]" value="{{date('Y-m-d H:i:s',$data->end_time)}}"
                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}'})" id="datemax"
                       class="input-text Wdate" style="width:180px;">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否使用：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="Task[status]" type="radio" value="1" id="sex-18" {{$data->status==1?'checked':''}}>
                    <label for="sex-18">发布</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-19" value="2" name="Task[status]" {{$data->status==2?'checked':''}}>
                    <label for="sex-19">隐藏</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">任务描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <script id="editor" name="Task[description]" type="text/plain" style="width:100%;height:400px;">{{$data->description}}</script>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" id="task_save" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存修改</button>
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
<script type="text/javascript" src="{{asset('statics/lib/webuploader/0.1.5/webuploader.min.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/ueditor/1.4.3/ueditor.config.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/ueditor/1.4.3/ueditor.all.min.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js')}}"></script>
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
            catid: {
                required: true,
            },
            reward_coin: {
                required: true,
            },
            description: {
                required: true,
            },

        },
        onkeyup: false,
        focusCleanup: true,
        success: "valid",

    });

    $(function () {
        var ue = UE.getEditor('editor');
    });
</script>
</body>
</html>