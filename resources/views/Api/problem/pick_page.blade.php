<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="{{asset('statics/static/page/css/common.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('statics/static/page/css/cssall.css')}}" rel="stylesheet" type="text/css"/>
    <title>提现帮助</title>
</head>
<style>
    .wxTxbzBox img {
        width: 100%;
    }
</style>
<body>
<div class="bodyIn" style="padding-bottom:20px;">
    <div class="wxTop" style="position:absolute; left:0px; top:0px; position:fixed;">
        <div class="wxTopMiddle"><h1>关注微信公众号</h1></div>
    </div>
    <div class="wxTxbzBox" style="padding-top:60px; width:94%; margin:auto;line-height: 30px;">
        {!! $news !!}
    </div>
</div>
</body>
</html>