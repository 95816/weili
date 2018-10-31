<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>邀请好友页</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        .aBlack a, .aBlack {
            color: #333333;
            text-decoration: none;
        }

        img {
            border: none;
            vertical-align: top;
        }

        li {
            list-style-type: none;
        }

        ul, dl, ol {
            list-style: none;
        }

        h1, h3, h4, h5, h6 {
            font-weight: normal;
            font-size: 100%;
        }

        h2 {
            font-size: 18px;
            color: #333333;
            font-weight: normal;
        }

        body {
            font: 14px "微软雅黑";
            max-width: 768px;
            min-width: 320px;
            margin: auto;
            background: #F7F7F7;
        }

        .bodyIn {
            background: #ffffff;
            position: relative;
            padding-bottom: 65px;
        }

        address, cite, code, em, th {
            font-weight: normal;
            font-style: normal;
        }

        .clear {
            clear: both;
        }

        a {
            outline: none;
        }

        .mobTwTop {
            width: 100%;
            position: relative;
        }

        .mobTwImg {
            width: 100%;
        }

        .mobTwImg img {
            width: 100%;
            height: 250px;
        }

        .mobTwFan {
            width: 95px;
            height: 95px;
            position: absolute;
            left: 15px;
            top: 20px;
            z-index: 99;
        }

        .mobTwFan a {
            display: none;
            width: 45px;
            height: 45px;
            background: url({{asset('statics/static/page/example/bg2.png')}}) no-repeat;
            background-size: 45px 45px;
        }

        .mobTwYao {
            width: 80%;
            height: 150px;
            background: #FFFFFF;
            box-shadow: 5px 5px 25px 0px #FF6F6F;
            position: absolute;
            left: 10%;
            top: 80%;
            border-radius: 7px;
        }

        .mobTwYaoBg {
            width: 100%;
            height: 110px;
            background: #E6120F;
            border-radius: 7px 7px 0px 0px;
        }

        .mobTwYaoTitle {
            width: 100%;
        }

        .mobTwYaoTitle h2 {
            float: left;
            font-size: 18px;
            color: #FFFFFF;
            margin: 10px 0px 0px 15px;
        }

        .mobTwYaoTitle a {
            display: block;
            float: right;
            font-size: 14px;
            color: #FFFFFF;
            text-decoration: none;
            margin: 13px 10px 0px 0px;
        }

        .mobTwQl {
            font-size: 40px;
            color: #FFFFFF;
            margin: 10px 0px 0px 15px;
        }

        .mobRhsyBox {
            float: right;
            margin-top: 10px;
            margin-right: 15px;
            color: #999999;
        }

        .mobRhsyBox a {
            color: #999999;
            text-decoration: none;
        }

        @font-face {
            font-family: 'shiyong';
            src: url({{asset('statics/static/page/fonts/iconfont1.eot')}});
            src: url({{asset('statics/static/page/fonts/iconfont1.eot?#iefix')}}) format('embedded-opentype'),
            url({{asset('statics/static/page/fonts/iconfont1.woff')}}) format('woff'),
            url({{asset('statics/static/page/fonts/iconfont1.ttf')}}) format('truetype'),
            url({{asset('statics/static/page/fonts/iconfont1.svg#iconfont')}}) format('svg');
        }

        .shiyong {
            font-family: "shiyong" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .mobTwMenu {
            width: 100%;
            margin-top: 130px;
            border-bottom: 8px solid #EFEFEF;
            padding-bottom: 10px;
        }

        .mobTwMenu li {
            float: left;
            width: 33.3%;
            text-align: center;
        }

        .mobTwMenu li a {
            display: inline-block;
            width: 72px;
            position: relative;
        }

        .mobTwMenu li a b {
            display: inline-block;
            width: 72px;
            height: 72px;
            background: url({{asset('statics/static/page/example/bg3.png')}}) no-repeat;
            background-size: 150px 150px;
        }

        .mobTwMenu li a b.icon1 {
            background-position: 0px 0px;
        }

        .mobTwMenu li a b.icon2 {
            background-position: -75px 0px;
        }

        .mobTwMenu li a b.icon3 {
            background-position: 0px -75px;
        }

        .mobTwMenu li a h3 {
            height: 18px;
            line-height: 18px;
            overflow: hidden;
            margin-top: 10px;
        }

        .mobTwMenu li a span {
            display: block;
            position: absolute;
            right: 0px;
            top: 0px;
            width: 40px;
            height: 20px;
            line-height: 20px;
            overflow: hidden;
            text-align: center;
            background: #FF5615;
            color: #FFFFFF;
            font-size: 12px;
            border-radius: 5px;
        }

        .mobJlsmBox {
            width: 100%;
            margin-top: 7px;
        }

        .mobJlsmTitle {
            width: 100%;
            height: 35px;
            border-bottom: 1px solid #DDDDDD;
        }

        .mobJlsmMenu {
            width: 100%;
        }

        .mobJlsmMenu li {
            float: left;
            width: 33.3%;
            height: 35px;
            line-height: 30px;
            font-size: 18px;
            text-align: center;
        }

        .mobJlsmMenu li.current {
            height: 34px;
            border-bottom: 1px solid #FE0000;
            color: #FE0000;
        }

        .mobJlsmCont {
            width: 100%;
        }

        .mobJlsmName {
            width: 100%;
            text-align: center;
            font-size: 16px;
            margin-top: 15px;
            color: #333333;
        }

        .mobJlsmName span {
            color: #FE0000;
        }

        .mobJlsmCont dl {
            width: 94%;
            margin: auto;
            margin-top: 12px;
        }

        .mobJlsmCont dl dt {
            width: 100%;
            color: #D00219;
            font-size: 16px;
        }

        .mobJlsmCont dl dd {
            line-height: 23px;
            color: #333333;
            margin-top: 5px;
        }

        .mobJlsmCont dl dd span {
            color: #D00219;
        }

        .mobJlgzBox {
            width: 94%;
            margin: auto;
            margin-top: 12px;
        }

        .mobJlgzTitle {
            width: 100%;
            color: #D00219;
            font-size: 16px;
        }

        .mobJlgzIn {
            width: 100%;
            margin-top: 12px;
        }

        .mobJlgzIn span {
            display: block;
            width: 100%;
            height: 35px;
        }

        .mobJlgzIn span.width1 {
            background: #F4F4F4;
        }

        .mobJlgzIn span em {
            display: block;
            width: 50%;
            float: left;
            line-height: 35px;
            text-align: center;
            color: #333333;
            overflow: hidden;
        }

        .mobJlgzCont {
            width: 94%;
            background: #F4F4F4;
            margin: auto;
            margin-top: 10px;
        }

        .mobJlgzContIn {
            width: 94%;
            margin: auto;
            line-height: 23px;
            padding: 7px 0px;
        }

        .mobJlgzContIn span {
            color: #D0011B;
        }

        .mobDbBox {
            width: 100%;
            position: absolute;
            bottom: 55px;
            position: fixed;
            left: 0px;
            z-index: 999;
        }

        .mobDdIn {
            width: 100%;
            height: 120px;
            background: #cccccc;
        }

        .mobTwMenuIn {
            padding-top: 10px;
        }

        .mobTxyqBox {
            width: 100%;
            position: absolute;
            bottom: 0px;
            position: fixed;
            background: #FFFFFF;
            border-top: 1px solid #E3E3E3;
            padding: 8px 0px;
            left: 0px;
        }

        .mobTxyqBox h3 {
            float: left;
            font-size: 18px;
            color: #D0011B;
            margin-top: 10px;
            margin-left: 3%;
        }

        .mobTxyqBox a {
            display: block;
            float: right;
            width: 40%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: #D0011B;
            color: #FFFFFF;
            border-radius: 7px;
            text-decoration: none;
            margin-right: 3%;
        }

        .hPopBoxAll {
            display: none;
            left: 0;
            top: 0;
            z-index: 99;
            display: block;
            width: 100%;
            height: 100%;
            position: fixed;
        }

        .hPopBoxBg {
            width: 100%;
            height: 100%;
            background: url({{asset('statics/static/page/example/bg5.png')}}) repeat;
            position: absolute;
            left: 0px;
            top: 0px;
        }

        .hpopBox {
            width: 300px;
            height: 360px;
            background: url({{asset('statics/static/page/example/bg4.png')}}) no-repeat;
            margin: auto;
            position: relative;
            margin-top: 200px;
        }

        @font-face {
            font-family: 'guanbi';
            src: url({{asset('statics/static/page/fonts/iconfont2.eot')}});
            src: url({{asset('statics/static/page/fonts/iconfont2.eot?#iefix')}}) format('embedded-opentype'),
            url({{asset('statics/static/page/fonts/iconfont2.woff')}}) format('woff'),
            url({{asset('statics/static/page/fonts/iconfont2.ttf')}}) format('truetype'),
            url({{asset('statics/static/page/fonts/iconfont2.svg#iconfont')}}) format('svg');
        }

        .guanbi {
            font-family: "guanbi" !important;
            font-size: 22px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .mobSryBox {
            text-decoration: none;
            margin: 17px 5px 0px 0px;
            position: absolute;
            right: 0px;
            top: 5px;
        }

        .mobSryBox a {
            color: #FFFFFF;
            text-decoration: none;
            display: block;
            width: 35px;
            height: 35px;
        }

        .mobSryIn {
            width: 100%;
            text-align: center;
        }

        .mobSryIn p {
            font-size: 16px;
            color: #FFD660;
            padding-top: 15px;
        }

        .mobSryIn h1 {
            font-size: 20px;
            color: #FFD660;
            padding-top: 10px;
        }

        .mobSryInput input.text1 {
            width: 260px;
            height: 35px;
            background: none;
            border: none;
            background: #FFFFFF;
            font-size: 14px;
            line-height: 35px;
            color: #666666;
            border-radius: 100px;
            margin: 25px 0px 0px 20px;
            outline: none;
            text-align: center;
        }

        .mobSryMsg {
            width: 100%;
            color: #F9AA83;
            text-align: center;
            margin-top: 25px;
            line-height: 23px;
        }

        .mobSrySub {
            width: 60px;
            height: 60px;
            margin: auto;
            padding-top: 25px;
        }

        .mobSrySub a {
            display: block;
            width: 60px;
            height: 60px;
            background: url({{asset('statics/static/page/example/bg3.png')}}) no-repeat -75px -75px;
            background-size: 150px 150px;
        }

        .hWeixing {
            width: 300px;
            height: 360px;
            background: #FFFFFF;
            margin: auto;
            position: relative;
            margin-top: 200px;
        }

        .hWeixing span {
            display: block;
            width: 250px;
            height: 250px;
            margin: auto;
            padding-top: 25px;
        }

        .hWeixing span img {
            width: 250px;
            height: 250px;
        }

        .hWeixing p {
            font-size: 14px;
            color: #333333;
            text-align: center;
            margin: 18px 0px 0px 0px;
            line-height: 23px;
        }
    </style>
</head>
<body>
<div class="bodyIn">
    <div class="mobTwTop">
        <div class="mobTwImg"><img src="{{$appInfoData['image_url']}}"/></div>
        <div class="mobTwFan"><a href="#"></a></div>
        <div class="mobTwYao">
            <div class="mobTwYaoBg">
                <div class="mobTwYaoTitle">
                    <h2>我的邀请码</h2>
                    <a href="JavaScript:void(0)" onclick="copy('{{$invitationCode}}')" title="点击可复制">点击可复制</a>
                    <div class="clear"></div>
                </div>
                <div class="mobTwQl">{{$invitationCode}}</div>
            </div>
            <div class="mobRhsyBox"><a href="#">如何使用 <i class="shiyong">&#xe7c9;</i></a></div>
        </div>
    </div>
    <ul class="mobTwMenu">
        <li><a href="tingwan://coin/share?type=wx" title="微信" class="aBlack"><b class="icon1"></b>
                <h3>微信</h3><span>推荐</span></a></li>
        <li><a href="tingwan://coin/share?type=pyq" title="朋友圈" class="aBlack"><b class="icon2"></b>
                <h3>朋友圈</h3></a></li>
        <li><a href="tingwan://coin/share?type=f2f" title="面对面扫码" class="aBlack"><b class="icon3"></b>
                <h3>面对面扫码</h3></a></li>
        <div class="clear"></div>
    </ul>
    <div class="mobJlsmBox">
        <div class="mobJlsmTitle">
            <ul class="mobJlsmMenu">
                <li class="current">奖励说明</li>
                <li>我的说明</li>
            </ul>
        </div>
        <div class="content1 mobJlsmCont">
            <div class="layout1">
                <div class="mobJlsmName"><span>—</span> 邀请的好处 <span>—</span></div>
                <dl>
                    <dt>1、邀请奖励</dt>
                    <dd>好友(未下载使用{{$appInfoData['app_name']}}
                        )下载APP并输入您的<span>邀请码</span>后,您可获得<span>30000金币</span>。该金币分<span>多次</span>发放,<span>首次</span>邀请可额外获得<span>10000金币奖励</span></dd>
                </dl>
                <dl>
                    <dt>2、提成奖励规则</dt>
                    <dd>
                        好友每获得<span>100金币</span>的阅读收益,您将额外获得<span>30金币</span>的贡献;好友完成搜索任务,您还将额外获得金币贡献。
                    </dd>
                </dl>
                <div class="mobJlgzBox">
                    <div class="mobJlgzTitle">3、邀请奖励规则</div>
                    <div class="mobJlgzIn">
                        <span class="width1">
                           <em>次数</em>
                           <em>奖励金币</em>
                        </span>
                        @if(!empty($firstData))
                            @foreach($firstData as $key=> $val)
                                <span @if($key%2==1)class="width1"@endif>
                               <em>第{{$key}}次</em>
                               <em>{{$val}}</em>
                             </span>
                            @endforeach
                        @endif
                    </div>
                </div>
                <div class="mobJlgzCont">
                    <div class="mobJlgzContIn">每成功邀请1个好友(未下载使用{{$appInfoData['app_name']}}),即可获得<span>30000金币</span>。当好友填写您的邀请码,您和好友均可立即获得3000金币奖励。您余下27000金币奖励将分7次发放(自邀请成功的<span>第二天</span>起),只需您的好友单日获得<span>200金币</span>以上的<span>游戏</span>奖励,
                        您即可得到1次奖励。每位好友每天至多发放<span>1次</span>,该奖励自邀请成协之日起<span>30日</span>内有效。<br/>
                        如有作弊嫌疑,将不会获得金币奖励
                    </div>
                </div>
                <div class="mobJlgzBox">
                    <div class="mobJlgzIn">
                        <span class="width1">
                           <em>次数</em>
                           <em>奖励金币</em>
                        </span>
                        @if(!empty($afterData))
                            @foreach($afterData as $key=> $val)
                                <span @if($key%2==1)class="width1"@endif>
                               <em>第{{$key+1}}次</em>
                               <em>{{$val}}</em>
                             </span>
                            @endforeach
                        @endif

                    </div>
                </div>
                <div class="mobJlgzCont">
                    <div class="mobJlgzContIn">
                        每成功邀请1个好友(已下载使用{{$appInfoData['app_name']}})。当好友填写您的邀请码,您可获得<span>2700金币</span>奖励。该奖励将分7次发放(自邀请成功的<span>第二天</span>起),只需您的好友单日获得<span>200金币</span>以上的<span>游戏</span>奖励,
                        您即可得到1次奖励。每位好友每天至多发放<span>1次</span>,该奖励自邀请成协之日起<span>30日</span>内有效。<br/>
                        如有作弊嫌疑,将不会获得金币奖励
                    </div>
                </div>

                <div class="mobDbBox">
                    <div class="mobDdIn" style="display: none;">
                        <ul class="mobTwMenu mobTwMenuIn">
                            <li><a href="tingwan://coin/share?type=wx" title="微信" class="aBlack"><b class="icon1"></b>
                                    <h3>微信</h3><span>推荐</span></a></li>
                            <li><a href="tingwan://coin/share?type=pyq" title="朋友圈" class="aBlack"><b class="icon2"></b>
                                    <h3>朋友圈</h3></a></li>
                            <li><a href="tingwan://coin/share?type=f2f" title="面对面扫码" class="aBlack"><b class="icon3"></b>
                                    <h3>面对面扫码</h3></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                    <div class="mobTxyqBox">
                        <h3 onclick="enter_code()">填写邀请码</h3>
                        <a href="javascript:void(0)" id="inviteUser" title="立刻邀请好友">立刻邀请好友</a>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="hPopBoxAll" id="showPage" @if($is_show == 'ok')style="display:block;" @else style="display:none;"@endif>
    <div class="hPopBoxBg">
        <div class="hpopBox">
            <div class="mobSryBox"><a href="javascript:void(0)"><i class="guanbi">&#xe624;</i></a></div>
            <div class="mobSryIn">
                <p onclick="downPage()">输入邀请码</p>
                <h1>可获得3000金币</h1>
            </div>
            <input type="hidden" value="{{$token}}" id="token">
            <input type="hidden" value="{{$machineCode}}" id="machine">
            <div class="mobSryInput"><input type="text" name="inviteCode" value="" id="inviteCode" class="text1"/></div>
            <div class="mobSryMsg">在好友的邀请信息中可以找到TA的邀请码<br/>或直接向好友索要</div>
            <div class="mobSrySub"><a href="javascript:void(0)" id="submit" title="领取"></a></div>
            <div class="mobSryMsg" style="margin-top:13px;">也可以通过“我的”，“每日任务”“输入<br/>邀请码”完成邀请码输入</div>
        </div>
    </div>
</div>
<div class="hPopBoxAll" style="display:none;">
    <div class="hPopBoxBg">
        <div class="hWeixing">
            <span><img src="{{asset('statics/static/page/example/images/text1.png')}}"/></span>
            <p>扫描二维码，下载{{$appInfoData['app_name']}}<br>
                注册后填写邀请码成为徒弟
            </p>
        </div>
    </div>
</div>
</body>
<script src="{{asset('statics/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script>

    $('#submit').click(function () {
        var code = $('#inviteCode').val();
        var token = $('#token').val();
        var machineCode = $('#machine').val();
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/api/invite/enter',
            data: {inviteCode: code},
            dataType: "json",
            headers: {'token': token, 'machineCode': machineCode},
            success: function (data) {
                console.log(data);
                if (data.code == 200) {
                    $('#showPage').css('display', 'none');
                }
                tingwan.showToast(data.msg);

            }
        })
    });

    /**
     * 复制邀请码js
     * @param inviteCode
     */
    function copy(inviteCode) {
        tingwan.copyInviteCode(inviteCode);
    }

    /**
     * 弹起邀请界面
     */
    function enter_code() {
        $('.mobDdIn').css('display', 'none');
        $('#showPage').css('display', 'block');
    }

    /**
     * 关闭按钮
     */
    $('.guanbi').click(function () {
        $('#showPage').css('display', 'none');
    });


</script>
<script>
    $('#inviteUser').click(function () {
        var status = $('.mobDdIn').css("display");
        if (status == 'block') {
            $('.mobDdIn').css('display', 'none');
        } else {
            $('.mobDdIn').css('display', 'block');

        }
    })
</script>
</html>