<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>APP列表 - APP列表 - H-ui.admin v3.0</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        App签到管理
        <span class="c-gray en">&gt;</span>
        设置签到 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                <div class="text-c">
				<span class="select-box inline">
				<select name="app_id" class="select" id="app_select">
                    @foreach($app_infos as $app_info)
                        <option value="{{$app_info->id}}" @if($app_info->id ==$app_id) selected @endif>{{$app_info->app_name}}</option>
                    @endforeach
				</select>
				</span>
                    <span class="inline">@if(!empty($signData['reward_coin']))
                            <a class="btn btn-primary radius" href="javascript:void(0)" today="{{count($signData['reward_coin'])+1}}" id="add_line"
                               onclick="add_line()"><i class="Hui-iconfont">&#xe600;</i> 新增一次</a>
                        @else
                            <a class="btn btn-primary radius" href="javascript:void(0)" today="2" id="add_line"
                               onclick="add_line()"><i class="Hui-iconfont">&#xe600;</i> 新增一次</a>
                        @endif

				</span>
                </div>

                <div class="Hui-article">
                    <article class="cl pd-20">
                        <!-- 提示框 -->
                        @if(Session::has('sign_coin_error'))
                            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('sign_coin_error')}}</div>
                        @endif
                        @if(Session::has('sign_add_success'))
                            <div class="Huialert Huialert-success"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('sign_add_success')}}</div>
                        @endif
                        @if(Session::has('sign_add_error'))
                            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('sign_add_error')}}</div>
                        @endif
                        @if(Session::has('sign_edit_success'))
                            <div class="Huialert Huialert-success"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('sign_edit_success')}}</div>
                        @endif
                        @if(Session::has('sign_edit_error'))
                            <div class="Huialert Huialert-danger"><i class="Hui-iconfont">&#xe6a6;</i>{{Session::get('sign_edit_error')}}</div>
                        @endif
                    <!-- 提示框结束 -->
                        @if(!empty($signData['reward_coin']))
                            @foreach($signData['reward_coin'] as $key=>$val)
                                <div class="row cl">
                                    <label class="form-label col-xs-3 col-sm-2">第{{$key+1}}次签到获得金币：</label>
                                    <div class="formControls col-xs-8 col-sm-9">
                                        <input type="text" class="input-text" value="{{$val}}" name="RewardCoin[]">
                                    </div>
                                </div>
                            @endforeach
                        @else
                            <div class="row cl">
                                <label class="form-label col-xs-3 col-sm-2">第1次签到获得金币：</label>
                                <div class="formControls col-xs-8 col-sm-9">
                                    <input type="text" class="input-text" value="" name="RewardCoin[]">
                                </div>
                            </div>
                        @endif
                        <div class="row cl" id="last_submit_div">
                            <div class="col-xs-6 col-sm-8 col-xs-offset-3 col-sm-offset-2">
                                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                            </div>
                        </div>

                    </article>
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
<script type="text/javascript" src="{{asset('statics/lib/My97DatePicker/4.8/WdatePicker.js')}}"></script>
<script>
    function add_line() {
        var today = $('#add_line').attr('today');
        var str = '<div class="row cl">\n' +
            '<label class="form-label col-xs-3 col-sm-2">第' + today + '次签到获的金币：</label>\n' +
            '<div class="formControls col-xs-8 col-sm-9">\n' +
            '<input type="text" class="input-text" value="" name="RewardCoin[]">\n' +
            '</div>\n' +
            '</div>';
        $('#last_submit_div').before(str);
        $('#add_line').attr('today', Number(today) + Number(1));
    }
</script>
<script>
    $('#app_select').change(function () {
        //获取当前app_id
        var app_id = $(this).val();
        window.location.href = '/admin/sign/set?app_id=' + app_id;
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>