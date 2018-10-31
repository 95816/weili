<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <script src="{{asset('statics/static/page/js/jquery-1.6.1.min.js')}}" type="text/javascript"></script>
    <title>个人明细</title>
</head>

<body>
<div class="bodyIn">
    <div class="wxTop" style="background: {{$appInfoData['bg_color']}}">
        <div class="wxTopright"><a href="/api/pay/page?token={{$token}}" title="兑换提现">兑换提现</a></div>
    </div>
    @if($mark == 'coin')
        <div class="jbJrjbBox" style="background: {{$appInfoData['bg_color']}}">
            <div class="jbJrjbIn">
                <p>今日金币(个)</p>
                <h1>{{$today_coins}}</h1>
            </div>
            <div class="jbJrjbCont">
                <div class="jbJrjbLj">
                    <span>{{$totalCoins}}</span>
                    <p>累计金币</p>
                </div>
                <div class="jbJrjbLj jbJrjbLjbor">
                    <span>{{$remain_coin}}</span>
                    <p>金币余额</p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    @elseif($mark == 'money')
        <div class="jbJrjbBox" style="background: {{$appInfoData['bg_color']}}">
            <div class="jbJrjbIn">
                <p>金币余额</p>
                <h1>{{$remain_coin}}</h1>
            </div>
            <div class="jbJrjbCont">
                <div class="jbJrjbLj">
                    <span>{{$today_coins}}</span>
                    <p>今日金币(个)</p>
                </div>
                <div class="jbJrjbLj jbJrjbLjbor">
                    <span>{{$totalCoins}}</span>
                    <p>累计金币</p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    @endif
    <div class="jbMxTitle"><h2 style="color:{{$appInfoData['bg_color']}};border-bottom: 4px solid {{$appInfoData['bg_color']}}">金币明细</h2></div>
    <ul class="jbMxList">
        @foreach($lastTen as $key=> $val)
            <li>
                <dl>
                    @if($val->type ==1)
                        <dt>新手任务</dt>
                    @elseif($val->type ==2)
                        <dt>每日任务</dt>
                    @elseif($val->type ==3)
                        <dt>永久任务</dt>
                    @elseif($val->type ==5)
                        <dt>正常任务</dt>
                    @elseif($val->type ==6)
                        <dt>邀请任务</dt>
                    @elseif($val->type ==7)
                        <dt>签到任务</dt>
                    @elseif($val->type ==8)
                        <dt>金币兑换</dt>
                    @elseif($val->type ==9)
                        <dt>金币退还</dt>
                    @endif
                    <dd>{{$val->created_at}}</dd>
                </dl>
                <span @if($val->operate == 1)class="red" @elseif($val->operate==2)class="blue"@endif>@if($val->operate == 1)+@elseif($val->operate==2)
                        -@endif{{$val->coin}}</span>
                <div class="clear"></div>
            </li>
        @endforeach

    </ul>
    <div class="jbMxSubmit"><a href="#" title="邀请好友炫耀一下" style="background: {{$appInfoData['bg_color']}}">邀请好友炫耀一下</a></div>
</div>
</body>
</html>