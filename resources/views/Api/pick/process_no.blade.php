<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>没有提现记录</title>
</head>

<body>
<div class="bodyIn" style="padding-bottom:60px;">
    <div class="wxTop" style="background: {{$appInfoData['bg_color']}}">
        <div class="wxTopMiddle"><h1>提现进度</h1></div>
    </div>
    <div class="wxNdshBox">
        <span></span>
        <p>您当时还没有提交提现申请</p>
    </div>
    <div class="wxTszhBox">提示:提现之后不要着急哦,<span>24小时内会到账</span>。【周末和法定假日提交的提现不处理,会统一周一开始处理】</div>
    <div class="wxTszhCont">
        <dl>
            <dt>微信提现用户提示</dt>
            <dd>记得要在听玩游戏微信公众号中领取红包(24小时有效),如过期未领取会返还至您的金币账户。</dd>
        </dl>
    </div>
    <div class="wxCktxBox"><a href="#" style="background: {{$appInfoData['bg_color']}}" title="查看提现帮助">查看提现帮助</a></div>
</div>
</body>
</html>