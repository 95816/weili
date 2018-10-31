<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>提现授权页面</title>
</head>

<body>
<div class="bodyIn txsqMsg">
    <div class="wxTop" style="position:absolute; left:0px; top:0px; position:fixed;">
        <div class="wxTopMiddle"><h1>微信提现已授权成功</h1></div>
    </div>
    <div class="txsqBox" style="margin-top: 35px;">
        <h1>微信提现已授权成功!</h1>
        <p>你已经开通微信提现,现在可以去“<br/><a href="#">听玩游戏宝</a>”APP内微信提现了</p>
        <div class="clear"></div>
    </div>
    <div class="txsqTxBox">
        <h2>如何提现</h2>
        <dl>
            <dt>1、进入"听玩游戏宝"APP,进入【我的】界面,选择提现兑换。</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu1.png')}}"/></dd>
        </dl>
        <dl>
            <dt>2、选择您要提现的金额,点击“申请提现”。</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu2.jpg')}}"/></dd>
        </dl>
        <dl>
            <dt>3、返回公众号,你将收到<span>听玩游戏</span>给你发的红包,点击领取即可完成提现。</dt>
        </dl>
    </div>
    <div class="wxZxzxSub">
        <a href="/api/pay/page?token={{$token}}" id="inviteUser" title="去提现">去提现</a>
    </div>
</div>
</body>
</html>