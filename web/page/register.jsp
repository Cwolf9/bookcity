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
    <title>Register</title>
</head>
<body>
<h1>注册</h1>
<!-- ${pageContext.servletContext.contextPath} == http://locaohost:8080/web/register.do -->
<form action="${pageContext.servletContext.contextPath}/register.do" method="post">
    账号：<input type="text" name="account" />
    <br/><br/>
    密码：<input type="password" name="pwd" />
    <br/><br/>
    姓名：<input type="text" name="username" />
    <br/><br/>
    性别：<input type="radio" name="sex" value="男" />男<input type="radio" name="sex" value="女" />女
    <br/><br/>
    手机号码：<input type="text" name="phonenumber" />
    <br/><br/>
    <input type="submit" value="注册" />
    <br/><br/>
</form>
</body>
</html>
