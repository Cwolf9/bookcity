<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/28
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>书籍编号</th>
        <th>书籍名称</th>
        <th>单价</th>
        <th>数量</th>
        <th>单项合计</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${oitems}" var="ix">
        <tr>
            <td style="padding-left: 10px">${ix.bookid}</td>
            <td>${ix.bookname }</td>
            <td>${ix.singleprice }</td>
            <td>${ix.booknum }</td>
            <td>${ix.allmoney}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
