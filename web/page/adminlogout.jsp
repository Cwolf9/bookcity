<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/26
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注销</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <style>
        .mytop_bar {
            height: 40px;
            width: 100%;
        }
        .myright_bar {
            float: left;
            margin: 0 auto;
        }
    </style>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="page1"></div>
<script>
    $("#page1").load("${pageContext.servletContext.contextPath}/page/top.jsp");
</script>

<div class="myright_bar">
    <button type="button" class="btn btn-lg btn-primary" id="btn-lg" data-toggle="modal" data-target="#myModal"
            style="display: none;">启动对话框
    </button>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">关闭</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p>确定退出登录吗？</p>
                </div>
                <div class="modal-footer">
                    <a href="${pageContext.servletContext.contextPath}/page/welcome.jsp">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </a>
                    <button type="button" class="btn btn-primary" onclick="gao()">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        $("#btn-lg").click();
    });
    function gao() {
        window.location.href = "${pageContext.servletContext.contextPath}/adminlogout.do";
    }
</script>
</body>
</html>
