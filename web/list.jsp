<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- =====  BASIC PAGE NEEDS  ===== -->
    <meta charset="utf-8">
    <title>HealthCare</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/style0.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/jquery-ui.css">
</head>

<body>
<!-- =====  LODER  ===== -->

<div class="wrapper">
    <!-- =====  HEADER START  ===== -->
    <header id="header">
        <!-- 顶部开始 -->
        <!-- 导航栏固定样式 -->
        <div id="home" class="headorigin">
            <div class="headbrand">
            </div>
            <div class="headlocate">
                <ul>
                    <li><a href="${pageContext.servletContext.contextPath}/index.action">HOME</a></li>
                    <li><a href="javascript:void(0);">Classify</a></li>
                    <li><a href="javascript:void(0);">Focus</a></li>
                    <li><a href="javascript:void(0);">New Arrival</a></li>
                    <li><a href="javascript:void(0);">Myfavorite</a></li>
                    <li><a href="javascript:void(0);">Recommend</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/index.action">Blog</a></li>
                </ul>
            </div>
            <div class="headicon">
                <!-- 搜索框的实现 -->
                <ul>
                    <li><a href="user.html"><i class="fa fa-user-circle fa-2x hoverspin black"
                                               aria-hidden="true"></i></a></li>
                    <li><a href="cart.html"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
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
                            if ("${stauts.index}" == "0") row = row + "<ul class='row'>";
                            var item = "<li class='item product-layout-left mb_20'>" +
                                "<div class='product-list col-xs-4'>" +
                                "<div class='product-thumb'>" +
                                "<div class='image product-imageblock'>" +
                                "<a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                "<img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}'>" +
                                "</a></div></div></div>" +
                                "<div class='col-xs-8'><div class='caption product-detail'>" +
                                "<h6 class='product-name'><a href='#'>${ix.bookname}</a></h6>" +
                                "<div class='rating'>" + star + "</div><span class='price'>" +
                                "<span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span" +
                                "><span class='dates'>" + "${ix.booknum}" + "</span></span></div></div></li>";
                            if("${stauts.index}" == "0"||"${stauts.index}" == "1"||"${stauts.index}" == "2")row = row + item;
                            if ("${stauts.index}" == "2") row = row + "</ul>";
                            </c:forEach>
                            document.write(row);
                        </script>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-9 mtb_30 portfolio_container">
                <div class="food">
                    <!-- =====  BANNER STRAT  ===== -->
                    <div class="breadcrumb ptb_20">
                        <h1>Products</h1>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active">Products</li>
                        </ul>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <div class="category-page-wrapper mb_30">
                        <div class="col-xs-6 sort-wrapper">
                            <label class="control-label" for="input-sort">Sort By :</label>
                            <div class="sort-inner">
                                <select id="input-sort" class="form-control">
                                    <option value="ASC" selected="selected">Default</option>
                                    <option value="ASC">Name (A - Z)</option>
                                    <option value="DESC">Name (Z - A)</option>
                                    <option value="ASC">Price (Low &gt; High)</option>
                                    <option value="DESC">Price (High &gt; Low)</option>
                                    <option value="DESC">Love (5 - 1)</option>
                                </select>
                            </div>
                            <span><i class="fa fa-angle-down" aria-hidden="true"></i></span></div>
                        <div class="col-xs-4 page-wrapper">
                            <label class="control-label" for="input-limit">Show :</label>
                            <div class="limit">
                                <select id="input-limit" class="form-control">
                                    <option value="8" selected="selected">08</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="75">75</option>
                                    <option value="100">100</option>
                                </select>
                            </div>
                            <span><i class="fa fa-angle-down" aria-hidden="true"></i></span></div>
                        <div class="col-xs-2 text-right list-grid-wrapper">
                            <div class="btn-group btn-list-grid">
                                <button type="button" id="list-view" class="btn btn-default list-view"></button>
                                <button type="button" id="grid-view" class="btn btn-default grid-view active"></button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <script>
                            <c:forEach items="${tags}" var="ix" varStatus="stauts">
                            var item = "<div class='product-layout  product-grid  col-lg-3 col-md-4 col-sm-6 col-xs-12 ''><div class='item'><div class='product-thumb clearfix mb_30'><div class='image product-imageblock'> " +
                                "<a href='#''><img data-name='product_image' src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> " +
                                "<img src='${pageContext.servletContext.contextPath}/${ix.defaultimg}' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'>" +
                                "<a href='#'' title='Casual Shirt With Ruffle Hem'> " + "${ix.bookname}" + "</a></h6><div class='rating'>" + star + " </div>" +
                                "<span class='price'><span class='amount'><span class='currencySymbol'>$</span>" + "${ix.price}" + "</span>" +
                                "<span class='dates'>" + "${ix.booknum}" + "</span></span><p class='product-desc mt_20 mb_60'>" + "${ix.bookinfo}" + "</p><div class='button-group text-center'><div class='wishlist'>" +
                                "<a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div></div>";
                            document.write(item);
                            </c:forEach>
                        </script>
                    </div>
                    <div class="pagination-nav text-center mt_50">
                        <ul>
                            <script>
                                var item;
                                var tmp = parseInt("${nowpage}");
                                if(tmp > 1) tmp = tmp - 1;
                                item = "<li><a href=\"${pageContext.servletContext.contextPath}/list.action?mtype=${mtype}&nowpage="+tmp+"\"><i class=\"fa fa-angle-left\"></i></a></li>";
                                document.write(item)
                                var all = parseInt("${allpage}");
                                var now = parseInt("${nowpage}");
                                for(var i = 1; i <= all; ++i) {
                                    if(i == now) item = "<li class=\"active\"><a href=\"${pageContext.servletContext.contextPath}/list.action?mtype=${mtype}&nowpage="+i+"\">"+i+"</a></li>";
                                    else item = "<li><a href=\"${pageContext.servletContext.contextPath}/list.action?mtype=${mtype}&nowpage="+i+"\">"+i+"</a></li>";
                                    document.write(item)
                                }
                                tmp = parseInt("${nowpage}");
                                if(tmp < all) tmp = tmp + 1;
                                item = "<li><a href=\"${pageContext.servletContext.contextPath}/list.action?mtype=${mtype}&nowpage="+tmp+"\"><i class=\"fa fa-angle-right\"></i></a></li>";
                                document.write(item)
                            </script>
                            <%--<li><a href=""><i class="fa fa-angle-left"></i></a></li>--%>
                            <%--<li class="active"><a href="#">1</a></li>--%>
                            <%--<li><a href="#">2</a></li>--%>
                            <%--<li><a href="#">3</a></li>--%>
                            <%--<li><a href="#">4</a></li>--%>
                            <%--<li><a href="#">5</a></li>--%>
                            <%--<li><a href="#"><i class="fa fa-angle-right"></i></a></li>--%>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <!-- =====  CONTAINER END  ===== -->
    </div>
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
    <script src="${pageContext.servletContext.contextPath}/js/jQuery_v3.1.1.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/jquery.magnific-popup.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/custom0.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 500,
                values: [75, 300],
                slide: function (event, ui) {
                    $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                }
            });
            $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                " - $" + $("#slider-range").slider("values", 1));
        });
    </script>
    <!-- jQuery -->
    <script src="${pageContext.servletContext.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/plugins.js"></script>
    <script>
        var $container = $('.portfolio_container');
        $container.isotope({
            filter: '*',
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
</body>

</html>
