<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/24
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
</head>
<body>
<nav class="menu" data-ride="menu" style="width: 200px">
    <ul id="treeMenu" class="tree tree-menu" data-ride="tree">
        <li><a href="#"><i class="icon icon-th"></i>首页</a></li>
        <li><a href="${pageContext.servletContext.contextPath}/person.do" target="right"><i class="icon icon-user"></i>个人资料</a></li>
        <li>
            <a href="#"><i class="icon icon-qq"></i>用户管理</a>
            <ul>
                <li><a href="${pageContext.servletContext.contextPath}/findAll.do" target="right">查询</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/page/save.jsp" target="right">添加</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="icon icon-user"></i>系统管理</a></li>
    </ul>
</nav>

<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>