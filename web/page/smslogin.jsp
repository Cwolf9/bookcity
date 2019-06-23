<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/23
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<div>${error}</div>
<form action="${pageContext.servletContext.contextPath}/smslogin.do" method="post">
    <img src="${pageContext.servletContext.contextPath}/imgs/myphoto.jpg" alt="myphoto"/><br><br>
    手机号：<input type="text" name="phonenumber" id="phonenumber" value="${myphone}"><br><br>
    短信验证码：<input type="text" name="smscode"><a href="javascript:void(0);" onclick="sendsms()">发送验证码</a>
    <br><br>
    <input type="submit" value="登录">
</form>
<script>
    function sendsms() {
        var phone = document.getElementById("phonenumber").value;
        href = "${pageContext.servletContext.contextPath}/sendsmscode.do?phonenumber="+phone;
    }
</script>










</body>
</html>