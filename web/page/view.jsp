<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/24
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_main.css">
</head>

<body>
<div class="limiter">
    <div class="container-login100" style="background-image: url('${pageContext.servletContext.contextPath}/imgs/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" action="${pageContext.servletContext.contextPath}/login.do" method="post">
                <span class="login100-form-title p-b-49">登录</span>
                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input class="input100" type="text" name="account" placeholder="请输入用户名" autocomplete="off" value="${u.account}">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input class="input100" type="password" name="pwd" placeholder="请输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="请输入验证码">
                        <span class="label-input100" style="margin-top: 5px;">验证码</span>
                        <img style="margin-top: 5px;margin-left: 5px;" src="${pageContext.servletContext.contextPath}/code.do" alt="code" onclick="changeCode(this)">
                    <input class="input100" type="text" name="code" placeholder="请输入验证码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="text-left p-t-8 p-b-31">
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp">验证码登录</a>
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp" style="float: right">忘记密码？</a>
                </div>
                <%--<div class="text-right p-t-8 p-b-31">--%>
                <%--</div>--%>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${error}</div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">登 录</button>
                    </div>
                </div>

                <div class="txt1 text-center p-t-54 p-b-20">
                    <span>第三方登录</span>
                </div>

                <div class="flex-c-m">
                    <a href="javascript:void(0)" class="login100-social-item bg1">
                        <i class="fa fa-facebook"></i>
                    </a>

                    <a href="javascript:void(0)" class="login100-social-item bg2">
                        <i class="fa fa-twitter"></i>
                    </a>

                    <a href="javascript:void(0)" class="login100-social-item bg3">
                        <i class="fa fa-google"></i>
                    </a>
                </div>

                <div class="flex-col-c p-t-25">
                    <a href="${pageContext.servletContext.contextPath}/page/register.jsp" class="txt2">立即注册</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.servletContext.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/main.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    //改变验证码
    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
    }
</script>
</body>

</html>