﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/style0.css">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
    <style>
        .headicon{
            float:right;
            margin:10px;
            margin-right: 20px;
            width:330px;
            height:90px;
        }
    </style>
</head>

<body>
<!-- ===== 预载   ===== -->
<div class="loder"></div>
<div class="wrapper">
    <div id="subscribe-me" class="modal animated fade in" role="dialog" data-keyboard="true" tabindex="-1">
        <div class="newsletter-popup">
            <img class="offer" src="images/newsbg.jpg" alt="offer">
            <div class="newsletter-popup-static newsletter-popup-top">
                <div class="popup-text">
                    <div class="popup-title">50% <span>off</span></div>
                    <div class="popup-desc">
                        <div>Sign up and get 50% off your next Order</div>
                    </div>
                </div>
                <form onsubmit="return  validatpopupemail();" method="post">
                    <div class="form-group required">
                        <input type="email" name="email-popup" id="email-popup" placeholder="Enter Your Email"
                               class="form-control input-lg" required/>
                        <button type="submit" class="btn btn-default btn-lg" id="email-popup-submit">Subscribe</button>
                        <label class="checkme">
                            <input type="checkbox" value="" id="checkme"/>Dont show again</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
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

                <ul>
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton" style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton" style="display: none;"></button>
                    <li><a href="${pageContext.servletContext.contextPath}/user.action"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                </ul>
                <!-- 搜索框的实现 -->
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
                    <div id="search-overlay-btn1"><i class="fa fa-search fa-2x hoverspin" aria-hidden="true"></i></div>
                </div>
                <!-- 搜索框实现结束 -->
            </div>
        </div>
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
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
                            <img style="margin-top: 5px;margin-left: 5px;" src="${pageContext.servletContext.contextPath}/code.do" alt="code" onclick="changeCode(this)">
                            <br>
                            <input class="input100" type="text" name="code" placeholder="请输入验证码" id="code" style="margin-top: 10px;">
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
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
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
        <!-- 导航栏变化样式 -->
        <!-- 导航栏固定样式 -->
        <div id="home" class="headorigin">
            <div class="headbrand">
            BOOKSHOP</div>
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
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton" style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton" style="display: none;"></button>
                    <li><a href="${pageContext.servletContext.contextPath}/user.action"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
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


    <!-- 中间框架 -->
    <div class="container">
        <div class="row ">
            <!-- 左边 -->
            <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 ">
                <!-- 导航栏 -->
                <div id="category-menu" class="navbar collapse in  mb_40" aria-expanded="true" style="" role="button">
                    <div class="nav-responsive">
                        <div class="section" id="projects">
                            <ul class="nav  main-navigation collapse in ">
                                <li><a href="${pageContext.servletContext.contextPath}/index.action">HOME</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=畅销&nowpage=1">最畅销</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=好评&nowpage=1">最好评</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=科技&nowpage=1">科技类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=历史&nowpage=1">历史类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=经济&nowpage=1">经济类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=文学&nowpage=1">文学类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=小说&nowpage=1">小说类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=散文&nowpage=1">散文类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=传记&nowpage=1">传记类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=玄幻&nowpage=1">玄幻类</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=言情&nowpage=1">言情类</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 导航栏 -->
                <!-- 左侧海报图功能图 -->
                <div class="left_banner left-sidebar-widget mt_30 mb_50"><a href="#"><img src="images/left11.jpg"
                                                                                          alt="Left Banner"
                                                                                          class="img-responsive"/></a>
                </div>
                <div class="left-cms left-sidebar-widget mb_50">
                    <ul>
                        <li>
                            <div class="feature-i-left ptb_40">
                                <div class="icon-right Shipping"></div>
                                <a href="${pageContext.servletContext.contextPath}/user.action"><h6>物流查询</h6></a>
                                <p>Free delivery worldwide</p>
                            </div>
                        </li>
                        <li>
                            <div class="feature-i-left ptb_40">
                                <div class="icon-right Order"></div>
                                <a href="${pageContext.servletContext.contextPath}/user.action"><h6>与我联系</h6></a>
                                <p>Hours : 8am - 11pm</p>
                            </div>
                        </li>
                        <li>
                            <div class="feature-i-left ptb_40">
                                <div class="icon-right Save"></div>
                                <a href="${pageContext.servletContext.contextPath}/user.action"><h6>购物车界面</h6></a>
                                <p>For All Spices & Herbs</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 左侧海报图功能图           -->
                <!-- 栏目预订 -->
                <div id="myfavorite" class="left-special left-sidebar-widget mb_50">
                    <div class="heading-part mb_20 ">
                        <h2 class="main_title">猜你喜欢</h2></div>
                    <div id="left-special" class="owl-carousel">
                        <!-- js接口 -->
                        <script>
                            var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                            var row = "";
                            <c:forEach items="${lammuyd}" var="ix" varStatus="stauts">
                            if ("${stauts.index}" == "0" || "${stauts.index}" == "3" || "${stauts.index}" == "6") row = row + "<ul class='row'>";
                            var item = "<li class='item product-layout-left mb_20'>" +
                                "<div class='product-list col-xs-4'>" +
                                "<div class='product-thumb' >" +
                                "<div class='image product-imageblock' onclick=\"quickview('${ix.bookid}')\">" +
                                "<a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                "</a></div></div></div>" +
                                "<div class='col-xs-8'><div class='caption product-detail'>" +
                                "<h6 class='product-name'><a href='#'>${ix.bookname}</a></h6>" +
                                "<div class='rating'>" + star + "</div><span class='price'>" +
                                "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span" +
                                "><span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                            row = row + item;
                            if ("${stauts.index}" == "2" || "${stauts.index}" == "5" || "${stauts.index}" == "8") row = row + "</ul>";
                            </c:forEach>
                            document.write(row);
                        </script>
                    </div>
                </div>
                <!-- 栏目预订 -->
                <%--<div class="left_banner left-sidebar-widget mb_50" style="display: none;"><a href="#"><img src="images/left2.jpg"--%>
                                                                                    <%--alt="Left Banner"--%>
                                                                                    <%--class="img-responsive"/></a></div>--%>
                <!-- 博客推荐界面适当的时候不要 -->
                <div class="Testimonial left-sidebar-widget mb_50">
                    <div id="blog" class="heading-part mb_20 ">
                        <h2 class="main_title">BLOG</h2>
                    </div>
                    <div class="client owl-carousel text-center pt_10">
                        <div class="item client-detail">
                            <div class="client-avatar"><img alt="" src="images/user1.jpg"></div>
                            <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                            <div class="client-designation mb_10">php Developer</div>
                            <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus
                                oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
                        </div>
                        <div class="item client-detail">
                            <div class="client-avatar"><img alt="" src="images/user2.jpg"></div>
                            <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                            <div class="client-designation mb_10">php Developer</div>
                            <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus
                                oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
                        </div>
                        <div class="item client-detail">
                            <div class="client-avatar"><img alt="" src="images/user3.jpg"></div>
                            <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                            <div class="client-designation mb_10">php Developer</div>
                            <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus
                                oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
                        </div>
                    </div>
                </div>
                <!-- 标签索引 -->
                <div class="Tags left-sidebar-widget mb_50">
                    <div class="heading-part mb_20 ">
                        <h2 class="main_title">Tags</h2>
                    </div>
                    <ul>
                        <%--TODO:tags--%>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=科技&nowpage=1">科技类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=历史&nowpage=1">历史类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=经济&nowpage=1">经济类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=文学&nowpage=1">文学类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=小说&nowpage=1">小说类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=散文&nowpage=1">散文类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=传记&nowpage=1">传记类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=玄幻&nowpage=1">玄幻类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=言情&nowpage=1">言情类</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=web&nowpage=1">web</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=数据库&nowpage=1">数据库</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=算法&nowpage=1">算法</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=算法&nowpage=1">算法</a></li>
                    </ul>
                </div><!-- 博客推荐界面适当的时候不要 -->
            </div>
            <!-- 左边 -->

            <!-- 右边 -->
            <div id="column-right" class="col-sm-8 col-md-8 col-lg-9 mtb_30">
                <!-- 焦点图         -->
                <div class="banner" id="focus">
                    <div class="main-banner owl-carousel">
                        <div class="item"><a href="#"><img src="images/main_banner11.jpg" alt="Main Banner"
                                                           class="img-responsive"/></a></div>
                        <div class="item"><a href="#"><img src="images/main_banner22.jpg" alt="Main Banner"
                                                           class="img-responsive"/></a></div>
                    </div>
                </div>
                <!-- 焦点图 -->
                <!-- 副焦点图 -->
                <div class="row">
                    <div class="cms_banner mt_10">
                        <div class="col-xs-6 col-sm-12 col-md-6 mt_20">
                            <div id="subbanner1" class="sub-hover"><a href="#"><img src="images/sub11.png"
                                                                                    alt="Sub Banner1"
                                                                                    class="img-responsive"></a>
                                <div class="bannertext">
                                    <h2>Wonderful<br></br>book</h2>
                                    <p class="mt_10">How to look book</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-12 col-md-6 mt_20">
                            <div id="subbanner2" class="sub-hover"><a href="#"><img src="images/sub22.png"
                                                                                    alt="Sub Banner2"
                                                                                    class="img-responsive"></a>
                                <div class="bannertext">
                                    <h2>SMART BOOKS</h2>
                                    <p class="mt_10">How to look book</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 副焦点图 -->
                <!-- 新书展示 -->
                <div id="product-tab" class="mt_40">
                    <div id="newarrival" class="heading-part mb_20 ">
                        <h2 class="main_title">New Arrival</h2>
                    </div>
                    <ul class="nav text-right">
                        <li class="active"><a href="#hopsort" data-toggle="tab">HopSort</a></li>
                        <li><a href="#datesort" data-toggle="tab">DateSort</a></li>
                        <li><a href="#commentsort" data-toggle="tab">CommentSort</a></li>
                    </ul>
                    <!-- 书本展示栏 -->
                    <style>
                        .image a .abc {
                            height: 260px;
                        }
                    </style>
                    <div class="tab-content clearfix box">
                        <!-- 按照人气排名 -->
                        <div class="tab-pane active" id="hopsort">
                            <div class="hopsort owl-carousel">
                                <script>
                                    var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                    var row = "";
                                    <c:forEach items="${hotbook}" var="ix" varStatus="stauts">
                                    if ("${stauts.index}" == "0" || "${stauts.index}" == "2" || "${stauts.index}" == "4" || "${stauts.index}" == "6") {
                                        row = row + "<div class='product-grid'>";
                                    }
                                    var item = "<div class='item'><div class='product-thumb ' ><div class='image product-imageblock'> <a href='javascript:void(0);' onclick=\"quickview('${ix.bookid}')\">" +
                                        "<img class='abc' data-name='product_image' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive' > " +
                                        "<img class='abc' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div>" +
                                        "<div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'>" +
                                        "<a href='#'' title='Casual Shirt With Ruffle Hem'> " + "${ix.bookname}" + "</a></h6><div class='rating'>" + star + " </div><span class='price'>" +
                                        "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span><span class='dates'>" + "${ix.booknum}" + "</span></span>" +
                                        "<div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview' onclick=\"quickview('${ix.bookid}')\">" +
                                        "<a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div>" +
                                        "<div class='add-to-cart' onclick=\"addtocart('${ix.bookid}','${ix.price}')\"><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                                    row = row + item;
                                    if ("${stauts.index}" == "1" || "${stauts.index}" == "3" || "${stauts.index}" == "5" || "${stauts.index}" == "7") row = row + "</div>";
                                    </c:forEach>
                                    document.write(row);
                                </script>
                            </div>
                        </div>
                        <!-- 人气end -->

                        <!-- 按照时间排名 -->
                        <div class="tab-pane" id="datesort">
                            <div class="datesort owl-carousel">
                                <script>
                                    var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                    var row = "";
                                    <c:forEach items="${latestbook}" var="ix" varStatus="stauts">
                                    if ("${stauts.index}" == "0" || "${stauts.index}" == "2" || "${stauts.index}" == "4" || "${stauts.index}" == "6") {
                                        row = row + "<div class='product-grid'>";
                                        console.log("${stauts.index}")
                                    }
                                    var item = "<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''>" +
                                        "<img data-name='product_image' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> " +
                                        "<img src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div>" +
                                        "<div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'>" +
                                        "<a href='#'' title='Casual Shirt With Ruffle Hem'> " + "${ix.bookname}" + "</a></h6><div class='rating'>" + star + " </div><span class='price'>" +
                                        "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span><span class='dates'>" + "${ix.booknum}" + "</span></span>" +
                                        "<div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'>" +
                                        "<a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div>" +
                                        "<div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                                    row = row + item;
                                    if ("${stauts.index}" == "1" || "${stauts.index}" == "3" || "${stauts.index}" == "5" || "${stauts.index}" == "7") row = row + "</div>";
                                    </c:forEach>
                                    document.write(row);
                                </script>
                            </div>
                        </div>
                        <!-- 时间end -->
                        <!-- 按照评价排名 -->
                        <div class="tab-pane" id="commentsort">
                            <div class="commentsort owl-carousel">
                                <script>
                                    var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                    var row = "";
                                    <c:forEach items="${markbook}" var="ix" varStatus="stauts">
                                    if ("${stauts.index}" == "0" || "${stauts.index}" == "2" || "${stauts.index}" == "4" || "${stauts.index}" == "6") {
                                        row = row + "<div class='product-grid'>";
                                        console.log("${stauts.index}")
                                    }
                                    var item = "<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''>" +
                                        "<img data-name='product_image' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> " +
                                        "<img src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div>" +
                                        "<div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'>" +
                                        "<a href='#'' title='Casual Shirt With Ruffle Hem'> " + "${ix.bookname}" + "</a></h6><div class='rating'>" + star + " </div><span class='price'>" +
                                        "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span><span class='dates'>" + "${ix.booknum}" + "</span></span>" +
                                        "<div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'>" +
                                        "<a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div>" +
                                        "<div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                                    row = row + item;
                                    if ("${stauts.index}" == "1" || "${stauts.index}" == "3" || "${stauts.index}" == "5" || "${stauts.index}" == "7") row = row + "</div>";
                                    </c:forEach>
                                    document.write(row);
                                </script>
                            </div>
                        </div>
                        <!-- 评价end -->
                    </div>
                    <!-- 书本展示栏end -->
                </div>
                <!-- 新书展示end -->
                <div class="tlinks"></div>
                <!-- 横向海报图 -->
                <div class="row">
                    <div class="cms_banner mt_40 mb_50">
                        <div class="col-xs-12">
                            <div id="subbanner3" class="banner sub-hover"><a href="#"><img src="images/sub33.jpg"
                                                                                           alt="Sub Banner3"
                                                                                           class="img-responsive"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 横向海报图 -->
                <!-- 每日推荐畅销书本 -->
                <div id="sale-product">
                    <div id="recommend" class="heading-part mb_20 ">
                        <h2 class="main_title">推荐最畅销的书本</h2>
                    </div>
                    <div class="Specials owl-carousel">
                        <div class="item product-layout product-list">

                            <div class="product-thumb" >
                                <div class="image product-imageblock" onclick=quickview('${maxhotbook.bookid}')><a href="#"> <img data-name="product_image"
                                                                                        src="${pageContext.servletContext.contextPath}/${maxhotbook.defaultimg}"
                                                                                        alt="iPod Classic"
                                                                                        title="iPod Classic"
                                                                                        class="img-responsive"> <img
                                        src="${pageContext.servletContext.contextPath}/${maxhotbook.defaultimg}"
                                        alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a></div>
                                <div class="caption product-detail text-left">
                                    <h6 data-name="product_name" class="product-name"><a href="#"
                                                                                         title="Casual Shirt With Ruffle Hem">${maxhotbook.bookname}</a>
                                    </h6>
                                    <div class="rating"><span class="fa fa-stack"><i
                                            class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                                class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                                                class="fa fa-star-o fa-stack-1x"></i><i
                                                class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                                                class="fa fa-star-o fa-stack-1x"></i><i
                                                class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i
                                                class="fa fa-star-o fa-stack-1x"></i><i
                                                class="fa fa-star fa-stack-x"></i></span></div>
                                    <span class="price"><span class="amount"><span
                                            class="currencySymbol">$</span>${maxhotbook.price}</span></span>
                                    <p class="product-desc mt_20"> ${maxhotbook.bookinfo}</p>
                                    <div class="timer mt_80">
                                        <div class="days"></div>
                                        <div class="hours"></div>
                                        <div class="minutes"></div>
                                        <div class="seconds"></div>
                                    </div>
                                    <div class="button-group text-center">
                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                        <div class="quickview" onclick="quickview('${maxhotbook.bookid}')"><a href="#"><span>Quick View</span></a></div>
                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                        <div class="add-to-cart" onclick="addtocart('${maxhotbook.bookid}','${maxhotbook.price}')"><a href="#"><span>Add to cart</span></a></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- 每日推荐畅销书本 -->
                <!-- 横向海报图 -->
                <div class="row">
                    <div class="cms_banner mt_60 mb_50">
                        <div class="col-xs-12">
                            <div id="subbanner4" class="banner sub-hover"><a href="#"><img src="images/sub44.jpg"
                                                                                           alt="Sub Banner4"
                                                                                           class="img-responsive"></a>
                                <div class="bannertext"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 横向海报图 -->
                <!-- 畅销展示 -->
                <div class="row">

                    <div class="col-md-4">
                        <div class="heading-part mb_20 ">
                            <h2 class="main_title">文学</h2>
                        </div>
                        <div id="featu-pro" class="owl-carousel">
                            <!-- js接口 -->
                            <script>
                                var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                var row = "";
                                <c:forEach items="${wenxue}" var="ix" varStatus="stauts">
                                if ("${stauts.index}" == "0" || "${stauts.index}" == "3" || "${stauts.index}" == "6") row = row + "<ul class='row'>";
                                var item = "<li class='item product-layout-left mb_20'>" +
                                    "<div class='product-list col-xs-4'>" +
                                    "<div class='product-thumb' onclick=\"quickview('${ix.bookid}')\">" +
                                    "<div class='image product-imageblock'>" +
                                    "<a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "</a></div></div></div>" +
                                    "<div class='col-xs-8'><div class='caption product-detail'>" +
                                    "<h6 class='product-name'><a href='#'>${ix.bookname}</a></h6>" +
                                    "<div class='rating'>" + star + "</div><span class='price'>" +
                                    "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span" +
                                    "><span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                                row = row + item;
                                if ("${stauts.index}" == "2" || "${stauts.index}" == "5" || "${stauts.index}" == "8") row = row + "</ul>";
                                </c:forEach>
                                document.write(row);
                            </script>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="heading-part mb_20 ">
                            <h2 class="main_title">科技</h2>
                        </div>
                        <div id="bests-pro" class="owl-carousel">
                            <!-- js接口 -->
                            <script>
                                var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                var row = "";
                                <c:forEach items="${keji}" var="ix" varStatus="stauts">
                                if ("${stauts.index}" == "0" || "${stauts.index}" == "3" || "${stauts.index}" == "6") row = row + "<ul class='row'>";
                                var item = "<li class='item product-layout-left mb_20'>" +
                                    "<div class='product-list col-xs-4'>" +
                                    "<div class='product-thumb' onclick=\"quickview('${ix.bookid}')\">" +
                                    "<div class='image product-imageblock'>" +
                                    "<a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "</a></div></div></div>" +
                                    "<div class='col-xs-8'><div class='caption product-detail'>" +
                                    "<h6 class='product-name'><a href='#'>${ix.bookname}</a></h6>" +
                                    "<div class='rating'>" + star + "</div><span class='price'>" +
                                    "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span" +
                                    "><span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                                row = row + item;
                                if ("${stauts.index}" == "2" || "${stauts.index}" == "5" || "${stauts.index}" == "8") row = row + "</ul>";
                                </c:forEach>
                                document.write(row);
                            </script>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="heading-part mb_20 ">
                            <h2 class="main_title">历史</h2>
                        </div>
                        <div id="new-pro" class="owl-carousel">
                            <!-- js接口 -->
                            <script>
                                var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                                var row = "";
                                <c:forEach items="${lishi}" var="ix" varStatus="stauts">
                                if ("${stauts.index}" == "0" || "${stauts.index}" == "3" || "${stauts.index}" == "6") row = row + "<ul class='row'>";
                                var item = "<li class='item product-layout-left mb_20'>" +
                                    "<div class='product-list col-xs-4'>" +
                                    "<div class='product-thumb' onclick=\"quickview('${ix.bookid}')\">" +
                                    "<div class='image product-imageblock'>" +
                                    "<a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                    "</a></div></div></div>" +
                                    "<div class='col-xs-8'><div class='caption product-detail'>" +
                                    "<h6 class='product-name'><a href='#'>${ix.bookname}</a></h6>" +
                                    "<div class='rating'>" + star + "</div><span class='price'>" +
                                    "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span" +
                                    "><span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                                row = row + item;
                                if ("${stauts.index}" == "2" || "${stauts.index}" == "5" || "${stauts.index}" == "8") row = row + "</ul>";
                                </c:forEach>
                                document.write(row);
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右边结束 -->
    </div>
