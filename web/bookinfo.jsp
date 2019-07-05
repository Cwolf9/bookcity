<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <!-- =====  BASIC PAGE NEEDS  ===== -->
    <meta charset="utf-8">
    <title>bookshop</title>
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
    <style>
        .img-circle {
            border-radius: 50%;
        }

        .icon-2x {
            font-size: 21px;
        }

        .commentlistuserimg {
            height: 60px;
        }

        .mycomment {
            margin-right: 20px;
            float: right;
            height: 600px;
            width: 270px;
        }

        .mycommenttitle {
            margin: 0 70px;
        }

        .mycommentcontent {
            width: 600px;
            margin: 0 70px;
        }

        .mycommentcontent-input {
            margin: 0 40px;
            width: 200px;
        }

        .mycommentcontent-textarea {
            margin: 0 10px;
            width: 300px;
            height: 100px;
        }

        .mycommentcontent-button {
            margin: 10px 10px 10px 200px;
        }

        .commentlistitem {
        }

        .commentlistusername {
            margin: 10px;
        }

        .commentlistbutton {
            margin: 10px 10px 10px 600px;
        }
    </style>
    <script src="${pageContext.servletContext.contextPath}/js/md5.js"></script>
</head>
<body class="shop-detail">
<!-- =====  LODER  ===== -->
<div class="loder"></div>
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
                <div class="headicon">
                    <!-- 搜索框的实现 -->
                    <ul>
                        <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black"
                                                      aria-hidden="true"></i></a></li>
                        <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton"
                                style="display: none;"></button>
                        <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black"
                                                        aria-hidden="true"></i></a>${ptuname}</li>
                        <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton"
                                style="display: none;"></button>
                        <li><a href="${pageContext.servletContext.contextPath}/cart.action"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a>
                        </li>
                    </ul>
                    <div class="search">
                        <div class="search-overlay">
                            <!-- 关闭键 -->
                            <a href="javascript:void(0)" class="search-overlay-close"></a>
                            <div class="container">
                                <!-- 整页面搜索 -->
                                <form role="search" id="searchform"
                                      action="${pageContext.servletContext.contextPath}/SearchBook.action"
                                      method="post">
                                    <label class="h5 normal search-input-label">Enter keywords To Search Entire
                                        Store</label>
                                    <input id="searchbar" name="mtype" placeholder="请输入您要搜索书籍的关键字..." type="search">
                                    <button type="submit"></button>
                                </form>
                                <!-- 大页面 -->
                            </div>
                        </div>
                        <!-- 首面搜索实现通过id实现 -->
                        <div id="search-overlay-btn1"><i class="fa fa-search fa-2x hoverspin" aria-hidden="true"></i>
                        </div>
                    </div>
                    <!-- 搜索框实现结束 -->
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
                            <ul class="nav  main-navigation collapse in">
                                <li><a href="${pageContext.servletContext.contextPath}/index.action">HOME</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=畅销&nowpage=1">最畅销</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=好评&nowpage=1">最好评</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=科技&nowpage=1">科技类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=历史&nowpage=1">历史类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=经济&nowpage=1">经济类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=文学&nowpage=1">文学类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=小说&nowpage=1">小说类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=散文&nowpage=1">散文类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=传记&nowpage=1">传记类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=玄幻&nowpage=1">玄幻类</a>
                                </li>
                                <li><a href="${pageContext.servletContext.contextPath}/list.action?mtype=言情&nowpage=1">言情类</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="left_banner left-sidebar-widget mb_50"><a href="#"><img src="images/left11.jpg"
                                                                                    alt="Left Banner"
                                                                                    class="img-responsive"/></a></div>
                <div class="left-special left-sidebar-widget mb_50">
                    <div class="heading-part mb_20 ">
                        <h2 class="main_title">猜你喜欢</h2>
                    </div>
                    <!-- lleor -->
                    <div id="left-special" class="owl-carousel show">
                        <script>
                            var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                            var row = "";
                            <c:forEach items="${lammuyd}" var="ix" varStatus="stauts">
                            if ("${stauts.index}" == "0" || "${stauts.index}" == "3" || "${stauts.index}" == "6") row = row + "<ul class='row'>";
                            var item = "<li class='item product-layout-left mb_20'><div class='product-list col-xs-4'><div class='product-thumb'><div class='image product-imageblock'><a href='javascript:void(0);' onclick=\"quickview('${ix.bookid}')\">" +
                                "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'></a></div></div></div><div class='col-xs-8'><div class='caption product-detail'><h6 class='product-name'>" +
                                "<a href='#'>" + "${ix.bookname}" + "</a></h6>" +
                                "<div class='rating'>" + star + "</div><span class='price'><span class='amount'>" +
                                "<span class='currencySymbol'>$</span>" + "${ix.price}" + "</span>" +
                                "<span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                            row = row + item;
                            if ("${stauts.index}" == "2" || "${stauts.index}" == "5" || "${stauts.index}" == "8") row = row + "</ul>";
                            </c:forEach>
                            document.write(row);
                        </script>
                    </div>
                    <!-- /lleroe -->
                </div>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-9 mtb_30">
                <!-- =====  BANNER STRAT  ===== -->
                <div class="breadcrumb ptb_20">
                    <h1>${Book.bookname}</h1>
                    <ul>
                        <li><a href="${pageContext.servletContext.contextPath}/index.action">Home</a></li>
                        <li class="active">${Book.bookname}</li>
                    </ul>
                </div>
                <!-- =====  BREADCRUMB END===== -->
                <div class="row mt_10 ">
                    <div class="col-md-6">
                        <div><a class="thumbnails"> <img data-name="product_image"
                                                         src="${pageContext.servletContext.contextPath}/${Book.defaultimg}"
                                                         alt=""/></a></div>
                        <div id="product-thumbnail" class="owl-carousel">
                            <script>
                                <c:forEach items="${bookimg}" var="ix" varStatus="stauts">
                                var item =
                                    '<div class="item">' +
                                    '<div class="image-additional">' +
                                    '<a class="thumbnail" href="${pageContext.servletContext.contextPath}/${ix}" data-fancybox="group1">' +
                                    '<img src="${pageContext.servletContext.contextPath}/${ix}" alt="" /></a>' +
                                    '</div>' +
                                    '</div>';
                                document.write(item);
                                </c:forEach>
                            </script>
                        </div>
                    </div>
                    <div class="col-md-6 prodetail caption product-thumb">
                        <h4 data-name="product_name" class="product-name"><a href="#"
                                                                             title="Casual Shirt With Ruffle Hem">${Book.bookname}</a>
                        </h4>
                        <div class="rating">
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                    class="fa fa-star fa-stack-1x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                    class="fa fa-star fa-stack-1x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                    class="fa fa-star fa-stack-1x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                    class="fa fa-star fa-stack-1x"></i></span>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i
                                    class="fa fa-star fa-stack-x"></i></span>
                        </div>
                        <span class="price mb_20"><span class="amount"><span
                                class="currencySymbol">$</span>${Book.price}</span>
              </span>
                        <hr>
                        <ul class="list-unstyled product_info mtb_20">
                            <li>
                                <label>作者：</label>
                                <span> <a href="#">${Book.bookauthor}</a></span></li>
                            <li>
                                <label>标签：</label>
                                <span> <a href="#">${Book.tags}</a></span></li>
                            <li>
                                <label>单价：</label>
                                <span> ${Book.price}</span></li>
                            <li>
                                <label>库存：</label>
                                <span> ${Book.booknum}</span></li>
                            <li>
                                <label>销量：</label>
                                <span> ${Book.sallnum}</span></li>
                        </ul>
                        <hr>
                        <p class="product-desc mtb_30"> ${Book.bookinfo}</p>
                        <div id="product">
                            <div class="qty mt_30 form-group2">
                                <label>数量：</label>
                                <input name="product_quantity" min="1" value="1" type="number">
                            </div>
                            <div class="button-group mt_30">
                                <div class="add-to-cart" onclick="addtocart('${Book.bookid}','${Book.price}')"><a
                                        href="#"><span>Add to cart</span></a></div>
                                <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                <div class="compare"><a href="#"><span>Compare</span></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/person.css">
                <div class="row">
                    <div class="col-md-12">
                        <div id="exTab5" class="mtb_30">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#1c" data-toggle="tab">comment</a></li>
                            </ul>
                            <!-- 评价 -->
                            <div class="tab-content mt_20">
                                <!-- 评价发表 -->
                                <div class="mycomment">
                                    <div class="mycommenttitle">
                                        <img class=" img-circle icon-2x" src="${pageContext.servletContext.contextPath}/${ptu.avatar}">
                                        <div style="display: block; margin-left: 12px;font-size: 18px;">
                                            <span>${ptu.account}</span></div>
                                    </div>
                                    <input type="text" class="mycommentcontent-input" placeholder="标题:美好的一天..."
                                           id="biaoti" style="margin-top: 10px;">
                                    <br>
                                    <textarea rows="3" class="mycommentcontent-textarea" name=textarea
                                              placeholder="内容:今天捡到一分钱！！！^_^" id="neirong" style="margin-top: 10px;"></textarea>
                                    <br>
                                    <button type="button" class="btn btn-primary mycommentcontent-button" onclick="savemess()" style="margin-left: 120px;">save
                                    </button>
                                </div>
                                <!-- 评价发表 -->
                                <br> <br>
                                <!-- 显示评价 -->
                                <div class="comentlist">
                                    <div class="document"></div>
                                    <!-- single -->
                                    <div class="commentlistitem">
                                        <div class="commentlisttitle" style="color: black;">
                                            <img class="img-circle commentlistuserimg" src="${pageContext.servletContext.contextPath}/images/user1.jpg">
                                            <span class="commentlistusername"><strong>哈姆雷特：</strong></span>
                                            <span>思考</span>
                                            <span class="dates">2019-06-17</span></div>
                                        <div class="comentlist-content" style="margin-top: 15px;color: black;">生存还是毁灭？这是一个问题</div>
                                        <%--<button class="commentlistbutton" type="button">删除</button>--%>
                                    </div>
                                    <script>
                                        <c:forEach items="${message}" var="ix" varStatus="stauts">
                                            var item = "<div class=\"commentlistitem\" id='mes${stauts.index}'>" +
                                                " <div class=\"commentlisttitle\" style=\"color: black;\">" +
                                                " <img class=\"img-circle commentlistuserimg\" src=\"${pageContext.servletContext.contextPath}/${ix.ava}\">" +
                                                "  <span class=\"commentlistusername\"><strong>"+"${ix.username}"+"：</strong></span>" +
                                                "   <span>"+"${ix.title}"+"</span>" +
                                                "  <span class=\"dates\">"+"${ix.time}"+"</span></div>" +
                                                "  <div class=\"comentlist-content\" style=\"margin-top: 15px;color: black;\">"+"${ix.context}"+"</div>";
                                                if("${ix.username}" == "${ptu.account}") item = item + "<button class=\"commentlistbutton\" type=\"button\" onclick=\"delmes('${ix.m_id}','mes${stauts.index}')\">删除</button>";
                                                item = item + "   </div>";
                                            document.write(item);
                                        </c:forEach>
                                    </script>
                                    <!-- single -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-part text-center">
                            <h2 class="main_title mt_50">相关 书籍</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product-layout  product-grid related-pro  owl-carousel mb_50">
                        <script>
                            var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                            <c:forEach items="${relebook}" var="ix" varStatus="stauts">
                            var item = "<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#' onclick=\"quickview('${ix.bookid}')\">" +
                                "<img data-name='product_image' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> " +
                                "<img src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'>" +
                                "<a href='#' title='Casual Shirt With Ruffle Hem'> " + "${ix.bookname}" + "</a></h6><div class='rating'>" + star + " </div><span class='price'><span class='amount'>" +
                                "<span class='currencySymbol'>$</span>" + "${ix.price}" + "</span><span class='dates'>" + "${ix.booknum}" + "</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a>" +
                                "</div><div class='quickview' onclick=\"quickview('${ix.bookid}')\"><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart' onclick=\"addtocart('${ix.bookid}','${ix.price}')\"><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                            document.write(item);
                            console.log(111)
                            </c:forEach>
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="brand_carouse" class="ptb_30 text-center">--%>
        <%--<div class="type-01">--%>
        <%--<div class="heading-part mb_20 ">--%>
        <%--<h2 class="main_title">Brand Logo</h2>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
        <%--<div class="col-sm-12">--%>
        <%--<div class="brand owl-carousel ptb_20">--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand1.png" alt="Disney"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand2.png" alt="Dell"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand3.png" alt="Harley"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand4.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand5.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand6.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand7.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand8.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--<div class="item text-center"><a href="#"><img src="images/brand/brand9.png" alt="Canon"--%>
        <%--class="img-responsive"/></a></div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
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
<a id="scrollup">Scroll</a>
<script src="js/jQuery_v3.1.1.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.js"></script>
<script src="js/custom0.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    function savemess() {
        if (document.getElementById("biaoti").value == "") {
            alert("请输入标题！")
        } else if (document.getElementById("neirong").value == "") {
            alert("请输入内容！")
        } else {
            var ava = "${ptu.avatar}"
            var date = new Date().format("yyyy-MM-dd-hh:mm:ss")
            var acc = "${ptu.account}"
            var biaoti = document.getElementById("biaoti").value
            var neirong = document.getElementById("neirong").value
            location.href = "${pageContext.servletContext.contextPath}/savemes.action?acc="+acc+
                "&date="+date+"&ava="+ava+"&biaoti="+biaoti+"&neirong="+neirong+"&bookid=${Book.bookid}";
        }
    }
    function delmes(x, y) {
        y = "#" + y;
        $(y).css("display","none");
        $.post("${pageContext.servletContext.contextPath}/delmes.action?mid="+x);
    }
</script>
<script>
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

    function addtocart(a, b) {
        var url = '${pageContext.servletContext.contextPath}/addtocart.action?bookid=' + a + '&price=' + b
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
