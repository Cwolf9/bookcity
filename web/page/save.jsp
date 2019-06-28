<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加用户</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
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
    <div style="height:50px;"></div>
    <form id="saveForm" class="form-horizontal" action="${pageContext.servletContext.contextPath}/save.do"
          method="post">
        <div class="form-group">
            <label for="account" class="col-sm-2">账号</label>
            <div class="col-md-6 col-sm-10">
                <input type="text" class="form-control" id="account" name="account" placeholder="账号">
                <span id="accountTip" style="color:red;font-size: 12px"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-2">密码</label>
            <div class="col-md-6 col-sm-10">
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="密码(只能包含字母，数字和{+-*/@#$%})">
                <span id="pwdTip" style="color:red;font-size: 12px"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="repwd" class="col-sm-2">重复密码</label>
            <div class="col-md-6 col-sm-10">
                <input type="password" class="form-control" name="repwd" id="repwd" placeholder="重复密码">
                <span id="repwdTip" style="color:red;font-size: 12px"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-2">姓名</label>
            <div class="col-md-6 col-sm-10">
                <input type="text" class="form-control" name="username" id="username" placeholder="姓名">
                <span id="unTip" style="color:red;font-size: 12px"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="phonenumber" class="col-sm-2">手机号码</label>
            <div class="col-md-6 col-sm-10">
                <input type="text" class="form-control" name="phonenumber" id="phonenumber" placeholder="手机号码">
                <span id="pnTip" style="color:red;font-size: 12px"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="sex1" class="col-sm-2">性别</label>
            <div class="col-md-6 col-sm-10">
                <div class="radio-primary" style="float:left;">
                    <input checked="checked" type="radio" name="sex" id="sex1" value="男">
                    <label for="sex1">男</label></div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="radio-primary" style="float:left;">
                    <input type="radio" name="sex" id="sex2" value="女">
                    <label for="sex2">女</label></div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" onclick="save()">添加</button>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    //前端校验【数据是否填写，填写后数据是否符合格式】DOM
    function save() {
        //js获取html标签对象
        //document.querySelectorAll(".account");
        var success = true;
        var jgpattern =/^[A-Za-z0-9]+$/;
        var jgpattern2 =/^[A-Za-z0-9-*/@#$%+]+$/;
        var account = $("#account").val();
        var pwd = $("#pwd").val();
        var repwd = $("#repwd").val();
        var un = $("#username").val();
        var pn = $("#phonenumber").val();
        var accountTip = document.querySelector("#accountTip");
        var pwdTip = document.querySelector("#pwdTip");
        var repwdTip = document.querySelector("#repwdTip");
        var unTip = document.querySelector("#unTip");
        var pnTip = document.querySelector("#pnTip");
        accountTip.innerText = ""
        pwdTip.innerText = ""
        repwdTip.innerText = ""
        unTip.innerText = ""
        pnTip.innerText = ""
        if (account == "") {
            accountTip.innerText = "账号不能为空";
            success = false;
        } else if(!jgpattern.test(account)){
            success = false
            accountTip.innerText = "包含非法字符！";
        }else if(pwd == "") {
            pwdTip.innerText = "密码不能为空"
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
        }else if(un == "") {
            unTip.innerText = "姓名不能为空"
            success = false;
        }
        if (success) {
            document.querySelector("#saveForm").submit();
        }
    }
</script>
</body>
</html>