</div>
<!-- 中间框架end -->
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
<input type="text" style="display: none;" id="error" value="${error}">
</div>
<a id="scrollup">Scroll</a>
<script src="js/jquery.js"></script>
<script src="js/jQuery_v3.1.1.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.js"></script>
<script src="js/jquery.firstVisitPopup.js"></script>
<script src="js/custom0.js"></script>
<script>
    if($("#error").val() != "") {
        alert($("#error").val())
        location.href = "${pageContext.servletContext.contextPath}/index.action"
    }
</script>
<script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
<script>
    function userlogin() {
        if("${ptu}" != "") {
            location.href = "${pageContext.servletContext.contextPath}/user.action";
        }else {
            $('#ycbutton').click()
        }
    }
    function regUser() {
        $('#regbutton').click()
    }
    function Login() {
        var pwd = $('#inputEmailExample2').val()
        $('#inputEmailExample2').val(hex_md5(pwd))
        var url = "${pageContext.servletContext.contextPath}/ulogin.action?account=" + $('#inputEmailExample1').val()+"&pwd="+$('#inputEmailExample2').val()+"&code="+$('#code').val();
        location.href = url;
    }
    function Register() {
        var pwd = $('#inputExample2').val()
        $('#inputExample2').val(hex_md5(pwd))
        var url = "${pageContext.servletContext.contextPath}/register.do?account=" + $('#inputExample1').val()+"&pwd="+$('#inputExample2').val()+"&username="+$('#inputExample3').val()+"&sex=";
        if(document.getElementById("sex2").checked) url = url + "女";
        else url = url + "男";
        location.href = url;
    }
    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
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
</body>

</html>
