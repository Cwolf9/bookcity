<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.css"/>
</head>
<body>
	<div style="height: 100px;">
	
	</div>
	<table class="table datatable">
	  <thead>
	    <tr>
	      <th>编号</th>
	      <th>账号</th>
	      <th>姓名</th>
	      <th>性别</th>
	      <th>头像</th> 
	      <th>手机号码</th>
	      <th>注册时间</th>
	      <th>更多</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${list}" var="u">
	    	<tr>
		      <td>${u.id}</td>
		      <td>${u.account }</td>
		      <td>${u.username }</td>
		      <td>${u.sex }</td>
		      <td><img src="${u.avatar }" height="40px" /></td>
		      <td>${u.phonenumber }</td>
		      <td>${u.registerdate }</td>
		      <td>
		      	<button class="btn btn-danger btn-sm" type="button" onclick="del(${u.id})">删除</button>
		      	<button class="btn btn-primary btn-sm" type="button">修改</button>
		      </td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>
<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/datatable/zui.datatable.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/bootbox/bootbox.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$('table.datatable').datatable({sortable: true,checkable: true});

function del(id){
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
	        if(result){//确定删除数据
	        	location.href = "${pageContext.servletContext.contextPath}/del.do?id="+id;
	        }
	    }
	});
}
</script>
</body>
</html>