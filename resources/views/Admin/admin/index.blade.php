<!DOCTYPE HTML>
<html>
<head>
    <!--_meta 作为公共模版分离出去-->
@include('Common._meta')
<!--/meta 作为公共模版分离出去-->
    <title>Wei-li.admin 后台首页</title>
</head>
<body>
<!--_header 作为公共模版分离出去-->
@include('Common._header')
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
@include('Common._menu')
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">我的桌面</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <p class="f-20 text-success">欢迎使用APP联盟后台.商务QQ:944783426</p>
            <p>管理员：{{$result['adminInfo']['username']}} / {{$result['adminInfo']['real_name']}}</p>
            <p>上次登录IP：{{$result['adminInfo']['login_ip']}} 上次登录时间：{{date("Y-m-d H:i:s",$result['adminInfo']['login_time'])}}</p>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th colspan="7" scope="col">信息统计</th>
                </tr>
                <tr class="text-c">
                    <th>统计</th>
                    <th>资讯库</th>
                    <th>图片库</th>
                    <th>产品库</th>
                    <th>用户</th>
                    <th>管理员</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-c">
                    <td>总数</td>
                    <td>92</td>
                    <td>9</td>
                    <td>0</td>
                    <td>8</td>
                    <td>20</td>
                </tr>
                <tr class="text-c">
                    <td>今日</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr class="text-c">
                    <td>昨日</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr class="text-c">
                    <td>本周</td>
                    <td>2</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr class="text-c">
                    <td>本月</td>
                    <td>2</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                </tbody>
            </table>
            <table class="table table-border table-bordered table-bg mt-20">
                <thead>
                <tr>
                    <th colspan="2" scope="col">服务器信息</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th width="30%">数据库链接</th>
                    <td><span id="lbServerName">{{$result['server']['DB_CONNECTION']}}</span></td>
                </tr>
                <tr>
                    <td>服务器IP地址</td>
                    <td>{{$result['server']['SERVER_ADDR']}}</td>
                </tr>
                <tr>
                    <td>服务器域名</td>
                    <td>{{$result['server']['SERVER_NAME']}}</td>
                </tr>
                <tr>
                    <td>服务器端口</td>
                    <td>{{$result['server']['SERVER_PORT']}}</td>
                </tr>
                <tr>
                    <td>服务器版本</td>
                    <td>Nginx/1.11.5</td>
                </tr>
                <tr>
                    <td>本文件所在文件夹</td>
                    <td>{{$result['server']['DOCUMENT_ROOT']}}</td>
                </tr>
                <tr>
                    <td>服务器操作系统</td>
                    <td>{{$result['server']['SERVER_SOFTWARE']}}</td>
                </tr>
                <tr>
                    <td>服务器脚本超时时间</td>
                    <td>300秒</td>
                </tr>
                <tr>
                    <td>服务器的语言种类</td>
                    <td>Chinese (People's Republic of China)</td>
                </tr>
                <tr>
                    <td>服务器当前时间</td>
                    <td>{{date('Y-m-d H:i:s',$result['server']['REQUEST_TIME'])}}</td>
                </tr>
                <tr>
                    <td>数据库名称</td>
                    <td>{{$result['server']['DB_DATABASE']}}</td>
                </tr>
                <tr>
                    <td>链接数据库用户名</td>
                    <td>{{$result['server']['DB_USERNAME']}}</td>
                </tr>
                <tr>
                    <td>CPU 总数</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>当前Session数量</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>当前SessionID</td>
                    <td>gznhpwmp34004345jz2q3l45</td>
                </tr>
                <tr>
                    <td>当前系统用户名</td>
                    <td>{{$result['adminInfo']['username']}}</td>
                </tr>
                </tbody>
            </table>
        </article>
        <footer class="footer">
            <p>风雨同舟，坎坷同行，不放下就是自我修行。<br> Copyright &copy;2012-2018
                Wei-li.admin v3.0 All Rights Reserved.<br> 本后台系统由大爱平平提供技术支持</p>
        </footer>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="{{asset('statics/lib/jquery/1.9.1/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/lib/layer/2.4/layer.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui/js/H-ui.js')}}"></script>
<script type="text/javascript" src="{{asset('statics/static/h-ui.admin/js/H-ui.admin.page.js')}}"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

</script>
<!--/请在上方写此页面业务相关的脚本-->

</body>
</html>