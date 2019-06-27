<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<meta charset="utf-8">
<div class="mytop_bar">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- 导航头部 -->
            <div class="navbar-header">
                <!-- 移动设备上的导航切换按钮 -->
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target=".navbar-collapse-example">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- 品牌名称或logo -->
                <a class="navbar-brand" href="#">BookCity</a>
            </div>
            <!-- 导航项目 -->
            <div class="collapse navbar-collapse navbar-collapse-example">
                <!-- 一般导航项目 -->
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.servletContext.contextPath}/page/welcome.jsp"><i class="icon icon-th"></i>&nbsp;首页</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/person.do" target="_self"><i
                            class="icon icon-user"></i>个人资料</a></li>
                    <!-- 导航中的下拉菜单 -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon icon-qq"></i>用户管理 <b
                                class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.servletContext.contextPath}/findAll.do">查询用户</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/page/save.jsp">添加用户</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon icon-list-ul"></i>书籍管理 <b
                                class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.servletContext.contextPath}/findAllbook.do">查询书籍</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/page/savebook.jsp">添加书籍</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.servletContext.contextPath}/orders.do?orderid=0"><i class="icon icon-book"></i>订单管理</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/page/adminers.jsp"><i class="icon icon-user"></i>系统管理</a></li>
                </ul>
                <!-- 右侧的导航项目 -->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.servletContext.contextPath}/page/avatar.jsp" target="_self">更换头像</a></li>
                    <li class="active"><a href="#">欢迎【${u.username}】登陆</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/page/adminlogout.jsp" target="_self">退出 </a>
                    </li>
                </ul>
            </div><!-- END .navbar-collapse -->
        </div>
    </nav>
</div>