<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/21
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div>${error}</div>
111
<form action="${pageContext.servletContext.contextPath}/login.do" method="post">
    <img src="${pageContext.servletContext.contextPath}/imgs/myphoto.jpg" alt="myphoto" /><br><br>
    账号：<input type="text" name="account"><br><br>
    密码：<input type="password" name="pwd"><br><br>
    验证码：<input type="text" name="code">
    <img src="${pageContext.servletContext.contextPath}/code.do" alt="code" onclick="changeCode(this)">
    <br><br>
    <input type="submit" value="登录">
</form>
<script>
    //改变验证码
    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
    }
</script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
