<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/21
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>演示：紫色渐变登录页面</title>
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
            <form class="login100-form validate-form" action="${pageContext.servletContext.contextPath}/register.do" method="post">
                <span class="login100-form-title p-b-49">注册</span>

                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input class="input100" type="text" name="account" placeholder="请输入用户名" autocomplete="off">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input class="input100" type="password" name="pwd" placeholder="请输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="请输入姓名">
                    <span class="label-input100" style="margin-top: 5px;">姓名</span>
                    <input class="input100" type="text" name="username" placeholder="请输入姓名">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100" >
                    <span class="label-input100" style="margin-top: 5px;">性别</span>
                    <%--<input class="input100" type="text" name="username" placeholder="请输入姓名">--%>
                    <div class="input100" style="padding-top: 15px;">
                        <div class="radio-primary" style="float:left; margin: 0 10px">
                            <input checked="checked" type="radio" name="sex" id="sex1" value="男">
                            <label for="sex1">男</label></div>

                        <div class="radio-primary" style="float:left;">
                            <input type="radio" name="sex" id="sex2" value="女">
                            <label for="sex2">女</label></div>
                    </div>
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="请输入手机号码">
                    <span class="label-input100" style="margin-top: 5px;">手机号码</span>
                    <input class="input100" type="text" name="phonenumber" placeholder="请输入手机号码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <br/><br/>
                <div class="text-left p-t-8 p-b-31">
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp">验证码登录</a>
                    <a href="${pageContext.servletContext.contextPath}/page/view.jsp" style="float: right">账号密码登录</a>
                </div>
                <%--<div class="text-right p-t-8 p-b-31">--%>
                <%--</div>--%>
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
