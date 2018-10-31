<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>微信认证流程</title>
</head>

<body>
<div class="bodyIn wxGzhjuli">
    <div class="wxTop" style="position:absolute; left:0px; top:0px; position:fixed;">
        <div class="wxTopMiddle"><h1>关注微信公众号</h1></div>
    </div>
    <div class="wxQsyBox">
        <dl>
            <dt>请使用当前帐号绑定的微信号关注"<span>听玩游戏</span>"微信公众号,在公众号中点击菜单"<span>提现授权</span>",即可完成微信授权。</dt>
            <dd>注意:当前帐号绑定的微信号和"听玩游戏"微信公众号授权登录的微信号必须一致。</dd>
        </dl>
    </div>
    <div class="wxSqlcBox">
        <h1>授权流程</h1>
        <dl>
            <dt><span>1</span>打开微信,点击“搜索”</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu3.png')}}"/></dd>
        </dl>
        <dl>
            <dt><span>2</span>点击"公众号"</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu4.png')}}"/></dd>
        </dl>
        <dl>
            <dt><span>3</span>搜索并关注“<em>常德市创游戏网络</em>”</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu5.png')}}"/></dd>
        </dl>
        <dl>
            <dt><span>4</span>进入公众号",点击菜单<em>提现授权</em>"</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu6.png')}}"/></dd>
        </dl>
        <dl>
            <dt><span>5</span>确认登录后,即可完成微信提现授权</dt>
            <dd><img src="{{asset('statics/static/page/example/jietu/jietu7.png')}}"/></dd>
        </dl>
    </div>
    <div class="wxGzhSub"><a href="javascript:void(0);" onclick="auth()" title="打开微信,去公众号授权">打开微信,去公众号授权</a></div>
    <div class="wxPopBoxAll" style="display: none;">
        <div class="wxPopBoxBg">
            <div class="wxWeixing">
                <h1>恭喜,授权成功!</h1>
                <span><p>您已在公众号授权成功,金币可以兑换提现到微信了。</p></span>
                <a href="#" title="知道了">知道了</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function auth() {
        tingwan.openWx();
    }
</script>
</html>