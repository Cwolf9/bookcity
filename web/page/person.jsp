<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人首页</title>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <style>
        .myright_bar {
            height: 500px;
            width: 1422px;
            position: absolute;
            left: 980px;
        }
        .commentcontainer{
            position: absolute;
            top: 100px;
            left: 170px;
        }
        .input-control {margin-top: 10px;margin-bottom: 5px;}
        .div_record .div_little_func #xiugaimima{margin-left: 120px;}
        .div_record .div_little_func #setMobile{margin-left: 120px;}
        .div_record .div_little_func #changeMobile{margin-left: 120px;}
        .div_record .div_little_func #perlog{margin-left: 120px;}
        .comment{width: 490px;}
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/person.css">
    <link href="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.min.css" rel="stylesheet">
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="page1"></div>
<script>
    $("#page1").load("${pageContext.servletContext.contextPath}/page/top.jsp");
</script>
<img src="" style="display: none" id = "smsimg">
<div class="myright_bar">
    <div class="col-xs-3 div_record ">
        <!-- 用户信息 -->
        <div class="jumbotron div_userinfo">
            <img class="iv_user_head img-circle" src="${pageContext.servletContext.contextPath}/${u.avatar}">
            <div style="display: inline-block; margin-left: 12px;font-size: 18px;">${u.adminacc}</div>
        </div>
        <!-- 随手记录 -->
        <div style="display: flex;">
            <div style="flex: 1"><hr></div>
            <div style="text-align: center;line-height: 48px;color: #34374C">记录美好的心情</div>
            <div style="flex: 1"><hr></div>
        </div>
        <input type="text" class="form-control" placeholder="标题:美好的一天..." id="biaoti">
        <br>
        <textarea class="form-control" rows="3" name=textarea placeholder="内容:今天捡到一分钱！！！^_^" id="neirong"></textarea>
        <br>
        <div class="div_save">
            <button type="button" class="btn btn-primary btn_save_record" onclick="savemess()">save</button>
        </div>
        <hr>
        <!-- 小功能列表 -->
        <div class="row div_little_func">
            <div>
                <button id="xiugaimima" type="button" class="btn btn-lg btn-warning " data-toggle="modal" data-target="#myModal">修改下密码</button>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${changepwdAns}</div>
            </div>
            <div>
                <button id="setMobile" type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal2" onclick="checkM()">绑定手机号</button>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${setMbAns}</div>
            </div>
            <div>
                <button id="changeMobile" type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal3">修改手机号</button>
                <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${changeMbAns}</div>
            </div>
            <div>
                <button id="perlog" type="button" class="btn btn-lg btn-success" data-remote="${pageContext.servletContext.contextPath}/perlog.do?adminid=${u.adminid}" data-toggle="modal" data-size="fullscreen">
                    查个人日志</button>
            </div>
        </div>
    </div>
</div>
<div class="commentcontainer">
    <div class="document">

    </div>
    <div class="comment">
    <a href="###" class="avatar">
        <img class="icon-2x" src = "${pageContext.servletContext.contextPath}/${u.avatar}">
    </a>
    <div class="content">
        <div class="pull-right text-muted">2019-06-17-00:00:00</div>
        <div><a href="###"><strong>哈姆雷特：</strong></a> <span class="text-muted">思考</span></div>
        <div class="text">生存还是毁灭？这是一个问题</div>
        <div class="actions">
            <a href="##">编辑</a>
            <a href="##">删除</a>
        </div>
    </div>
</div>
<script>
    <c:forEach items="${message}" var="ix" varStatus="stauts">
    var item = "<div class=\"comment\" id='mes${stauts.index}'>" +
            "    <a href=\"javascript:void(0);\" class=\"avatar\">" +
            "        <img class=\"icon-2x\" src = \"${pageContext.servletContext.contextPath}/${ix.ava}\">" +
            "    </a>" +
            "    <div class=\"content\">" +
            "        <div class=\"pull-right text-muted\">"+"${ix.time}"+"</div>" +
            "        <div><a href=\"###\"><strong>"+"${ix.username}"+"：</strong></a> <span class=\"text-muted\">"+"${ix.title}"+"</span></div>" +
            "        <div class=\"text\">"+"${ix.context}"+"</div>" +
            "        <div class=\"actions\">" +
            "            <a href=\"#\">编辑</a>" +
            "            <a href=\"#\" onclick=\"delmes('${ix.m_id}' ,'mes${stauts.index}')\">删除</a>" +
            "        </div>" +
            "    </div>" +
            "</div>";
    document.write(item);
    </c:forEach>
