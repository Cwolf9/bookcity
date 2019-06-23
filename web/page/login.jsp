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
</head>
<body>
<div>${error}</div>
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
</body>
</html>
