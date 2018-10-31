<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <script src="{{asset('statics/static/page/js/jquery-1.6.1.min.js')}}" type="text/javascript"></script>
    <title>支付宝认证</title>
</head>

<body>
<div class="bodyIn">
    <div class="wxTop" style="background: {{$appInfoData['bg_color']}}">
        <div class="wxTopMiddle"><h1>支付宝认证</h1></div>
    </div>
    <div class="wxZsxmBox">
        <input type="hidden" value="{{$token}}" id="token">
        <div class="wxZsxmIn">
            <h2>真实姓名:</h2>
            <input type="text" value="请输入真实姓名" class="text1" id="real_name" onBlur="if(this.value=='') this.value='请输入真实姓名';"
                   onFocus="if(this.value=='请输入真实姓名') this.value='';"/>
        </div>
        <div class="wxZsxmIn">
            <h2>身份证号:</h2>
            <input type="text" value="请输入身份证号" class="text1" id="id_card" onBlur="if(this.value=='') this.value='请输入身份证号';"
                   onFocus="if(this.value=='请输入身份证号') this.value='';"/>
        </div>
        <div class="wxZsxmIn">
            <h2>支付宝账号:</h2>
            <input type="text" value="请输入支付宝账号" class="text1" id="account" onBlur="if(this.value=='') this.value='请输入支付宝账号';"
                   onFocus="if(this.value=='请输入支付宝账号') this.value='';"/>
        </div>
        <div class="wxZsxmSub"><input style="background: {{$appInfoData['bg_color']}}" type="submit" value="确定认证" class="submit1"/></div>
    </div>
    <div class="wxZsxmCont">
        应微信要求,开通微信结算需两个步骤,首先绑定实名认证,然后在官方公众号里授权。为了保证能准确到账,请如实填写,每个用户仅能绑定一次。
    </div>
    <div class="wxLxkfBox">
        <p>如果需要帮助,请联系在线客服</p>
        <div class="wxLxkfSubmit"><a href="tingwan://activity/help" title="在线咨询"><i class="kefu">&#xe501;</i> 在线咨询</a></div>
    </div>
</div>
</body>

<script>
    $('.submit1').click(function () {
        var realName = $('#real_name').val();
        var token = $('#token').val();
        var idCard = $('#id_card').val();
        var account = $('#account').val();
        $.ajax({
            type: 'post',
            url: 'http://newadmin.tingwan.com/api/user/verify',
            data: {realName: realName, idCard: idCard, type: 'alipay', account: account},
            dataType: "json",
            headers: {'token': token},
            success: function (data) {
                console.log(data);
                tingwan.showToast(data.msg);
                if (data.code == 200) {
                    tingwan.taskComplete("9");
                }
            },
        });
        return false;
    });
</script>
</html>