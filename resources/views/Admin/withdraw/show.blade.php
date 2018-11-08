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
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 提现管理 <span class="c-gray en">&gt;</span> 提现列表 <a
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
                        <input type="text" id="" placeholder=" " style="width:250px" class="input-text" name="Search[keyword]">
                        <button name="submit" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
                    </div>
                </form>
                <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="r">共有数据：<strong>{{$lists->total()}}</strong> 条</span></div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40"><input name="" type="checkbox" value=""></th>
                            <th width="40">ID</th>
                            <th width="150">用户ID</th>
                            <th width="150">订单号</th>
                            <th width="80">所属APP</th>
                            <th width="100">提现金币</th>
                            <th width="80">提现金额</th>
                            <th>提现账号</th>
                            <th width="80">提现方式</th>
                            <th width="80">是否发放</th>
                            <th width="80">是否领取</th>
                            <th width="80">是否关闭</th>
                            <th width="120">申请时间</th>
                            <th width="130">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($lists as $val)
                            <tr class="text-c va-m">
                                <td><input name="" type="checkbox" value="{{$val->id}}"></td>
                                <td>{{$val->id}}</td>
                                <td>{{$val->uid}}</td>
                                <td>{{$val->order_no}}</td>
                                <td>{{$val->app_id}}</td>
                                <td><span class="price">{{$val->coins}}</span></td>
                                <td style="color: #FE0000;font-weight: bold;">{{$val->money}}</td>
                                <td>{{$val->account}}</td>
                                @if($val->type == '1')
                                    <td>微信</td>
                                @elseif($val->type == '2')
                                    <td>支付宝</td>
                                @else
                                    <td>其他</td>
                                @endif

                                @if($val->is_send == '1')
                                    <td style="color: #FE0000;font-weight: bold;">是</td>
                                @else
                                    <td>否</td>
                                @endif
                                @if($val->is_get == '1')
                                    <td style="color: green;font-weight: bold;">已领取</td>
                                @elseif($val->is_get == '2')
                                    <td style="color: #FE0000;font-weight: bold;">失败/退还</td>
                                @else
                                    <td>否</td>
                                @endif
                                @if($val->is_close == '1')
                                    <td style="color: #FE0000;font-weight: bold;">是</td>
                                @else
                                    <td>否</td>
                                @endif
                                <td>{{$val->created_at}}</td>
                                @if($val->is_close !=1)
                                    <td class="td-manage">
                                        @if($val->is_send != 1)
                                            <button class="btn btn-success radius"
                                                    onclick="agree('{{$val->money}}','{{$val->order_no}}','{{$val->account}}','{{$val->type}}')"
                                                    title="通过">通过
                                            </button>
                                            <button class="btn btn-danger radius" onclick="reject('{{$val->order_no}}')" title="拒绝">拒绝</button>
                                        @elseif($val->is_get == 1)
                                            <button class="btn btn-secondary radius">已领取</button>
                                        @elseif($val->is_get == 2)
                                            <button class="btn btn-danger radius">失败/退还</button>
                                        @else
                                            <button class="btn btn-secondary radius">待领取</button>
                                        @endif
                                    </td>
                                @else
                                    <td class="td-manage">
                                        <button class="btn btn-danger radius">已拒绝</button>
                                    </td>
                                @endif
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>
                <div id="pull_right">
                    <div class="pull-right">
                        {!! $lists->render() !!}
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
    function agree(money, order_no, account, type) {
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/admin/packet/send',
            data: {money: money, order_no: order_no, account: account, type: type},
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    layer.msg(data.msg, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.msg, {icon: 2, time: 1000});
                }
                window.location.replace(location.href);
            }
        });
    }

    function reject(order_no) {
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/admin/packet/reject',
            data: {order_no: order_no},
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    layer.msg(data.msg, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.msg, {icon: 2, time: 1000});
                }
                window.location.replace(location.href);
            }
        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>