<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/19
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>这是default!</h1>
<h2>request.getContextPath()</h2>
<h2>request.getPathInfo()</h2>
<script>
    alert(1);
    alter(request.getContextPath());
</script>
<%
    //        跳转到index servlet拿数据
    response.sendRedirect(request.getContextPath()+"/index.jsp");
//    request.getRequestDispatcher("index.jsp").forward(request, response);
%>
</body>
</html>