<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/22
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<!-- <body> -->
<frameset rows="40,*" frameborder="1" border="1" noresize>
    <frame src="${pageContext.servletContext.contextPath}/page/top.jsp" scrolling="no">
    <frameset cols="200,*">
        <frame src="${pageContext.servletContext.contextPath}/page/menu.jsp" scrolling="no">
        <frame name="right" src="${pageContext.servletContext.contextPath}/page/index.jsp" >
    </frameset>
</frameset>
<!-- </body> -->
</html>
