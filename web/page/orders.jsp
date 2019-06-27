<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/26
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单管理</title>
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
            <th>订单序号</th>
            <th>订单编号</th>
            <th>买家</th>
            <th>卖家</th>
            <th>总金额</th>
            <th>送货地址</th>
            <th>是否发货</th>
            <th>更多</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ix" varStatus="stauts">
            <tr>
                <td id="mytl${stauts.index}" style="padding-left: 10px;">${ix.orderindex}</td>
                <td>${ix.orderid}</td>
                <td>${ix.uid }</td>
                <td>${ix.sid }</td>
                <td>${ix.money}</td>
                <td>${ix.name }</td>
                <td>${ix.express }</td>
                <td>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.orderid})">删除</button>
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
    function del(orderid) {
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
                    location.href = "${pageContext.servletContext.contextPath}/delorder.do?orderid=" + orderid.toString();
                }
            }
        });
    }

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
        window.location.href = "${pageContext.servletContext.contextPath}/deleteall.do?bookid="+tmp+"&ip=3";
    }
</script>
</body>
</html>
