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
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <title>注册页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_main.css">
    <script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
</head>

<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('${pageContext.servletContext.contextPath}/imgs/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" action="${pageContext.servletContext.contextPath}/register.do" method="post" id="regForm">
                <span class="login100-form-title p-b-49">普通用户注册</span>

                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input class="input100" type="text" name="account" placeholder="请输入用户名(不少于6位，超过16位)" autocomplete="off" id="raccount">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input class="input100" type="password" name="pwd" placeholder="请输入密码(不少于4位，超过16位)" id="rpwd">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="请输入姓名">
                    <span class="label-input100" style="margin-top: 5px;">姓名</span>
                    <input class="input100" type="text" name="username" placeholder="请输入姓名" id="rusername">
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
                <br/><br/>
                <div class="text-left p-t-8 p-b-31">
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp">短信验证码登录</a>
                    <a href="${pageContext.servletContext.contextPath}/page/view.jsp" style="float: right">账号密码登录</a>
                </div>
                <%--<div class="text-right p-t-8 p-b-31">--%>
                <%--</div>--%>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${error}</div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" type="button" onclick="save()">注 册</button>
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
    function save() {
        var account = $('#raccount').val()
        var pwd = $("#rpwd").val()
        var username = $('#rusername').val()
        var jgpattern =/^[A-Za-z0-9]+$/;
        var jgpattern2 =/^[A-Za-z0-9-*/@#$%+]+$/;
        var success = true;
        if(!jgpattern.test(account)) {
            success = false;
            alert('账号只能包含数字和字母')
        }else if(account.length < 6 || account.length > 16) {
            alert('账号长度不合法')
            success = false
        }else if(pwd.length < 4 || pwd.length > 16) {
            alert('密码长度不合法')
            success = false
        }else if(!jgpattern2.test(pwd)) {
            success = false;
            alert('密码(只能包含字母，数字和{+-*/@#$%})')
        }
        $("#rpwd").val(pwd)
        pwd = $("#rpwd").val()
        var url = "${pageContext.servletContext.contextPath}/register.do?account="+account+"&pwd="+pwd+"&username="+username+"&sex=";
        if (document.getElementById("sex2").checked) url = url + "女";
        else url = url + "男";
        if(success) document.querySelector("#regForm").submit();
    }
</script>
</body>

</html>