</script>

</div>
<script>
    function savemess() {
        if(document.getElementById("biaoti").value == "") {
            alert("请输入标题！")
        }else if(document.getElementById("neirong").value == "") {
            alert("请输入内容！")
        }else {
            var ava = "${u.avatar}"
            var date = new Date().format("yyyy-MM-dd-hh:mm:ss")
            var acc = "${u.adminacc}"
            var biaoti = document.getElementById("biaoti").value
            var neirong = document.getElementById("neirong").value
            location.href = "${pageContext.servletContext.contextPath}/savemes.action?acc="+acc+
                    "&date="+date+"&ava="+ava+"&biaoti="+biaoti+"&neirong="+neirong+"&bookid=0";
        }
    }
    function delmes(x, y) {
        y = "#" + y;
        $(y).css("display","none");
        $.post("${pageContext.servletContext.contextPath}/delmes.action?mid="+x);
    }
</script>
<!-- 修改密码 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                原密码:<div class="input-control has-icon-left has-icon-right">
                    <input id="inputEmailExample1" type="password" class="form-control" placeholder="原密码">
                    <label for="inputEmailExample1" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                    <label for="inputEmailExample1" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                </div>
                新密码:<div class="input-control has-icon-left has-icon-right">
                    <input id="inputEmailExample2" type="password" class="form-control" placeholder="新密码">
                    <label for="inputEmailExample2" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                    <label for="inputEmailExample2" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                </div>
                确认新密码:<div class="input-control has-icon-left has-icon-right">
                    <input id="inputEmailExample3" type="password" class="form-control" placeholder="确认新密码">
                    <label for="inputEmailExample3" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                    <label for="inputEmailExample3" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changepwd()">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 绑定手机号 -->
<div class="modal fade" id="myModal2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">绑定手机号</h4>
            </div>
            <div class="modal-body">
                手机号:<div class="input-control has-icon-left has-icon-right">
                <input id="inputExample1" type="text" class="form-control" placeholder="手机号">
                <label for="inputExample1" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                <label for="inputExample1" class="input-control-icon-right"><i class="icon icon-check"></i></label>
            </div>
                <div class="input-control has-icon-left has-icon-right">
                    <button type="button" class="btn btn-success" onclick="sendsms(1)">发送验证码</button>
            </div>
                验证码:<div class="input-control has-icon-left has-icon-right">
                <input id="inputExample3" type="text" class="form-control" placeholder="验证码">
                <label for="inputExample3" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                <label for="inputExample3" class="input-control-icon-right"><i class="icon icon-check"></i></label>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="setMobile()">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改手机号 -->
<div class="modal fade" id="myModal3">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">修改手机号</h4>
            </div>
            <div class="modal-body">
                原手机号:<div class="input-control has-icon-left has-icon-right">
                <input id="input3Example1" type="text" class="form-control" value="${u.phonenumber}" readonly>
                <label for="input3Example1" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                <label for="input3Example1" class="input-control-icon-right"><i class="icon icon-check"></i></label>
            </div>
                新手机号:<div class="input-control has-icon-left has-icon-right">
                <input id="input3Example2" type="text" class="form-control" placeholder="新手机号">
                <label for="input3Example2" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                <label for="input3Example2" class="input-control-icon-right"><i class="icon icon-check"></i></label>
            </div>
                <div class="input-control has-icon-left has-icon-right">
                    <button type="button" class="btn btn-success" onclick="sendsms(2)">发送验证码</button>
                </div>
                验证码:<div class="input-control has-icon-left has-icon-right">
                <input id="input3Example3" type="text" class="form-control" placeholder="验证码">
                <label for="input3Example3" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                <label for="input3Example3" class="input-control-icon-right"><i class="icon icon-check"></i></label>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changeMobile()">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- sometime later, probably inside your on load event callback -->
