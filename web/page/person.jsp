<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <style>
        .mytop_bar {
            height: 40px;
            width: 100%;
        }
        .myright_bar {
            height: 450px;
            width: 1422px;
            margin-left: 530px;
        }
        .input-control {margin-top: 10px;margin-bottom: 5px;}
        .div_record .div_little_func #xiugaimima{margin-left: 120px;}
        .comment{width: 950px;margin-left: 220px;}
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
<div class="myright_bar">
    <div class="col-xs-3 div_record ">
        <!-- 用户信息 -->
        <div class="jumbotron div_userinfo">
            <img class="iv_user_head img-circle" src="${pageContext.servletContext.contextPath}/${u.avatar}">
            <div style="display: inline-block; margin-left: 12px;font-size: 18px;">${u.username}</div>
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
            <button id="xiugaimima" type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">修改密码</button>
            <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${changepwdAns}</div>
        </div>
    </div>
</div>
<br> <br>
<div class="comment">
    <a href="###" class="avatar">
        <i class="icon-user icon-2x"></i>
    </a>
    <div class="content">
        <div class="pull-right text-muted">2019-06-17</div>
        <div><a href="###"><strong>哈姆雷特：</strong></a> <span class="text-muted">思考</span></div>
        <div class="text">生存还是毁灭？这时一个问题</div>
        <div class="actions">
            <a href="##">编辑</a>
            <a href="##">删除</a>
        </div>
    </div>
</div>
<div class="comment">
    <a href="###" class="avatar">
        <i class="icon-user icon-2x"></i>
    </a>
    <div class="content">
        <div class="pull-right text-muted">2019-06-17</div>
        <div><a href="###"><strong>哈姆雷特：</strong></a> <span class="text-muted">思考</span></div>
        <div class="text">生存还是毁灭？这时一个问题</div>
        <div class="actions">
            <a href="##">编辑</a>
            <a href="##">删除</a>
        </div>
    </div>
</div>
<div class="document">

</div>
<script>
    function savemess() {
        var popContent =
            '<div class="comment">' +
            '<a href="###" class="avatar">' +
            '<i class="icon-user icon-2x"></i>\n' +
            '    </a>\n' +
            '    <div class="content">\n' +
            '        <div class="pull-right text-muted">'+
            new Date()+
            '</div>\n' +
            '        <div><a href="###"><strong>${u.username}:&nbsp;</strong></a> <span class="text-muted">'+
            document.getElementById("biaoti").value+
            '</span></div>\n' +
            '        <div class="text">'+
            document.getElementById("neirong").value+
            '</div>\n' +
            '        <div class="actions">\n' +
            '            <a href="##">编辑</a>\n' +
            '            <a href="##">删除</a>\n' +
            '        </div>\n' +
            '    </div>\n' +
            '</div>';
        $('.document').append(popContent);
    }
</script>
<!-- 对话框HTML -->
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

<!-- sometime later, probably inside your on load event callback -->
<script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
function changepwd() {
    var pwd0 = $("#inputEmailExample1").val()
    var pwd1 = $("#inputEmailExample2").val()
    var pwd2 = $("#inputEmailExample3").val()
    if(pwd1 != pwd2) {
        alert("新密码与确认密码不相同！")
    }else {
        location.href = "${pageContext.servletContext.contextPath}/changepwd.do?pwd0="+pwd0+"&pwd1="+pwd1
    }
}
</script>
</body>
</html>
