<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查看所有用户</title>
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
    <button class="btn btn-danger" type="button" onclick="deleteall()" style="margin-left: 5px; margin-bottom: 3px;">删除所选</button>
    <table class="table datatable">
        <thead>
        <tr>
            <th>编号</th>
            <th>账号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>头像</th>
            <th>手机号码</th>
            <th>注册时间</th>
            <th>更多</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ix" varStatus="stauts">
            <tr>
                <td id="mytl${stauts.index}">${ix.userid}</td>
                <td>${ix.account }</td>
                <td>${ix.username }</td>
                <td>${ix.sex }</td>
                <td><img src="${ix.avatar }" height="40px"/></td>
                <td>${ix.phonenumber }</td>
                <td>${ix.registerdate }</td>
                <td>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.userid})">删除</button>
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

    function del(id) {
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
                    location.href = "${pageContext.servletContext.contextPath}/del.do?id=" + id;
                }
            }
        });
    }
    function deleteall() {
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
        window.location.href = "${pageContext.servletContext.contextPath}/deletaall.do?bookid="+tmp+"&ip=1&userid="+${u.userid};
        if(${error}+"!" == "不能删除自己!") {
            alert("不能删除自己!");
        }
    }

</script>
</body>
</html>