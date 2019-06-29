<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/18
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
    <script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/search.css" rel="stylesheet">
    <style>
        body {
            background: #494A5F;
            font-weight: 500;
            font-family: "Microsoft YaHei","宋体","Segoe UI", "Lucida Grande", Helvetica, Arial,sans-serif, FreeSans, Arimo;
        }
    </style>
</head>
<body>
<h1>Hello!${ptu.username}</h1>
<h2>这是index</h2>
<button class="btn btn-warning " type="button" onclick="UserLogout()">
    退出
</button>

<div id="container">
    <div class="search bar2">
        <form action="${pageContext.servletContext.contextPath}/searchBook.action" method="post">
            <input type="text" placeholder="请输入您要搜索书籍的关键字..." id="searchbar" name="searchbar">
            <button type="submit"></button>
        </form>
    </div>
</div>



<script>
    function UserLogout() {
        bootbox.confirm({
            message: "确定要退出账号吗?",
            buttons: {
                confirm: {
                    label: '确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    window.location.href = "${pageContext.servletContext.contextPath}/userlogout.action";
                }
            }
        });
    }
</script>
</body>
</html>
