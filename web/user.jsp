<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html>
<!--<![endif]-->

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
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/style0.css">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <style>
        /* CSS Document */
        .place {
            height: 40px;
            background: url(${pageContext.servletContext.contextPath}/images/righttop.gif) repeat-x;
        }

        /*seachform*/
        .seachform {
            height: 42px;
        }

        .seachform li {
            float: left;
            margin-right: 15px;
        }

        .seachform li label {
            padding-right: 10px;
            float: left;
            line-height: 32px;
        }

        .scinput {
            width: 180px;
            height: 32px;
            line-height: 32px;
            border-top: solid 1px #a7b5bc;
            border-left: solid 1px #a7b5bc;
            border-right: solid 1px #ced9df;
            border-bottom: solid 1px #ced9df;
            background: url(${pageContext.servletContext.contextPath}/images/inputbg.gif) repeat-x;
            text-indent: 10px;
            color: #999;
        }

        .scbtn {
            width: 85px;
            height: 35px;
            background: url(${pageContext.servletContext.contextPath}/images/btnbg.png) no-repeat center;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        select {
            background: url(${pageContext.servletContext.contextPath}/images/inputbg.gif) repeat-x;
            _background: none;
            _border: none;
            height: 32px;
            border-top: solid 1px #a7b5bc;
            border-left: solid 1px #a7b5bc;
            border-right: solid 1px #ced9df;
            border-bottom: solid 1px #ced9df;
            padding: 5px;
        }

        .tablelist {
            border: solid 1px #cbcbcb;
            width: 100%;
            clear: both;
        }

        .tablelist th {
            background: url(${pageContext.servletContext.contextPath}/images/th.gif) repeat-x;
            height: 34px;
            line-height: 34px;
            border-bottom: solid 1px #b6cad2;
            text-indent: 11px;
            text-align: left;
        }

        .tablelist td {
            line-height: 35px;
            text-indent: 11px;
            border-right: dotted 1px #c7c7c7;
        }

        .tablelink {
            color: #056dae;
        }

        .tablelist tbody tr.odd {
            background: #f5f8fa;
        }

        .tablelist tbody tr:hover {
            background: #e5ebee;
        }

        .bottomsubmit li {
            margin: 20px;
            float: right;
        }

        .food {
            position: relative !important;
        }

        .imgtd img {
            width: 100px;
        }
    </style>
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
<!-- =====  LODER  ===== -->
<div class="loder"></div>
<div class="wrapper">
    <!-- =====  HEADER START  ===== -->
    <header id="header">
        <!-- 顶部开始 -->
        <!-- 导航栏变化样式 -->
        <div class="headchange">
            <div class="headbrand">

            </div>
            <div class="headlocate">
                <ul>
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="index.html">Classify</a></li>
                    <li><a href="index.html">Focus</a></li>
                    <li><a href="index.html">New Arrival</a></li>
                    <li><a href="index.html">Myfavorite</a></li>
                    <li><a href="index.html">Recommend</a></li>
                    <li><a href="index.html">Blog</a></li>
                </ul>
            </div>
            <div class="headicon">
                <!-- 搜索框的实现 -->
                <ul>
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton" style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton" style="display: none;"></button>
                    <li><a href="cart.html"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                </ul>
                <div class="search">
                    <div class="search-overlay">
                        <!-- 关闭键 -->
                        <a href="javascript:void(0)" class="search-overlay-close"></a>
                        <div class="container">
                            <!-- 整页面搜索 -->
                            <form role="search" id="searchform" action="search" method="get">
                                <label class="h5 normal search-input-label">Enter keywords To Search Entire
                                    Store</label>
                                <input value="" name="q" placeholder="Search here..." type="search">
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
        <!-- 导航栏变化样式 -->

        <!-- 导航栏固定样式 -->
        <div id="home" class="headorigin">
            <div class="headbrand"></div>
            <div class="headlocate">
                <ul>
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="index.html">Classify</a></li>
                    <li><a href="index.html">Focus</a></li>
                    <li><a href="index.html">New Arrival</a></li>
                    <li><a href="index.html">Myfavorite</a></li>
                    <li><a href="index.html">Recommend</a></li>
                    <li><a href="index.html">Blog</a></li>
                </ul>
            </div>
            <div class="headicon">
                <!-- 搜索框的实现 -->
                <ul>
                    <li><a onclick="regUser()"><i class="fa fa-user fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                    <button type="button" data-toggle="modal" data-target="#myModal2" id="regbutton" style="display: none;"></button>
                    <li><a onclick="userlogin()"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true"></i></a>${ptuname}</li>
                    <button type="button" data-toggle="modal" data-target="#myModal" id="ycbutton" style="display: none;"></button>
                    <li><a href="cart.html"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
                </ul>
                <div class="search">
                    <div class="search-overlay">
                        <!-- 关闭键 -->
                        <a href="javascript:void(0)" class="search-overlay-close"></a>
                        <div class="container">
                            <!-- 整页面搜索 -->
                            <form role="search" id="searchform" action="search" method="get">
                                <label class="h5 normal search-input-label">Enter keywords To Search Entire
                                    Store</label>
                                <input value="" name="q" placeholder="Search here..." type="search">
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
                        <button type="button" class="btn btn-default" data-dismiss="modal2">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="Register()">注册</button>
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
                            <div class="marquee"><span><i class="fa fa-circle" aria-hidden="true"></i>It's Sexual Health Week!</span>
                                <span><i class="fa fa-circle"
                                         aria-hidden="true"></i>Our 5 Tips for a Healthy Summer</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>Sugar health at risk?</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>The Olay Ranges - What do they do?</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>Body fat - what is it and why do we need it?</span>
                                <span><i class="fa fa-circle" aria-hidden="true"></i>Can a pillow help you to lose weight?</span>
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
                            <ul class="nav  main-navigation collapse in portfolio_filter">
                                <li><a href="#" data-filter="*">BOOK</a></li>
                                <li><a href="#" data-filter=".jxtz">中国名著</a></li>
                                <li><a href="#" data-filter=".food">外国名著</a></li>
                                <li><a href="#" data-filter=".man">历史</a></li>
                                <li><a href="#" data-filter=".ss">文学</a></li>
                                <li><a href="#" data-filter=".daily">小说</a></li>
                                <li><a href="#">散文</a></li>
                                <li><a href="#">传记</a></li>
                                <li><a href="#">经济类</a></li>
                                <li><a href="#">科技类</a></li>
                                <li><a href="#">玄幻</a></li>
                                <li><a href="#">言情</a></li>
                                <li><a href="#">畅销</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-9 mtb_30 portfolio_container">
                <div class="food">
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
                            var item = "<tr class='odd'><td><input name='checkItem' type='checkbox' value='' /></td>" +
                                "<td class='imgtd'><img src='${ix.imgs}'/></td><td>" + "${ix.bookname}" + "</td>" +
                                "<td>" + "${ix.tags}" + "</td><td>" + "${ix.booknum}" + "<i class=\"fa fa-minus  hoverspin black\"></i>\n" +
                                "    <i class=\"fa fa-plus  hoverspin black\"></i></td>" +
                                "<td>¥" + "${ix.allprice}" + "</td>" +
                                "<td><a href='#' class='tablelink'>删除</a></td></tr>";
                            document.write(item);
                            </c:forEach>
                        </script>
                    </table>
                    <div class="bottomsubmit">
                        <ul>
                            <li><input type="submit"/></li>
                            <li><span>总价格：</span><span>接口</span></li>
                            <li><span>总件数：</span><span>接口</span></li>
                        </ul>
                    </div>
                </div>
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
<a id="scrollup">Scroll</a>
<script src="${pageContext.servletContext.contextPath}/js/jQuery_v3.1.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.magnific-popup.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/custom0.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery-ui.js"></script>
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
        var url = "${pageContext.servletContext.contextPath}/register.do?account=" + $('#inputExample1').val()+"&pwd="+$('#inputExample2').val()+"&username="+$('#inputExample3').val()+"$sex=";
        if(document.getElementById("sex2").checked) url = url + "女";
        else url = url + "男";
        location.href = url;
    }
    function changeCode(o) {
        //修改img的src的值
        o.src = "${pageContext.servletContext.contextPath}/code.do?"+new Date().getTime();
    }
</script>
</body>
</html>
