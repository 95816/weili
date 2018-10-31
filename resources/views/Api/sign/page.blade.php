<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>签到页面</title>
</head>

<body>
<div class="bodyIn bodyQd">
    <div class="qdTop">
        <div class="qdTopTitle"><h1>签到中心</h1></div>
        <div class="qdTopXz">
            @if($bool)
                <a href="javascript:void(0)" onclick="sign('{{$token}}')"><i class="qiandao">&#xe501;</i>&nbsp;&nbsp;立即签到</a>
            @else
                <a href="javascript:void(0)" onclick="Signed()" style="background-color: grey"><i class="qiandao">&#xe501;</i>&nbsp;&nbsp;立即签到</a>
            @endif
        </div>
        <div class="qdTopMsg"><a href="tingwan://activity/help">金币就是钱,金币越多钱越多!更多赚钱攻略<i class="xiangyou">&#xe6c1;</i></a></div>
    </div>
    <div class="qdYinbiBox">
        <ul class="qdYinbiList">
            @if(!empty($signData))
                @foreach($signData as $key=> $val)
                    <li>
                        <div class="qdYinbizong">
                            <div class="qdYinbiIn">
                                <span>第{{$key+1}}关</span>
                                <em class="icon1"></em>
                                <p>+{{$val}}</p>
                            </div>
                            @if($key < $num)
                                <div class="qdYinbiBg"></div>
                            @endif
                        </div>
                    </li>
                @endforeach
            @endif
            <div class="clear"></div>
        </ul>
    </div>
    <div class="qdGkzqBox">
        <div class="qdGkzqIn">
            <span><img src="{{asset('statics/static/page/example/images/text2.png')}}"/></span>
            <dl>
                <dt>更快赚钱!成功1人立赚10元</dt>
                <dd>好友使用{{$appInfoData['app_name']}}，输入您的邀请码，您即可坐享收益</dd>
            </dl>
            <div class="clear"></div>
        </div>
        <div class="qdGkzqHy">
            <p><i class="duihao">&#xe784;</i>&nbsp;&nbsp;好友登录,奖励<span>3</span>元</p>
            <p><i class="duihao">&#xe784;</i>&nbsp;&nbsp;好友登录,坐享<span>30%</span>分成</p>
            <p><i class="duihao">&#xe784;</i>&nbsp;&nbsp;好友搜索,你也拿金币</p>
        </div>
        <div class="qdGkzqMsg">
            小贴士:80%的用户邀请2个活跃的好友后,<br/>
            每天都轻松提现
        </div>
    </div>
    <div class="qdYqhySubmit"><a href="http://newadmin.tingwan.com/api/enter/page?token={{$token}}&uid={{$uid}}&is_show=ok&machineCode={{$machineCode}}"
                                 title="邀请好友">邀请好友</a></div>
</div>
</body>
</html>
<script src="{{asset('statics/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script>
    function sign(token) {
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/api/user/sign',
            data: {'token': token},
            dataType: "json",
            headers: {'token': token},
            success: function (data) {
                console.log(data);
                $(".qdYinbiIn").eq(data.num).append('<div class="qdYinbiBg"></div>');
                //签到成功把按钮替换成已签到的
                $('.qdTopXz').html('<a href="javascript:void(0)" onclick="Signed()" style="background-color: grey"><i class="qiandao">&#xe501;</i>&nbsp;&nbsp;立即签到</a>');
                tingwan.showToast(data.msg);
            }
        })
    }

    function Signed() {
        tingwan.showToast('您今天已经签到完成.请明天再来哦!');
    }
</script>