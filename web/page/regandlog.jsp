<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/25
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="sie-edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/login_style.css" >
    <title>登录注册页面</title>
    <!--图标库-->
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

</head>

<body style="background-image: url('${pageContext.servletContext.contextPath}/imgs/img1.png'); background-size: cover;">

<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>第三方按钮注册</h1>
            <div class="social-container"> <a href="#" class="social">
                <ion-icon name="logo-facebook"></ion-icon>
            </a> <a href="#" class="social">
                <ion-icon name="logo-googleplus"></ion-icon>
            </a> <a href="#" class="social">
                <ion-icon name="logo-linkedin"></ion-icon>
            </a> </div>
            <span>或使用您的电子邮箱注册</span>
            <input type="text" placeholder="姓名">
            <input type="email" placeholder="邮箱">
            <input type="password" placeholder="密码">
            <button>注册</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="#">
            <h1>第三方登录</h1>
            <div class="social-container"> <a href="#" class="social">
                <ion-icon name="logo-facebook"></ion-icon>
            </a> <a href="#" class="social">
                <ion-icon name="logo-googleplus"></ion-icon>
            </a> <a href="#" class="social">
                <ion-icon name="logo-linkedin"></ion-icon>
            </a> </div>
            <span>或用邮箱登录</span>
            <input type="email" placeholder="邮箱">
            <input type="password" placeholder="密码">
            <button>登录</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>欢迎回来</h1>
                <p>与我们保持联系请登录您的个人信息</p>
                <button class="ghost" id="signIn">登录</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>欢迎光临</h1>
                <p>输入您的个人资料，并与我们一起开始旅程</p>
                <button class="ghost" id="signUp">注册</button>
            </div>
        </div>
    </div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });


    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>

</body>
</html>
