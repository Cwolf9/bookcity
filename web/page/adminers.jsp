<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/26
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
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
    <button type="button" class="btn btn-success" data-remote="${pageContext.servletContext.contextPath}/page/addadmin.jsp" data-toggle="modal"  style="margin-left: 5px; margin-bottom: 3px;">
        添加管理员</button>
    <table class="table datatable">
        <thead>
        <tr>
            <th>管理员编号</th>
            <th>管理员账号</th>
            <th>头像</th>
            <th>手机号码</th>
            <th>注册时间</th>
            <th>是否具有权限</th>
            <th>更多</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ix" varStatus="stauts">
            <tr>
                <td id="mytl${stauts.index}">${ix.adminid}</td>
                <td>${ix.adminacc }</td>
                <td><img src="${ix.avatar }" height="40px"/></td>
                <td>${ix.phonenumber }</td>
                <td>${ix.registerdate }</td>
                <td>${ix.permission }</td>
                <td>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.adminid})">删除</button>
                    <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#myModal" onclick="showAdminInfo('${ix.adminacc}')">修改</button>
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
                <h4 class="modal-title">修改个人信息</h4>
            </div>
            <div class="modal-body">
                管理员账号:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample1" type="text" class="form-control" placeholder="管理员账号" readonly="readonly">
                    <label for="inputEmailExample1" class="input-control-icon-left"><i
                            class="icon icon-qq "></i></label>
                    <label for="inputEmailExample1" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                管理员密码:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample2" type="password" class="form-control" placeholder="新密码">
                    <label for="inputEmailExample2" class="input-control-icon-left"><i
                            class="icon icon-key "></i></label>
                    <label for="inputEmailExample2" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                <div class="wrap-input100" style="margin-bottom: 50px;">
                    <span class="label-input100" style="margin-top: 15px;float: left;">管理员权限:</span>
                    <%--<input class="input100" type="text" name="username" placeholder="请输入姓名">--%>
                    <div class="input100" style="padding-top: 15px; float: left">
                        <div class="radio-primary" style="float:left; margin: 0 10px">
                            <input checked="checked" type="radio" name="sex" id="sex1" value="是">
                            <label for="sex1">是</label></div>
                        <div class="radio-primary" style="float:left;">
                            <input type="radio" name="sex" id="sex2" value="否">
                            <label for="sex2">否</label></div>
                    </div>
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changeAdminInfo()">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $('table.datatable').datatable({sortable: true, checkable: true});

    function del(adminid2) {
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
                    location.href = "${pageContext.servletContext.contextPath}/deladmin.do?adminid2=" + adminid2;
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
        for(var x in checksStatus) {x
            tmp += document.getElementById("mytl"+checksStatus[x]).innerHTML
            if(x != checksStatus.length-1) tmp += ','
        }
        console.log(tmp);
        <%--self.location = "${pageContext.servletContext.contextPath}/sendsmscode.do?phonenumber="+phone;--%>
        <%--$.post("${pageContext.servletContext.contextPath}/deletaall.do?bookid="+tmp+"&ip=1&userid="+${u.userid});--%>
        // TODO: change userid to adminid
        window.location.href = "${pageContext.servletContext.contextPath}/deleteall.do?bookid="+tmp+"&ip=4&adminid2="+${u.userid};
        if(${error}+"!" == "不能删除自己!") {
            alert("不能删除自己!");
        }
    }
    function showAdminInfo(o, id) {
        document.getElementById('inputEmailExample1').value = o;
    }
    function changeAdminInfo() {
        var pwd = $('#inputEmailExample2').val()
        $('#inputEmailExample2').val(hex_md5(pwd))
        var url = "${pageContext.servletContext.contextPath}/cgeAdmin.do?adminacc=" + $('#inputEmailExample1').val()+"&newPwd="+$('#inputEmailExample2').val()+"&newPermission=";
        if(document.getElementById("sex2").checked) url = url + "否";
        else url = url + "是";
        location.href = url;
    }
    function saveAdmin() {
        var success = true;
        var jgpattern =/^[A-Za-z0-9]+$/;
        var jgpattern2 =/^[A-Za-z0-9-*/@#$%+]+$/;
        var account = $("#account").val();
        var pwd = $("#pwd").val();
        var repwd = $("#repwd").val();
        var pn = $("#phonenumber").val();
        var accountTip = document.querySelector("#accountTip");
        var pwdTip = document.querySelector("#pwdTip");
        var repwdTip = document.querySelector("#repwdTip");
        var pnTip = document.querySelector("#pnTip");
        accountTip.innerText = ""
        pwdTip.innerText = ""
        repwdTip.innerText = ""
        pnTip.innerText = ""
        if (account.length < 6 || account.length > 16) {
            accountTip.innerText = "账号长度不少于6位，超过16位且只能含有字母数字";
            success = false;
        } else if(!jgpattern.test(account)){
            success = false
            accountTip.innerText = "包含非法字符！";
        }else if(pwd.length < 4 || pwd.length > 16) {
            pwdTip.innerText = "密码长度不少于4位，超过16位"
            success = false;
        }else if(repwd == "") {
            repwdTip.innerText = "密码不能为空"
            success = false;
        }else if(pwd!=repwd) {
            repwdTip.innerText = "两次密码不一致！";
            success = false;
        }else if(!jgpattern2.test(pwd)) {
            pwdTip.innerText = "包含非法字符！";
            success = false;
        }else if(!jgpattern2.test(repwd)) {
            repwdTip.innerText = "包含非法字符！";
            success = false;
        }else if(pn.length != 11) {
            pnTip.innerText = "手机号必须是11位！"
            success = false;
        }
        $("#pwd").val(hex_md5(pwd));
        $("#repwd").val(hex_md5(repwd));
        if (success) {
            document.querySelector("#saveAdminForm").submit()
        }
    }
</script>
</body>
</html>