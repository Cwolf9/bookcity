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
        .icon:before{margin-top: 8px;}
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
                <td style="padding-left: 10px;">${ix.orderindex}</td>
                <td id="mytl${stauts.index}">${ix.orderid}</td>
                <td>${ix.uid }</td>
                <td>${ix.sid }</td>
                <td>${ix.money}</td>
                <td>${ix.name }</td>
                <td>${ix.express }</td>
                <td>
                    <button class="btn btn-info btn-sm" type="button" onclick="showMoreInfo('${ix.order.id}')">信息</button>
                    <button class="btn btn-success btn-sm" type="button" onclick="fahuo(${ix.orderid},'${ix.express }')">发货</button>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.orderid})">删除</button>
                    <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#myModal" onclick="showOrderInfo('${ix.orderid}','${ix.uid}','${ix.sid}')">修改</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- 对话框HTML -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">修改订单信息</h4>
            </div>
            <div class="modal-body">
                订单编号:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample1" type="text" class="form-control" placeholder="订单编号" readonly="readonly">
                    <label for="inputEmailExample1" class="input-control-icon-left"><i
                            class="icon icon-tasks "></i></label>
                    <label for="inputEmailExample1" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                买家:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample2" type="text" class="form-control" placeholder="买家" readonly="readonly">
                    <label for="inputEmailExample2" class="input-control-icon-left"><i
                            class="icon icon-user "></i></label>
                    <label for="inputEmailExample2" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                卖家:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample3" type="text" class="form-control" placeholder="卖家" readonly="readonly">
                    <label for="inputEmailExample3" class="input-control-icon-left"><i
                            class="icon icon-user "></i></label>
                    <label for="inputEmailExample3" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                地址信息:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample4" type="text" class="form-control" placeholder="地址信息">
                    <label for="inputEmailExample4" class="input-control-icon-left"><i
                            class="icon icon-chat-dot "></i></label>
                    <label for="inputEmailExample4" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changeOrderInfo()">保存</button>
            </div>
        </div>
    </div>
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
                    location.href = "${pageContext.servletContext.contextPath}/delorder.do?orderid=" + orderid;
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
    function showOrderInfo(o, id, hh) {
        document.getElementById('inputEmailExample1').value = o;
        document.getElementById('inputEmailExample2').value = id;
        document.getElementById('inputEmailExample3').value = hh;
    }
    function changeOrderInfo() {
        var url = "${pageContext.servletContext.contextPath}/cgeOrder.do?orderid=" + $('#inputEmailExample1').val()+"&newName="+$('#inputEmailExample4').val();
        location.href = url;
    }
    function fahuo(orderid, exp) {
        if(exp == "未发货") {
            var url = "${pageContext.servletContext.contextPath}/fahuo.do?orderid=" + orderid;
            location.href = url;
            alert("已成功发货！")
        }else {
            alert("该订单已发货，不能重复发货！")
        }
    }
    function showMoreInfo() {

    }
</script>
</body>
</html>
