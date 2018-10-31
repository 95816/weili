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
        <div>
            <div class="pd-20">
                <form action="" method="post" class="form form-horizontal">
                    <div class="text-c"> 日期范围：
                        <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate"
                               style="width:120px;">
                        -
                        <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate"
                               style="width:120px;">
                        <input type="text" id="" placeholder=" 任务名称" style="width:250px" class="input-text" name="Search[keyword]">
                        <button name="submit" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜任务</button>
                    </div>
                </form>
                <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><button class="btn btn-danger radius">金币日志列表展示</button></span> <span
                            class="r">共有数据：<strong>{{$data->total()}}</strong> 条</span></div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40">ID</th>
                            <th>任务名称</th>
                            <th width="300">奖励金币</th>
                            <th width="200">获得金币的用户ID</th>
                            <th width="120">任务类型</th>
                            <th width="200">领取时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $val)
                            <tr class="text-c va-m">
                                <td>{{$val->id}}</td>
                                <td>{{$val->app_id}}</td>
                                <td><span class="price" style="color:#f00;font-weight: bold;">{{$val->coin}}</span></td>
                                <td>{{$val->uid}}</td>
                                @if($val->type == 6)
                                    <td>请求类型</td>
                                @else
                                    <td>错误类型</td>
                                @endif
                                <td>{{$val->created_at}}</td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>
                <div id="pull_right">
                    <div class="pull-right">
                        {!! $data->render() !!}
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
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>