<%--<script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js"></script>--%>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
function changepwd() {
    var pwd0 = $("#inputEmailExample1").val()
    var pwd1 = $("#inputEmailExample2").val()
    var pwd2 = $("#inputEmailExample3").val()
    if(pwd1.length < 4 || pwd1.length > 16) {
        alert("密码长度不得少于4位，超过16位")
    }else {
        $("#inputEmailExample1").val(hex_md5(pwd0))
        $("#inputEmailExample2").val(hex_md5(pwd1))
        $("#inputEmailExample3").val(hex_md5(pwd2))
        if(pwd1 != pwd2) {
            alert("新密码与确认密码不相同！")
        }else {
            pwd0 = $("#inputEmailExample1").val()
            pwd1 = $("#inputEmailExample2").val()
            <%--document.getElementById("smsimg").setAttribute("src", "${pageContext.servletContext.contextPath}/changepwd.do?pwd0="+pwd0+"&pwd1="+pwd1)--%>
            location.href = "${pageContext.servletContext.contextPath}/changepwd.do?pwd0="+pwd0+"&pwd1="+pwd1
        }
    }
}
function sendsms(o) {
    var phone = "";
    if(o == 1) phone = document.getElementById("inputExample1").value;
    else phone = document.getElementById("input3Example2").value;
    if(phone == "") {
        alert("请输入手机号")
    }else if(phone.length != 11) {
        alert("手机格式不正确")
    }else {
        if("${u.phonenumber}" != "" && o == 1) {
            alert("您已绑定过手机号了！请勿重复绑定！")
        }else {
            <%--self.location = "${pageContext.servletContext.contextPath}/sendsmscode.do?phonenumber="+phone;--%>
            $.post("${pageContext.servletContext.contextPath}/sendsmscode.do?phonenumber="+phone)
        }
    }
}

function setMobile() {
    var Mobile = $("#inputExample1").val()
    var Msmscode = $("#inputExample3").val()
    if(Mobile.length != 11) {
        alert("手机号格式不正确")
    }else if(Msmscode == "") {
        alert("请输入验证码")
    }else if("${u.phonenumber}" != "") {
        alert("您已绑定过手机号了！请勿重复绑定！")
    }else{
        location.href = "${pageContext.servletContext.contextPath}/setMobile.do?Mobile="+Mobile+"&Msmscode="+Msmscode+"&adminid="+"${u.adminid}";
    }
}
function changeMobile() {
    var a = $("#input3Example1").val()
    if(a == "") {
        alert("请先绑定手机号！")
    }else {
        var b = $("#input3Example2").val()
        var c = $("#input3Example3").val()
        if(a == b) {
            alert("请不要输入相同的手机号！")
        }else location.href = "${pageContext.servletContext.contextPath}/changeMobile.do?adminid="+"${u.adminid}"+"&Mobile2="+b+"&smscode1="+c;
    }
}
function checkM() {
    if("${u.phonenumber}" != "") {
        document.getElementById("inputExample1").value = "${u.phonenumber}";
        document.getElementById("inputExample1").setAttribute("readonly", "true")
    }
}
</script>
<script>
    // 创建 Messger 实例
    var myMessager = new $.zui.Messager('欢迎管理员 &nbsp;&nbsp; ${u.adminacc} &nbsp;&nbsp; 登录！', {
        icon: 'heart',
        type: 'primary',
        time: 0 // 不进行自动隐藏
    });
    // 先显示消息
    if(document.referrer.match('view.jsp') ||document.referrer.match('smslogin.jsp')||document.referrer.match('adminlogout.do')) {
        myMessager.show();
        // 1 秒之后隐藏消息
        setTimeout(function() {
            myMessager.hide();
        }, 2000);
    }
</script>

</body>
</html>
