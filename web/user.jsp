<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- =====  BASIC PAGE NEEDS  ===== -->
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <meta charset="utf-8">
    <title>UserInfo</title>
    <!-- =====  SEO MATE  ===== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="distribution" content="global">
    <meta name="revisit-after" content="2 Days">
    <meta name="robots" content="ALL">
    <meta name="rating" content="8 YEARS">
    <meta name="Language" content="en-us">
    <meta name="GOOGLEBOT" content="NOARCHIVE">
    <!-- =====  MOBILE SPECIFICATION  ===== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="viewport" content="width=device-width">
    <!-- =====  CSS  ===== -->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/style0.css">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <style>
        /* CSS Document */
        .place{height:40px; background:url(${pageContext.servletContext.contextPath}/images/righttop.gif) repeat-x;}
        /*个人信息*/
        .information{ position: relative !important;}
        .information-right{
            float:right;
            background-color: black;
            margin-top: 60px;
            margin-right: 100px;
            height:200px;
            width:200px;
        }
        .information li{
            font-size: 20px;
            height:40px;
            width:400px;
            color: black;
            margin:60px;
        }
        .information li:hover{
            background-color: #e2c8ac;
        }
        .information input{
            height: 50px;
            width: 100px;
            margin-left: 725px;
            margin-bottom: 20px;
            font-size: 15px;
        }
        .information{
            border:1px solid #7a4f1b ;
        }
        /*购物车*/
        .cart{ position: relative !important;}
        .seachform{ height:42px; }
        .seachform li{float:left; margin-right:15px;}
        .seachform li label{padding-right:10px; float:left; line-height:32px;}
        .scinput{width:180px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; text-indent:10px; color:#999;}
        .scbtn{width:85px;height:35px; background:url(${pageContext.servletContext.contextPath}/images/btnbg.png) no-repeat center; font-size:14px;font-weight:bold;color:#fff; cursor:pointer;border-radius:3px; }
        select{background:url(${pageContext.servletContext.contextPath}/images/inputbg.gif) repeat-x;_background:none;_border:none;height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;padding:5px;}
        .tablelist{border:solid 1px #cbcbcb; width:100%; clear:both;}
        .tablelist th{background:url(${pageContext.servletContext.contextPath}/images/th.gif) repeat-x; height:34px; line-height:34px; border-bottom:solid 1px #b6cad2; text-indent:11px; text-align:left;}
        .tablelist td{line-height:35px; text-indent:11px; border-right: dotted 1px #c7c7c7;}
        .tablelink{color:#056dae;}
        .tablelist tbody tr.odd{background:#f5f8fa;}
        .tablelist tbody tr:hover{background:#e5ebee;}
        .bottomsubmit{
            float: right;
        }
        .bottomsubmit li{
            margin:20px;
            float:right;

        }
        .bottomsubmit li span{
            font-weight: bold;
            font-size: 20px;
        }
        #allprice, #allnum {
            color: red;
        }
        /*我的订单*/
        .indent{
            position: relative !important;
        }
        .indent table{
            margin:20px;
        }
        .indent table tr{
            margin: 10px;
        }
        .bottomsubmitnone li{
            margin:20px;
            float:right;
        }
        .imgtd img{width:100px;}
        a{
            text-decoration:none;
        }
    </style>
    <style>
        .headicon {
            float: right;
            margin: 10px;
            margin-right: 20px;
            width: 330px;
            height: 90px;
        }
        .information-right {
            background:url(${pageContext.servletContext.contextPath}/${ptu.avatar}) no-repeat center;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<!-- =====  LODER  ===== -->
<%--<div class="loder"></div>--%>
<div class="wrapper">
    <!-- =====  HEADER START  ===== -->
    <header id="header">
        <!-- 顶部开始 -->
        <!-- 导航栏变化样式 -->
        <div class="headchange">
            <div class="headbrand">BOOKSHOP</div>
            <div class="headlocate">
                <ul>
                    <li><a href="${pageContext.servletContext.contextPath}/index.action">HOME</a></li>
                    <li><a href="#classify">Classify</a></li>
                    <li><a href="#newarrival">New Arrival</a></li>
                    <li><a href="#myfavorite">Myfavorite</a></li>
                    <li><a href="#recommend">Recommend</a></li>
                    <li><a href="#blog">Blog</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/userlogout.action">Exit</a></li>
                </ul>
            </div>
            <div class="headicon">
                <!-- 搜索框的实现 -->
                <ul>
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a>
                    </li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton"
                            style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black"
                                                    aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton"
                            style="display: none;"></button>
                    <li><a href="${pageContext.servletContext.contextPath}/user.action"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                </ul>
                <div class="search">
                    <div class="search-overlay">
                        <!-- 关闭键 -->
                        <a href="javascript:void(0)" class="search-overlay-close"></a>
                        <div class="container">
                            <!-- 整页面搜索 -->
                            <form role="search" id="searchform2" action="${pageContext.servletContext.contextPath}/SearchBook.action" method="post">
                                <label class="h5 normal search-input-label">Enter keywords To Search Entire Store</label>
                                <input id="searchbar" name="mtype" placeholder="请输入您要搜索书籍的关键字..." type="search">
                                <button type="submit"></button>
                            </form>
                            <img src="${pageContext.servletContext.contextPath}/imgs/img1.png" alt="" >
                            <!-- 大页面 -->
                        </div>
                    </div>
                    <!-- 首面搜索实现通过id实现 -->
                    <div id="search-overlay-btn1"><i class="fa fa-search fa-2x hoverspin" aria-hidden="true"></i></div>
                </div>
                <!-- 搜索框实现结束 -->
            </div>
        </div>
        <!-- 导航栏变化样式 -->
        <!-- 导航栏固定样式 -->
        <div id="home" class="headorigin">
            <div class="headbrand">BOOKSHOP</div>
            <div class="headlocate">
                <ul>
                    <li><a href="${pageContext.servletContext.contextPath}/index.action">HOME</a></li>
                    <li><a href="#classify">Classify</a></li>
                    <li><a href="#focus">Focus</a></li>
                    <li><a href="#newarrival">New Arrival</a></li>
                    <li><a href="#recommend">Recommend</a></li>
                    <li><a href="#blog">Blog</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/userlogout.action">Exit</a></li>
                </ul>
            </div>
            <div class="headicon">
                <!-- 搜索框的实现 -->
                <ul>
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a>
                    </li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton"
                            style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black"
                                                    aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton"
                            style="display: none;"></button>
                    <li><a href="${pageContext.servletContext.contextPath}/cart.action"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                </ul>
                <div class="search">
                    <div class="search-overlay">
                        <!-- 关闭键 -->
                        <a href="javascript:void(0)" class="search-overlay-close"></a>
                        <div class="container">
                            <!-- 整页面搜索 -->
                            <form role="search" id="searchform" action="${pageContext.servletContext.contextPath}/SearchBook.action" method="post">
                                <label class="h5 normal search-input-label">Enter keywords To Search Entire Store</label>
                                <input id="searchbar" name="mtype" placeholder="请输入您要搜索书籍的关键字..." type="search">
                                <button type="submit"></button>
                            </form>
                            <!-- 大页面 -->
                        </div>
                    </div>
                    <!-- 首面搜索实现通过id实现 -->
                    <div id="search-overlay-btn"><i class="fa fa-search fa-2x hoverspin" aria-hidden="true"></i></div>
                </div>
                <!-- 搜索框实现结束 -->
            </div>
        </div>
        <!-- 导航栏固定样式 -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                                class="sr-only">关闭</span></button>
                        <h4 class="modal-title">登录</h4>
                    </div>
                    <div class="modal-body">
                        账号:
                        <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                            <input id="inputEmailExample1" type="text" class="form-control" placeholder="账号">
                            <label for="inputEmailExample1" class="input-control-icon-left"><i
                                    class="icon icon-qq "></i></label>
                            <label for="inputEmailExample1" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        密码:
                        <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                            <input id="inputEmailExample2" type="password" class="form-control" placeholder="密码">
                            <label for="inputEmailExample2" class="input-control-icon-left"><i
                                    class="icon icon-key "></i></label>
                            <label for="inputEmailExample2" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="请输入验证码">
                            <span class="label-input100" style="margin-top: 5px;">验证码:</span>&nbsp;&nbsp;&nbsp;
                            <img style="margin-top: 5px;margin-left: 5px;"
                                 src="${pageContext.servletContext.contextPath}/code.do" alt="code"
                                 onclick="changeCode(this)">
                            <br>
                            <input class="input100" type="text" name="code" placeholder="请输入验证码" id="code"
                                   style="margin-top: 10px;">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="Login()">登录</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                                class="sr-only">关闭</span></button>
                        <h4 class="modal-title">注册</h4>
                    </div>
                    <div class="modal-body">
                        账号:
                        <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                            <input id="inputExample1" type="text" class="form-control" placeholder="账号">
                            <label for="inputExample1" class="input-control-icon-left"><i
                                    class="icon icon-qq "></i></label>
                            <label for="inputExample1" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        密码:
                        <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                            <input id="inputExample2" type="password" class="form-control" placeholder="密码">
                            <label for="inputExample2" class="input-control-icon-left"><i
                                    class="icon icon-key "></i></label>
                            <label for="inputExample2" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        姓名:
                        <div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                            <input id="inputExample3" type="text" class="form-control" placeholder="姓名">
                            <label for="inputExample3" class="input-control-icon-left"><i
                                    class="icon icon-user "></i></label>
                            <label for="inputExample3" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        <div class="wrap-input100" style="margin-bottom: 50px;">
                            <span class="label-input100" style="margin-top: 15px;float: left;">性别:</span>
                            <%--<input class="input100" type="text" name="username" placeholder="请输入姓名">--%>
                            <div class="input100" style="padding-top: 15px; float: left">
                                <div class="radio-primary" style="float:left; margin: 0 10px">
                                    <input checked="checked" type="radio" name="sex" id="sex1" value="男">
                                    <label for="sex1">男</label></div>
                                <div class="radio-primary" style="float:left;">
                                    <input type="radio" name="sex" id="sex2" value="女">
                                    <label for="sex2">女</label></div>
                            </div>
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="Register()">注册</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal3">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                        <h4 class="modal-title">修改密码</h4>
                    </div>
                    <div class="modal-body">
                        原密码:<div class="input-control has-icon-left has-icon-right" style="margin-bottom: 20px;">
                        <input id="yuanpwd" type="password" class="form-control" placeholder="原密码">
                        <label for="yuanpwd" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                        <label for="yuanpwd" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                    </div>
                        新密码:<div class="input-control has-icon-left has-icon-right" style="margin-bottom: 20px;">
                        <input id="newpwd" type="password" class="form-control" placeholder="新密码">
                        <label for="newpwd" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                        <label for="newpwd" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                    </div>
                        确认新密码:<div class="input-control has-icon-left has-icon-right" style="margin-bottom: 10px;">
                        <input id="repwd" type="password" class="form-control" placeholder="确认新密码">
                        <label for="repwd" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                        <label for="repwd" class="input-control-icon-right"><i class="icon icon-check"></i></label>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="changepwd()">保存</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal4">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                        <h4 class="modal-title">添加地址</h4>
                    </div>
                    <div class="modal-body">
                        地址:
                        <div class="input-control has-icon-left has-icon-right">
                            <input id="dizhi" type="text" class="form-control" placeholder="地址">
                            <label for="dizhi" class="input-control-icon-left"><i class="icon icon-key "></i></label>
                            <label for="dizhi" class="input-control-icon-right"><i
                                    class="icon icon-check"></i></label>
                        </div>
                        <div class="wrap-input100" style="margin-bottom: 50px;">
                            <span class="label-input100" style="margin-top: 15px;float: left;">是否默认地址:</span>
                            <%--<input class="input100" type="text" name="username" placeholder="请输入姓名">--%>
                            <div class="input100" style="padding-top: 15px; float: left">
                                <div class="radio-primary" style="float:left; margin: 0 10px">
                                    <input checked="checked" type="radio" name="sex" id="dizhi1" value="是">
                                    <label for="sex1">是</label></div>
                                <div class="radio-primary" style="float:left;">
                                    <input type="radio" name="sex" id="dizhi2" value="否">
                                    <label for="sex2">否</label></div>
                            </div>
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="changedizhi()">保存</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 顶部结束 -->
        <!-- 目录和推荐栏 -->
        <div class="header-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-md-4 col-lg-3">
                        <div id="classify" class="category">
                            <div class="menu-bar" data-target="#category-menu,#category-menu-responsive"
                                 data-toggle="collapse" aria-expanded="true" role="button">
                                <h4 class="category_text">Top category</h4>
                                <span class="i-bar"><i class="fa fa-bars"></i></span></div>
                        </div>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-9">
                        <div class="header-bottom-right offers">
                            <div class="marquee"><span><i class="fa fa-circle" aria-hidden="true"></i>汉语言文学</span>
                                <span><i class="fa fa-circle"
                                         aria-hidden="true"></i>多重宇宙</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>冒名顶替综合征</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>华为昆仑量子计算机</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>切尔诺贝利</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>时间知觉</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 目录和推荐栏 -->
    </header>
    <!-- =====  HEADER END  ===== -->
    <!-- =====  CONTAINER START  ===== -->
    <div class="container">
        <div class="row ">
            <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 ">
                <div id="category-menu" class="navbar collapse in  mb_40" aria-expanded="true" style="" role="button">
                    <div class="nav-responsive">
                        <div class="section" id="projects">
                            <ul class="nav  main-navigation collapse in portfolio_filter" style="height:600px">
                                <li style="font-size:15px; height:66px"><a href="#" data-filter=".information">个人信息</a></li>
                                <li style="font-size:15px; height:66px"><a href="#" data-filter=".cart">购物车</a></li>
                                <li style="font-size:15px; height:66px"><a href="#" data-filter=".indent">我的订单</a></li>
                                <%--<li style="font-size:15px; height:66px"><a href="#" data-filter=".blog">个人博客</a></li>--%>
                                <li style="font-size:15px; height:66px"><a href="#" data-filter=".addbook">上传书籍</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                .information-left ul li {
                    margin-top: 10px;
                    margin-bottom: 10px;
                }
            </style>
            <%--<img src="${pageContext.servletContext.contextPath}/${ptu.avatar}" alt="头像">--%>
            <div class="col-sm-8 col-md-8 col-lg-9 mtb_30 portfolio_container">
                <!-- 个人信息  -->
                <div class="information">
                    <div class="information-right"></div>
                    <div class="information-left">
                        <ul>
                            <li>账号：${ptu.account}</li>
                            <li>昵称：${ptu.username}</li>
                            <li>性别：${ptu.sex}</li>
                            <li>电话号码：${ptu.phonenumber}</li>
                            <li>注册日期：${ptu.registerdate}</li>
                            <li>默认地址：${mrdz}</li>
                        </ul>
                        <button id="cgsAva" type="button" class="btn btn-info btn-lg" data-remote="${pageContext.servletContext.contextPath}/changeAva.jsp?" data-toggle="modal" style="float: right;margin-bottom: 14px;margin-right: 23px;margin-top: 30px;">
                            更换头像</button>
                        <button id="xiugai" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3" style="float: right;margin-bottom: 14px;margin-right: 23px;margin-top: 30px;">
                            修改密码</button>

                        <button id="adddizhi" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal4" style="float: right;margin-bottom: 14px;margin-right: 23px;margin-top: 30px;">
                            添加地址</button>
                        <div class="icon" style="height:100px;">
                            <div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${changepwdAns}</div>
                            <%--<input id="xiugai" type="submit" class="btn btn-lg btn-warning " data-toggle="modal" data-target="#myModal3" value="修改密码">--%>
                            <%--<div class="text-center  label-input100" style="color: red;margin-bottom: 2px;">${changepwdAns}</div>--%>
                            <%--<input id="adddizhi" type="submit" class="btn btn-lg btn-warning " data-toggle="modal" data-target="#myModal4" value="添加地址">--%>
                        </div>
                    </div>
                </div>
                <!-- 个人信息food -->
                <div class="cart">
                    <table class="tablelist">
                        <tr>
                            <th><input name="checkAll" type="checkbox" id="checkAll" onchange="selectAll()"/>全选/
                                <input name="checkOther" type="checkbox" id="checkOther" onchange="selectOther()"/>反选
                            </th>
                            <th>缩略图</th>
                            <th>商品名称</th>
                            <th>商品类别</th>
                            <th>数量(件）</th>
                            <th>单价（元）</th>
                            <th>操作</th>
                        </tr>
                        <script>
                            <c:forEach items="${usc}" var="ix" varStatus="stauts">
                            var item = "<tr class='odd'><td><input name='checkItem' id='type${status.index}' type='checkbox' value='${ix.bookid}' onchange=\"jisuan()\"/></td>" +
                                "<td class='imgtd'><img src='${ix.imgs}'/></td><td>" + "${ix.bookname}" + "</td>" +
                                "<td>" + "${ix.tags}" + "</td><td>" + "<span id='try${ix.bookid}' name='checkBnum'>${ix.booknum}</span>" + "<i class=\"fa fa-minus  hoverspin black\" onclick=\"minusNum('${ix.bookid}','try${ix.bookid}','${ix.price}')\"></i>\n" +
                                "    <i class=\"fa fa-plus  hoverspin black\" onclick=\"plusNum('${ix.bookid}','try${ix.bookid}','${ix.price}')\"></i></td>" +
                                "<td name='checkBpri'>" + "${ix.allprice}" + "</td>" +
                                "<td><a href='#' onclick=\"dele('${ix.bookid}')\" class='tablelink'>删除</a></td></tr>";
                            document.write(item);
                            </c:forEach>
                        </script>
                    </table>
                    <div class="bottomsubmit">
                        <ul>
                            <li><input type="submit" onclick="tijiao()"/></li>
                            <li><span>总价格：</span><span id="allprice">0</span></li>
                            <li><span>总件数：</span><span id="allnum">0</span></li>
                        </ul>
                    </div>
                </div>
                <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
                <script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
                <!-- 订单开始 -->
                <div class="indent">
                    <table class="table datatable" style="color: black;">
                        <thead>
                        <tr>
                            <%--<th>订单序号</th>--%>
                            <th>订单编号</th>
                            <th>买家</th>
                            <th>总金额</th>
                            <th>送货地址</th>
                            <th>是否发货</th>
                            <th>更多</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="ix" varStatus="stauts">
                            <tr>
                                <td id="mytl${stauts.index}" style="padding-left: 10px">${ix.orderid}</td>
                                <td>${ix.uid }</td>
                                <td>${ix.money}</td>
                                <td>${ix.name }</td>
                                <td>${ix.express }</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" data-remote="${pageContext.servletContext.contextPath}/showMoreInfo.action?orderid=${ix.orderid}" data-toggle="modal">
                                        信息</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 订单 -->
                <%--添加书籍--%>
                <input type="text" style="display: none;" id = "mybook" value="-1">
                <div class="addbook">
                    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
                    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.css"/>
                    <script src="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.js" type="text/javascript" charset="utf-8"></script>
                    <form id="saveForm" class="form-horizontal" action="${pageContext.servletContext.contextPath}/savebook.action"
                          method="post">
                        <div class="form-group">
                            <label for="bowner" class="col-sm-2">你的用户名</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="bowner" id="bowner" placeholder="你的账号" readonly value="${ptu.account}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookname" class="col-sm-2">书名</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" id="bookname" name="bookname" placeholder="书名">
                                <span id="booknameTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookauthor" class="col-sm-2">作者</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="bookauthor" id="bookauthor" placeholder="作者">
                                <span id="bookauthorTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tags" class="col-sm-2">书籍标签</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="tags" id="tags" placeholder="标签(以逗号分割)" >
                                <span id="tagsTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2">单价</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="price" id="price" placeholder="单价">
                                <span id="priceTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="booknum" class="col-sm-2">数量</label>
                            <div class="col-md-6 col-sm-10">
                                <input type="text" class="form-control" name="booknum" id="booknum" placeholder="存库数量">
                                <span id="booknumTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookinfo" class="col-sm-2">简介</label>
                            <div class="col-md-6 col-sm-10">
                                <textarea type="text" class="form-control" name="bookinfo" id="bookinfo" placeholder="简介(不得超过140字)" style="height: 100px;"></textarea>
                                <span id="bookinfoTip" style="color:red;font-size: 12px"></span>
                            </div>
                        </div>
                        <input type="text" style="display: none;" id="upbook" name="book">
                        <div class="form-group">
                            <label class="col-sm-2">书籍图片</label>
                            <div id='uploaderExample' class="uploader " data-ride="uploader" data-url="your/file/upload/url" style="width: 730px;float: left;">
                                <div class="uploader-message text-center">
                                    <div class="content"></div>
                                    <button type="button" class="close">×</button>
                                </div>
                                <div class="uploader-files file-list file-list-grid"></div>
                                <div >
                                    <hr class="divider">
                                    <div class="uploader-status pull-right text-muted"></div>
                                    <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件
                                    </button>
                                    <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i>
                                        开始上传
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-primary" onclick="save()">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%--添加书籍--%>
            </div>
        </div>
    </div>
    <!-- =====  CONTAINER END  ===== -->
    <!-- =====  FOOTER START  ===== -->
    <div class="footer pt_60">
        <div class="footer-bottom mt_60 ptb_10">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="copyright-part">Welcome to our bookshop</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="payment-icon text-right">
                            <ul>
                                <li><i class="fa fa-cc-paypal "></i></li>
                                <li><i class="fa fa-cc-stripe"></i></li>
                                <li><i class="fa fa-cc-visa"></i></li>
                                <li><i class="fa fa-cc-discover"></i></li>
                                <li><i class="fa fa-cc-mastercard"></i></li>
                                <li><i class="fa fa-cc-amex"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- =====  FOOTER END  ===== -->

</div>

<img src="" style="display: none" id = "smsimg">
<a id="scrollup">Scroll</a>

<script src="${pageContext.servletContext.contextPath}/js/owl.carousel.min.js"></script>
<%--<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>--%>

<script src="${pageContext.servletContext.contextPath}/js/custom0.js"></script>
<%--<script src="${pageContext.servletContext.contextPath}/js/jquery-ui.js"></script>--%>
<%--<script src="${pageContext.servletContext.contextPath}/js/jquery.magnific-popup.js"></script>--%>
<%--<script src="${pageContext.servletContext.contextPath}/js/jQuery_v3.1.1.min.js"></script>--%>
<!-- jQuery -->
<%--<script src="${pageContext.servletContext.contextPath}/js/jquery.js"></script>--%>
<script src="${pageContext.servletContext.contextPath}/js/plugins.js"></script>

<script>
    var $container = $('.portfolio_container');
    $container.isotope({
        filter: '.cart',
    });
    $('.portfolio_filter a').click(function () {
        $('.portfolio_filter .active').removeClass('active');
        $(this).addClass('active');

        var selector = $(this).attr('data-filter');
        $container.isotope({
            filter: selector,
            animationOptions: {
                duration: 1000,
                animationEngine: "jquery"
            }
        });
        return false;
    });
</script>
<script type="text/javascript">
    //全选或全不选
    function selectAll() {
        var items = document.getElementsByName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkOther.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = checkAll.checked;
        }
        var itemN = document.getElementsByName("checkBnum");
        ;
        var itemP = document.getElementsByName("checkBpri");
        ;
        var n = 0, p = 0;
        for (var i = 0; i < items.length; i++) {
            if (items[i].checked) {
                n = n + parseInt(itemN[i].innerHTML)
                p = p + parseFloat(itemP[i].innerHTML);
            }
        }
        document.getElementById("allprice").innerHTML = p.toFixed(4);
        document.getElementById("allnum").innerHTML = n;
    }

    //反选
    function selectOther() {
        var items = document.getElementsByName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkAll.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = !items[i].checked;
        }
        var itemN = document.getElementsByName("checkBnum");
        ;
        var itemP = document.getElementsByName("checkBpri");
        ;
        var n = 0, p = 0;
        for (var i = 0; i < items.length; i++) {
            if (items[i].checked) {
                n = n + parseInt(itemN[i].innerHTML)
                p = p + parseFloat(itemP[i].innerHTML);
            }
        }
        document.getElementById("allprice").innerHTML = p.toFixed(4);
        document.getElementById("allnum").innerHTML = n;
    }

    function jisuan() {
        var items = document.getElementsByName("checkItem");
        var itemN = document.getElementsByName("checkBnum");
        var itemP = document.getElementsByName("checkBpri");
        var n = 0, p = 0;
        for (var i = 0; i < items.length; i++) {
            if (items[i].checked) {
                n = n + parseInt(itemN[i].innerHTML)
                p = p + parseFloat(itemP[i].innerHTML);
            }
        }
        document.getElementById("allprice").innerHTML = p.toFixed(4);
        document.getElementById("allnum").innerHTML = n;
    }

    function tijiao() {
        if("${mrdz}" == "尚未设置地址" || "${mrdz}" == "") {
            alert("请设置默认地址！")
        }else {
            var items = document.getElementsByName("checkItem");
            var itemN = document.getElementsByName("checkBnum");
            var itemP = document.getElementsByName("checkBpri");
            var n = 0, p = 0, tmp ="";
            for (var i = 0, j = 0; i < items.length; i++) {
                if (items[i].checked) {
                    if (j != 0) tmp = tmp + ","
                    tmp = tmp + items[i].value;
                    j = j + 1;
                    n = n + parseInt(itemN[i].innerHTML)
                    p = p + parseFloat(itemP[i].innerHTML);
                }
            }
            console.log(tmp)
            location.href = "${pageContext.servletContext.contextPath}/subsc.action?uid=${ptu.userid}&scbookid=" + tmp + "&allnum=" + n + "&allpri=" + p;
        }
    }
    function minusNum(ID, NUM, p) {
        NUM = "#"+NUM
        var num = parseInt($(NUM).html())
        if(num > 1) {
            num = num - 1;
            $(NUM).html(num)
            <%--location.href = "${pageContext.servletContext.contextPath}/changeBSNum.action?bookid="+ID+"&booknum="+num+"&price="+p;--%>
            var items = document.getElementsByName("checkItem");
            var itemP = document.getElementsByName("checkBpri");
            for (var i = 0; i < items.length; i++) {
                if (items[i].value == ID) {
                    itemP[i].innerHTML = (parseFloat(p)*num).toFixed(2)
                    break
                }
            }
            $.post("${pageContext.servletContext.contextPath}/changeBSNum.action?bookid="+ID+"&booknum="+num+"&price="+p)
            jisuan();
        }
    }
    function plusNum(ID, NUM, p) {//TODO: 还能不能加的提醒
        NUM = "#"+NUM
        var num = parseInt($(NUM).html())+1
        $(NUM).html(num)
        <%--location.href = "${pageContext.servletContext.contextPath}/changeBSNum.action?bookid="+ID+"&booknum="+num+"&price="+p;--%>
        var items = document.getElementsByName("checkItem");
        var itemP = document.getElementsByName("checkBpri");
        for (var i = 0; i < items.length; i++) {
            if (items[i].value == ID) {
                itemP[i].innerHTML = (parseFloat(p)*num).toFixed(2)
                break
            }
        }
        $.post("${pageContext.servletContext.contextPath}/changeBSNum.action?bookid="+ID+"&booknum="+num+"&price="+p)
        jisuan();
    }
</script>
<script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
<script>
    function dele(x) {
        location.href = "${pageContext.servletContext.contextPath}/delsc.action?uid=${ptu.userid}&bookid=" + x;
    }

    function userlogin() {
        if ("${ptu}" != "") {
            location.href = "${pageContext.servletContext.contextPath}/user.action";
        } else {
            $('#ycbutton').click()
        }
    }

    function regUser() {
        $('#regbutton').click()
    }

    function Login() {
        var pwd = $('#inputEmailExample2').val()
        $('#inputEmailExample2').val(hex_md5(pwd))
        var url = "${pageContext.servletContext.contextPath}/ulogin.action?account=" + $('#inputEmailExample1').val() + "&pwd=" + $('#inputEmailExample2').val() + "&code=" + $('#code').val();
        location.href = url;
    }

    function Register() {
        var pwd = $('#inputExample2').val()
        $('#inputExample2').val(hex_md5(pwd))
        var url = "${pageContext.servletContext.contextPath}/register.do?account=" + $('#inputExample1').val() + "&pwd=" + $('#inputExample2').val() + "&username=" + $('#inputExample3').val() + "&sex=";
        if (document.getElementById("sex2").checked) url = url + "女";
        else url = url + "男";
        location.href = url;
    }

    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?" + new Date().getTime();
    }
    function changepwd() {
        var pwd0 = $("#yuanpwd").val()
        var pwd1 = $("#newpwd").val()
        var pwd2 = $("#repwd").val()
        if(pwd1.length < 4 || pwd1.length > 16) {
            alert("密码长度不得少于4位，超过16位")
        }else {
            $("#yuanpwd").val(hex_md5(pwd0))
            $("#newpwd").val(hex_md5(pwd1))
            $("#repwd").val(hex_md5(pwd2))
            if(pwd1 != pwd2) {
                alert("新密码与确认密码不相同！")
            }else {
                pwd0 = $("#yuanpwd").val()
                pwd1 = $("#newpwd").val()
                <%--document.getElementById("smsimg").setAttribute("src", "${pageContext.servletContext.contextPath}/changepwd.action?pwd0="+pwd0+"&pwd1="+pwd1)--%>
                location.href ="${pageContext.servletContext.contextPath}/changepwd.action?pwd0="+pwd0+"&pwd1="+pwd1
            }
        }
    }
    function changedizhi() {
        var url = "${pageContext.servletContext.contextPath}/adddizhi.action?uid=${ptu.userid}&dizhi="+$("#dizhi").val()+"&isdefault=";
        if (document.getElementById("dizhi2").checked) url = url + "否";
        else url = url + "是";
        location.href = url
    }

    function addtocart(a,b) {
        var url = '${pageContext.servletContext.contextPath}/addtocart.action?bookid='+a+'&price='+b
        $.post(url)
        // location.href = url
        if("${ptu}" == "") alert("添加失败！")
        else alert("成功添加到购物车，进入个人页面查看！")
    }
    function quickview(id) {
        var url = "${pageContext.servletContext.contextPath}/bookinfo.action?bookid="+id;
        location.href = url;
    }
</script>

<script type="text/javascript">
    // $(function(){
    if(document.getElementById('mybook').value == -1) {
        document.getElementById('mybook').setAttribute("book", Date.parse(new Date()))
        document.getElementById('upbook').value = document.getElementById('mybook').getAttribute("book");
        // document.getElementById('mybook').innerText = Date.parse(new Date())
        // document.getElementById('mybook').value = Date.parse(new Date());
    }
    // });
    // window.onload = function () {
    //
    // }
    //前端校验【数据是否填写，填写后数据是否符合格式】DOM
    function save() {
        //js获取html标签对象
        //document.querySelectorAll(".account");
        var success = true;
        var bookname = document.querySelector("#bookname");
        var booknameTip = document.querySelector("#booknameTip");
        var bookauthor = document.querySelector("#bookauthor");
        var bookauthorTip = document.querySelector("#bookauthorTip");
        var price = $("#price").val()
        var priceTip = document.querySelector("#priceTip");
        var booknum = $("#booknum").val()
        var booknumTip = document.querySelector("#booknumTip");
        var bookinfo = $("#bookinfo").val()
        var bookinfoTip = document.querySelector("#bookinfoTip");
        booknameTip.innerText = "";
        priceTip.innerText = ""
        bookauthorTip.innerText = "";
        booknumTip.innerText = "";
        bookinfoTip.innerText = "";
        if(!isZheng(price)) {
            priceTip.innerText = "价格必须正数";
            success = false;
        }
        if(!isInteger(booknum)) {
            booknumTip.innerText = "价格必须正整数";
            success = false;
        }
        if (bookname.value == "") {
            booknameTip.innerText = "书名不能为空";
            success = false;
        }
        if(bookinfo == ""){
            bookinfoTip.innerText = "简介不能为空";
            success = false;
        }
        if(bookauthor.value == "") {
            bookauthorTip.innerText = "作者不能为空";
            success = false;
        }
        if (success) {
            document.querySelector("#saveForm").submit();
        }
    }
    function isInteger(obj) {
        return (typeof obj === 'string' && parseInt(obj, 10)%1 == 0 && parseInt(obj, 10)>0)||(typeof obj === 'number' && obj%1 === 0 && obj>0);
    }
    function isZheng(price) {
        return (typeof price == 'string' && price.match(/^\d+((\.\d+){0,})?$/) && parseFloat(price) > 0)||(typeof price == 'number' && price > 0);
    }
</script>
<script type="text/javascript">
    $('#uploaderExample').uploader({
        autoUpload: false, // 当选择文件后立即自动进行上传操作
        url: '${pageContext.servletContext.contextPath}/uploadbookimgs.action?book='+document.getElementById('mybook').getAttribute("book") // 文件上传提交地址
    });
</script>
<script>
    new $.zui.Messager('欢迎进入个人首页！', {
        icon: 'heart',
        placement: 'top',
        type: 'primary'
    }).show();
</script>
</body>
</html>
