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
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_main.css">
    <script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
    <style>
        .input100aa {
            font-family: Poppins-Medium;
            font-size: 16px;
            color: #333333;
            line-height: 1.2;
            display: block;
            width: 100%;
            height: 55px;
            background: transparent;
            padding: 18px 7px 0 7px;
        }
    </style>
</head>

<body>
<div class="limiter">
    <div class="container-login100" style="background-image: url('${pageContext.servletContext.contextPath}/imgs/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" method="post" id="loginForm">
                <span class="login100-form-title p-b-49">登录</span>
                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input class="input100" type="text" id="account" name="account" placeholder="请输入用户名" autocomplete="off" value="${u.adminacc}">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input class="input100" type="password" name="pwd" placeholder="请输入密码" id="pwd">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="请输入验证码">
                        <span class="label-input100" style="margin-top: 5px;">验证码</span>
                        <img style="margin-top: 5px;margin-left: 5px;" src="${pageContext.servletContext.contextPath}/code.do" alt="code" onclick="changeCode(this)">
                    <input class="input100" type="text" name="code" placeholder="请输入验证码" id="code">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
                <div class="wrap-input100" >
                    <span class="label-input100" style="margin-top: 15px;">是否登录管理员页面</span>
                    <%--<input class="input100" type="text" name="username" placeholder="请输入姓名">--%>
                    <div class="input100aa">
                        <div class="radio-primary" style="float:left; margin: 0 10px">
                            <input checked="checked" type="radio" name="sex" id="sex1" value="否">
                            <label for="sex1">否</label></div>
                        <div class="radio-primary" style="float:left;">
                            <input type="radio" name="sex" id="sex2" value="是">
                            <label for="sex2">是</label></div>
                    </div>
                    <%--<span class="focus-input100" data-symbol="&#xf190;"></span>--%>
                </div>
                <div class="text-left p-t-8 p-b-31">
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp">短信验证码登录</a>
                    <a href="${pageContext.servletContext.contextPath}/page/smslogin.jsp" style="float: right">忘记密码？</a>
                </div>
                <%--<div class="text-right p-t-8 p-b-31">--%>
                <%--</div>--%>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${error}</div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn">1</div>
                        <button class="login100-form-btn" onclick="Logina()">登 录</button>
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
    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
    }
    function Logina() {
        var url = ""
        if(document.getElementById("sex2").checked) {
            //是
            url = "${pageContext.servletContext.contextPath}/login.do?account="+$('#account').val()+
                    "&pwd="+hex_md5($('#pwd').val()) +"&code="+$('#code').val()
            document.getElementById("loginForm").setAttribute("action", url)
            document.querySelector("#loginForm").submit();
        } else {
            //否
            url = "${pageContext.servletContext.contextPath}/login.action?account="+$('#account').val()+
                "&pwd="+hex_md5($('#pwd').val())+"&code="+$('#code').val()
            document.getElementById("loginForm").setAttribute("action", url)
            document.querySelector("#loginForm").submit();
        }

    }
</script>

</body>

</html>