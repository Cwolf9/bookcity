<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/29
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #saveAdminForm{margin-left: 10px;}
    #saveForm .form-group .col-md-6 input{ width: 350px;}
</style>
<form id="saveAdminForm" class="form-horizontal" action="${pageContext.servletContext.contextPath}/saveAdmin.do"
      method="post">
    <div class="form-group">
        <label for="account" class="col-sm-2">管理员账号</label>
        <div class="col-md-6 col-sm-10">
            <input type="text" class="form-control" id="account" name="account" placeholder="账号(不少于6位，超过16位)且只能含有字母数字">
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
        <label for="phonenumber" class="col-sm-2">手机号码</label>
        <div class="col-md-6 col-sm-10">
            <input type="text" class="form-control" name="phonenumber" id="phonenumber" placeholder="手机号码">
            <span id="pnTip" style="color:red;font-size: 12px"></span>
        </div>
    </div>
    <div class="form-group">
        <label for="sex1" class="col-sm-2">是否有权限</label>
        <div class="col-md-6 col-sm-10">
            <div class="radio-primary" style="float:left;">
                <input checked="checked" type="radio" name="sex" id="sex1" value="是">
                <label for="sex1">男</label></div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="radio-primary" style="float:left;">
                <input type="radio" name="sex" id="sex2" value="否">
                <label for="sex2">女</label></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-primary" onclick="saveAdmin()">添加</button>
        </div>
    </div>
</form>
