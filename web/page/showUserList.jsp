<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/29
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>订单编号</th>
        <th>卖家编号</th>
        <th>总价钱</th>
        <th>书籍数目</th>
        <th>快递单号</th>
        <th>地址信息</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${morders}" var="ix">
        <tr>
            <td style="padding-left: 10px">${ix.orderid}</td>
            <td>${ix.sid }</td>
            <td>${ix.money }</td>
            <td>${ix.allnum}</td>
            <td>${ix.express }</td>
            <td>${ix.name }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>