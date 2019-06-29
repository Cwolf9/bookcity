<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <meta charset="utf-8">
    <title>查看所有书籍</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.css"/>
    <style>
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
            <th>上架日期</th>
            <th>单价</th>
            <th>剩余库存</th>
            <th>上传者</th>
            <th>更多</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ix" varStatus="stauts">
            <tr>
                <td id="mytl${stauts.index}">${ix.bookid}</td>
                <td>${ix.bookname }</td>
                <td>${ix.bookauthor }</td>
                <td><img src="${ix.defaultimg}" alt="缩略图" style="height: 40px;"></td>
                <td>${ix.pubdate }</td>
                <td>${ix.price }</td>
                <td>${ix.booknum }</td>
                <td>${ix.bowner }</td>
                <td>
                    <button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#myModal${ix.bookid}">简介</button>
                    <button class="btn btn-danger btn-sm" type="button" onclick="del(${ix.bookid})">删除</button>
                    <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#myModal" onclick="showBookInfo('${ix.bookid}','${ix.bowner}')">修改</button>
                </td>
            </tr>
            <div class="modal fade" id="myModal${ix.bookid}">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                            <h4 class="modal-title">书籍简介</h4>
                        </div>
                        <div class="modal-body">${ix.bookinfo }</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
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
                bookid:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample0" type="text" class="form-control" placeholder="bookid" readonly="readonly">
                    <label for="inputEmailExample1" class="input-control-icon-left"><i
                            class="icon icon-android "></i></label>
                    <label for="inputEmailExample1" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                上传者:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample1" type="text" class="form-control" placeholder="上传者" readonly="readonly">
                    <label for="inputEmailExample1" class="input-control-icon-left"><i
                            class="icon icon-qq "></i></label>
                    <label for="inputEmailExample1" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                书名:
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample2" type="text" class="form-control" placeholder="书名">
                    <label for="inputEmailExample2" class="input-control-icon-left"><i
                            class="icon icon-user "></i></label>
                    <label for="inputEmailExample2" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                简介：
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample3" type="text" class="form-control" placeholder="简介">
                    <label for="inputEmailExample3" class="input-control-icon-left"><i
                            class="icon icon-edit "></i></label>
                    <label for="inputEmailExample3" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
                价格：
                <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                    <input id="inputEmailExample4" type="text" class="form-control" placeholder="价格">
                    <label for="inputEmailExample4" class="input-control-icon-left"><i
                            class="icon icon-sun "></i></label>
                    <label for="inputEmailExample4" class="input-control-icon-right"><i
                            class="icon icon-check"></i></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="changeBookInfo()">保存</button>
            </div>
        </div>
    </div>
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
            }
        });

    }
    function showBookInfo(o, id) {
        document.getElementById('inputEmailExample0').value = o;
        document.getElementById('inputEmailExample1').value = id;
    }
    function changeBookInfo() {
        var url = "${pageContext.servletContext.contextPath}/cgeBook.do?bookid=" + $('#inputEmailExample0').val()+"&newBkNm="+$('#inputEmailExample2').val()+"&newBkIf="+$('#inputEmailExample3').val()+"&newPrice="+$('#inputEmailExample4').val();
        location.href = url;
    }
</script>
</body>
</html>