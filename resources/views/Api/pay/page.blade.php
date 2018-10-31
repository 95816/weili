<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <script src="{{asset('statics/static/page/js/jquery-1.6.1.min.js')}}" type="text/javascript"></script>
    <script src="{{asset('statics/static/page/js/common.js')}}" type="text/javascript"></script>
    <title>微信页面</title>
</head>

<body>
<div class="bodyIn">
    <div class="wxTop" style="background: {{$appInfoData['bg_color']}}">
        <div class="wxTopLeft"><a href="#" title="" style="display: none;"></a></div>
        <div class="wxTopMiddle" style=" float:left; width:59%;"><h1>兑换提现</h1></div>
        <div class="wxTopright"><a href="/api/pick/process?token={{$token}}" title="提现进度">提现进度</a></div>
    </div>
    <div class="wxTitle">
        <ul class="wxMenu menu1">
            <li class="current"><span>微信</span></li>
            <li style="display: none;"><span>支付宝</span></li>
        </ul>
    </div>
    <div class="content1">
        <input type="hidden" value="{{$token}}" id="token">
        <div class="layout1">
            <div class="wxRenBox">
                @if(empty($wxpayMark))
                    <p>尚未认证微信账户</p>
                    <a href="/api/verify/page?token={{$token}}&type=wxpay" title="去绑定">去绑定<i class="you">&#xe697;</i></a>
                @else
                    <p></p>
                    <a title="已认证">已认证</a>
                @endif
                <div class="clear"></div>
            </div>
            <ul class="wxRenList wxMark">
                <li>
                    <p>1元</p>
                    <span val="10000" my="1">10000金币</span>
                </li>
                <li>
                    <p>5元</p>
                    <span val="50000" my="5">50000金币</span>
                </li>
                <li>
                    <p>10元</p>
                    <span val="100000" my="10">100000金币</span>
                </li>
                <li>
                    <p>20元</p>
                    <span val="197000" my="20">197000金币</span>
                </li>
                <li>
                    <p>50元</p>
                    <span val="490000" my="50">490000金币</span>
                </li>
                <li>
                    <p>100元</p>
                    <span val="975000" my="100">975000金币</span>
                </li>
                {{--<li>--}}
                {{--<p>200元</p>--}}
                {{--<span val="1949000" my="200">1949000金币</span>--}}
                {{--</li>--}}
                <div class="clear"></div>
            </ul>
            <div class="wxCkbzBox">
                <a href="/api/pick/page?token={{$token}}" title="查看帮助">
                    <span></span>
                    <h3>查看帮助</h3>
                </a>
            </div>
            <div class="clear"></div>
            <div class="wxCkbzJb">
                <p>金币余额:{{$coins}}金币</p>
                @if($sMark)
                    <a href="JavaScript:void(0)" style="background-color: #888888" onclick="show_msg('今日提现机会已用完!')" title="今日提现机会已用完">今日提现机会已用完</a>
                @elseif(($coins >= 1000) && !empty($wxpayMark))
                    <a href="JavaScript:void(0)" onclick="wxpay_apply()" title="申请提现">申请提现</a>
                @else
                    <a href="JavaScript:void(0)" style="background-color: #888888" onclick="show_msg('当前状态不支持提现!')" title="申请提现">申请提现</a>
                @endif
            </div>
        </div>
        <div class="layout1" style="display:none;">
            <div class="wxRenBox">
                @if(empty($alipayMark))
                    <p>尚未认证支付宝账户</p>
                    <a href="/api/verify/page?token={{$token}}&type=alipay" title="去绑定">去绑定<i class="you">&#xe697;</i></a>
                @else
                    <p></p>
                    <a title="已认证">已认证</a>
                @endif
                <div class="clear"></div>
            </div>
            <ul class="wxRenList aliMark">
                <li>
                    <p>1元</p>
                    <span val="10000" my="1">10000金币</span>
                </li>
                <li>
                    <p>5元</p>
                    <span val="50000" my="5">50000金币</span>
                </li>
                <li>
                    <p>10元</p>
                    <span val="100000" my="10">100000金币</span>
                </li>
                <li>
                    <p>20元</p>
                    <span val="197000" my="20">197000金币</span>
                </li>
                <li>
                    <p>50元</p>
                    <span val="490000" my="50">490000金币</span>
                </li>
                <li>
                    <p>100元</p>
                    <span val="975000" my="100">975000金币</span>
                </li>
                {{--<li>--}}
                {{--<p>200元</p>--}}
                {{--<span val="1949000" my="200">1949000金币</span>--}}
                {{--</li>--}}
                <div class="clear"></div>
            </ul>
            <div class="wxCkbzBox">
                <a href="/api/pick/page?token={{$token}}" title="查看帮助">
                    <span></span>
                    <h3>查看帮助</h3>
                </a>
            </div>
            <div class="clear"></div>
            <div class="wxCkbzJb">
                <p id="remain_coins" val="{{$coins}}">金币余额:{{$coins}}金币</p>
                @if(($coins >= 1000) && !empty($alipayMark))
                    <a href="JavaScript:void(0)" onclick="alipay_apply()" style="background: {{$appInfoData['bg_color']}}" title="申请提现">申请提现</a>
                @else
                    <a href="JavaScript:void(0)" style="background-color: #888888" onclick="show_msg('当前状态不支持提现!')" title="申请提现">申请提现</a>
                @endif
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $("ul:gt(0)").each(function () {
            //取出ul下的第一个li
            var lis = $(this).children('li');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    $(this).addClass('hover');
                    $(this).siblings().removeClass('hover');
                }
            }
        });
    });

    function show_msg(msg) {
        tingwan.showToast(msg);
    }

    function alipay_apply() {
        var token = $('#token').val();
        var coins = $('.aliMark .hover').children('span').attr('val');
        var money = $('.aliMark .hover').children('span').attr('my');
        var remain_coins = $('#remain_coins').attr('val');
        if (coins == null) {
            tingwan.showToast('未选择提现金额');
            return;
        }
        if (parseInt(coins) > parseInt(remain_coins)) {
            tingwan.showToast('金币余额不足!');
            return;
        }
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/api/user/convert',
            data: {coins: coins, money: money, type: 2},
            dataType: "json",
            headers: {'token': token},
            success: function (data) {
                tingwan.showToast(data.msg);
                window.location.reload();
            }
        });
    }

    function wxpay_apply() {
        var token = $('#token').val();
        var coins = $('.wxMark .hover').children('span').attr('val');
        var money = $('.wxMark .hover').children('span').attr('my');
        var remain_coins = $('#remain_coins').attr('val');
        if (coins == null) {
            tingwan.showToast('未选择提现金额');
            return;
        }
        if (parseInt(coins) > parseInt(remain_coins)) {
            tingwan.showToast('金币余额不足!');
            return;
        }
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/api/user/convert',
            data: {coins: coins, money: money, type: 1},
            dataType: "json",
            headers: {'token': token},
            success: function (data) {
                tingwan.showToast(data.msg);
                window.location.reload();
            }
        });
    }


</script>
</html>