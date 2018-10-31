<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>帮助反馈</title>
</head>

<body>
<div class="bodyIn bodyQdIn">

    <div class="wxCjwtBox">
        <div class="wxCjwtTitle"><h2>常见问题</h2></div>
        @foreach($normalProblems as $key=> $val)
            <div class="wxCjwtIn">
                <div class="wxCjwtBiao">
                    <h3>{{$val->title}}</h3>
                    <div class="wxxiala"><i class="you">&#xe697;</i></div>
                    <div class="clear"></div>
                </div>
                <div class="wxCjwtCont">
                    <div class="wxCjwtContIn">{{strip_tags($val->description)}}</div>
                </div>
            </div>
        @endforeach
    </div>
    <div class="wxCjwtBox">
        <div class="wxCjwtTitle"><h2>提现问题</h2></div>
        @foreach($payProblems as $key=> $val)
            <div class="wxCjwtIn">
                <div class="wxCjwtBiao">
                    <h3>{{$val->title}}</h3>
                    <div class="wxxiala"><i class="you">&#xe697;</i></div>
                    <div class="clear"></div>
                </div>
                <div class="wxCjwtCont">
                    <div class="wxCjwtContIn">{{strip_tags($val->description)}}</div>
                </div>
            </div>
        @endforeach
    </div>
    <div class="wxWXtsBox"> 温馨提示:<br/>以上提现账户,一经绑定将无法自行修改。如出现账号问题,请直接联系"听玩手游宝"微信公众号客服。</div>
    <div class="wxWXtsCont">微信提现的用户,务必记得提现申请发送成功之后留意"听完手游宝"微信公众号是否给您发放了微信红包。红包发放之后,须在24小时内领取。超时未领取的红包会失效,提现金额会返还至您的听玩金币账户。</div>
    <div class="wxZxzxSub"><a href="javascript:void(0)" onclick="show_div()" title="在线咨询">在线咨询</a></div>
    <div class="wzPopBoxAll" style="display:none;">
        <div class="wzPopBoxBg">
            <div class="wzpopBox">
                <h1>关注“<span>听玩游戏</span>”公众号客服</h1>
                <h2>在微信公众号中搜索“听玩游戏"即可</h2>
                <div class="wzPopImg"><img src="{{asset('statics/static/page/example/images/text3.png')}}"/></div>
                <div class="wzPopSubmit">
                    <a href="javascript:void(0)" onclick="hide_div()" title="取消" class="line">取消</a>
                    <a href="javascript:void(0)" onclick="tingwan.openWx()" title="打开微信">打开微信</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{asset('statics/static/page/js/jquery-1.6.1.min.js')}}" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $('.wxCjwtBiao').toggle(function () {
            $(this).parent().find('.wxCjwtCont').show();
            $(this).find('.wxxiala').html('<i class="xiala">&#xe689;</i>');
        }, function () {
            $(this).parent().find('.wxCjwtCont').hide();
            $(this).find('.wxxiala').html('<i class="you">&#xe697;</i>');
        })

    })

    function show_div() {
        $('.wzPopBoxAll').css('display', 'block');
    }

    function hide_div() {
        $('.wzPopBoxAll').css('display', 'none');
    }
</script>
</body>
</html>