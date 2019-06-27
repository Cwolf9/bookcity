<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查看所有书籍</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.css"/>
    <style>
        .mytop_bar {
            height: 40px;
            width: 100%;
        }

        .myright_bar {
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
    <div style="height: 100px;"></div>
    <button class="btn btn-danger" type="button" onclick="deleteallbook()" style="margin-left: 5px; margin-bottom: 3px;">删除所选</button>
    <table class="table datatable">
        <thead>
        <tr>
            <th>编号</th>
            <th>署名</th>
            <th>作者</th>
            <th>缩略图</th>
            <th>简介</th>
            <th>上架日期</th>
            <th>单价</th>
            <th>剩余库存</th>
            <th>上传者</th>
            <th>更多</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ix">
            <tr>
                <td>${ix.bookid}</td>
                <td>${ix.bookname }</td>
                <td>${ix.bookauthor }</td>
                <td><img src="${ix.defaultimg}" alt="缩略图" style="height: 40px;"></td>
                <td>${ix.bookinfo }</td>
                <td>${ix.pubdate }</td>
                <td>${ix.price }</td>
                <td>${ix.booknum }</td>
                <td>${ix.bowner }</td>
                <td>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.bookid})">删除</button>
                    <button class="btn btn-primary btn-sm" type="button">修改</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $('table.datatable').datatable({sortable: true, checkable: true});
    function del(bookid) {
        bootbox.confirm({
            message: "确定要删除数据?",
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
                if (result) {//确定删除数据
                    location.href = "${pageContext.servletContext.contextPath}/delbook.do?bookid=" + bookid;
                }
            }
        });
    }
    //***
    function deleteallbook() {
        // 获取数据表格实例对象
        var myDatatable = $('table.datatable').data('zui.datatable');
        // 获取行选中数据
        var checksStatus = myDatatable.checks.checks;
        var tmp = "";
        for(var x in checksStatus) {
            tmp += document.getElementById("mytl"+checksStatus[x]).innerHTML
            if(x != checksStatus.length-1) tmp += ','
        }
        console.log(tmp);
        <%--self.location = "${pageContext.servletContext.contextPath}/sendsmscode.do?phonenumber="+phone;--%>
        <%--$.post("${pageContext.servletContext.contextPath}/deletaall.do?bookid="+tmp+"&ip=1&userid="+${u.userid});--%>
        window.location.href = "${pageContext.servletContext.contextPath}/deleteall.do?bookid="+tmp+"&ip=2";
    }
</script>
</body>
</html>