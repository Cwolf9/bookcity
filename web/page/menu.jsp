<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/24
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <meta charset="utf-8">
    <title>暂时没用</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/search.css" rel="stylesheet">
    <style>
        .table{
            margin: 0 auto;
            width: 1000px;
        }
        .table tbody tr {
            height: 80px;
        }
    </style>
</head>
<body>

<div id="container">
    <div class="search bar2">
        <form action="${pageContext.servletContext.contextPath}/searchBook.action" method="post">
            <input type="text" placeholder="请输入您要搜索书籍的关键字..." id="searchbar" name="searchbar">
            <button type="submit"></button>
        </form>
    </div>
</div>
<div class="slidepage">
    <ul class="pager" data-ride="pager" id="myPager"></ul>
</div>


<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>缩略图</th>
        <th>书籍编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>单价</th>
        <th>卖家</th>
        <th>更多</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${booklist}" var="ix">
        <tr>
            <td style="padding-left: 10px;"><img src="${pageContext.servletContext.contextPath}/${ix.defaultimg}" alt="书" style="height: 80px;"></td>
            <td>${ix.bookid}</td>
            <td>${ix.bookname }</td>
            <td>${ix.bookauthor}</td>
            <td>${ix.price}</td>
            <td>${ix.bowner}</td>
            <td>
                <button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#myModal${ix.bookid}">查看简介</button>
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

<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    // 手动进行初始化
    $('#myPager').pager({
        page: parseInt("${nowpage}"),
        recPerPage: 3,
        recTotal: parseInt("${queryBooksSum}"),
        onPageChange: function(state, oldState) {
            if (state.page !== oldState.page) {
                console.log('页码从', oldState.page, '变更为', state.page);
                <%--$.post("${pageContext.servletContext.contextPath}/changepaper.action?nowpage="+state.page+"&searchbar=${searchbar}")--%>
                location.href = "${pageContext.servletContext.contextPath}/changepaper.action?nowpage="+state.page+"&searchbar=${searchbar}"
            }
        }
    });
</script>
</body>
</html>