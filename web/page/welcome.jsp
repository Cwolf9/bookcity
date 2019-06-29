<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台欢迎界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <style>
        .myright_bar {
            float: left;
            margin: 0 auto;
        }
    </style>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="page1"></div>
<script>
    $("#page1").load("${pageContext.servletContext.contextPath}/page/top.jsp");
</script>

<div class="myright_bar">
    <h1>Hello!</h1>
    <h2>这是index</h2>
    <h2>当前时间：${currentTime}</h2>
    $END$
</div>

<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    // 创建 Messger 实例
    var myMessager = new $.zui.Messager('欢迎管理员 &nbsp;&nbsp; ${u.adminacc} &nbsp;&nbsp; 登录！', {
        icon: 'heart',
        type: 'primary',
        time: 0 // 不进行自动隐藏
    });
    // 先显示消息
    if(document.referrer.match('view.jsp') ||document.referrer.match('smslogin.jsp')||document.referrer.match('adminlogout.do')) {
        myMessager.show();
        // 1 秒之后隐藏消息
        setTimeout(function() {
            myMessager.hide();
        }, 2000);
    }

</script>
</body>
</html>
