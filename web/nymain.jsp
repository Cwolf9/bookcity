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
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="css/style0.css">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
  <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
  <style>
    @charset "utf-8";
    /* CSS Document */
    .place{height:40px; background:url(../images/righttop.gif) repeat-x;}

    /*个人信息*/
    .information{ position: relative !important;}
    .information-right{
      float:right;
      background-color: black;
      margin-top: 60px;
      margin-right: 100px;
      height:150px;
      width:150px;
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
      margin-left: 800px;
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
    .scbtn{width:85px;height:35px; background:url(../images/btnbg.png) no-repeat center; font-size:14px;font-weight:bold;color:#fff; cursor:pointer;border-radius:3px; }
    select{background:url(../images/inputbg.gif) repeat-x;_background:none;_border:none;height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;padding:5px;}
    .tablelist{border:solid 1px #cbcbcb; width:100%; clear:both;}
    .tablelist th{background:url(../images/th.gif) repeat-x; height:34px; line-height:34px; border-bottom:solid 1px #b6cad2; text-indent:11px; text-align:left;}
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
      <div class="headlocate"><ul>
        <li><a href="index.html">HOME</a></li>
        <li><a href="index.html">Classify</a></li>
        <li><a href="index.html">Focus</a></li>
        <li><a href="index.html">New Arrival</a></li>
        <li><a href="index.html">Myfavorite</a></li>
        <li><a href="index.html">Recommend</a></li>
        <li><a href="index.html">Blog</a></li>
      </ul></div>
      <div class="headicon">
        <!-- 搜索框的实现 -->
        <ul>
          <li><a href="user.html"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true" ></i></a></li>
          <li><a href="cart.html"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
        </ul>
        <div class="search">
          <div class="search-overlay">
            <!-- 关闭键 -->
            <a href="javascript:void(0)" class="search-overlay-close"></a>
            <div class="container">
              <!-- 整页面搜索 -->
              <form role="search" id="searchform" action="search" method="get">
                <label class="h5 normal search-input-label">Enter keywords To Search Entire Store</label>
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
    <!-- 导航栏变化样式 -->
    <!-- 导航栏固定样式 -->
    <div id="home" class="headorigin">
      <div class="headbrand">

      </div>
      <div class="headlocate"><ul>
        <li><a href="index.html">HOME</a></li>
        <li><a href="index.html">Classify</a></li>
        <li><a href="index.html">Focus</a></li>
        <li><a href="index.html">New Arrival</a></li>
        <li><a href="index.html">Myfavorite</a></li>
        <li><a href="index.html">Recommend</a></li>
        <li><a href="index.html">Blog</a></li>
      </ul></div>
      <div class="headicon">
        <!-- 搜索框的实现 -->
        <ul>
          <li><a href="user.html"><i class="fa fa-user-circle fa-2x hoverspin black" aria-hidden="true" ></i></a></li>
          <li><a href="cart.html"><i class="fa fa-book fa-2x hoverspin black" aria-hidden="true"></i></a></li>
        </ul>
        <div class="search">
          <div class="search-overlay">
            <!-- 关闭键 -->
            <a href="javascript:void(0)" class="search-overlay-close"></a>
            <div class="container">
              <!-- 整页面搜索 -->
              <form role="search" id="searchform" action="search" method="get">
                <label class="h5 normal search-input-label">Enter keywords To Search Entire Store</label>
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
    <!-- 顶部结束 -->
    <!-- 目录和推荐栏 -->
    <div class="header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-sm-4 col-md-4 col-lg-3">
            <div id="classify" class="category">
              <div class="menu-bar" data-target="#category-menu,#category-menu-responsive" data-toggle="collapse" aria-expanded="true" role="button">
                <h4 class="category_text">Top category</h4>
                <span class="i-bar"><i class="fa fa-bars"></i></span></div>
            </div>
          </div>
          <div class="col-sm-8 col-md-8 col-lg-9">
            <div class="header-bottom-right offers">
              <div class="marquee"><span><i class="fa fa-circle" aria-hidden="true"></i>It's Sexual Health Week!</span>
                <span><i class="fa fa-circle" aria-hidden="true"></i>Our 5 Tips for a Healthy Summer</span>
                <span><i class="fa fa-circle" aria-hidden="true"></i>Sugar health at risk?</span>
                <span><i class="fa fa-circle" aria-hidden="true"></i>The Olay Ranges - What do they do?</span>
                <span><i class="fa fa-circle" aria-hidden="true"></i>Body fat - what is it and why do we need it?</span>
                <span><i class="fa fa-circle" aria-hidden="true"></i>Can a pillow help you to lose weight?</span></div>
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
      <!-- 左侧 -->
      <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 ">

        <div id="category-menu" class="navbar collapse in  mb_40" aria-expanded="true" style="" role="button">
          <div class="nav-responsive">
            <div class="section" id="projects">
              <ul class="nav  main-navigation collapse in portfolio_filter"style="height:600px">
                <li style="font-size:15px; height:66px"><a href="#" data-filter=".information">个人信息</a></li>
                <li style="font-size:15px; height:66px"><a href="#" data-filter=".cart">购物车</a></li>
                <li style="font-size:15px; height:66px" ><a href="#" data-filter=".indent">我的订单</a></li>
                <li style="font-size:15px; height:66px" ><a href="#" data-filter=".blog">个人博客</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-8 col-md-8 col-lg-9 mtb_30 portfolio_container">
        <!-- 个人信息 -->
        <div class="information">
          <div class="information-right"><img src="" alt=""><input type="file"></div>
          <div class="information-left">
            <ul>
              <li>用户昵称：接口</li>
              <li>用户密码：接口</li>
              <li>用户性别：接口</li>
              <li>电话号码：接口</li>
              <li>默认地址：接口</li>
              <div class="icon"><input type="submit" value="修改资料"/></div>
            </ul>
          </div>
        </div>
        <!-- 个人信息 -->
        <!-- 购物车 -->
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
              var imgs=["06.png"];
              var name=["书本"];
              var tag=["tag"];
              var prices=["price"];
              var number=["number"];var hang=4;
              for(var i=0;i<hang;i++){
                var item="<tr class='odd'><td><input name='checkItem' type='checkbox' value='' /></td><td class='imgtd'><img src='images/img"+imgs[0]+"'/></td><td>"+name[0]+"</td><td>"+tag[0]+"</td><td>"+prices[0]+"</td><td>¥"+number[0]+"</td><td><a href='#' class='tablelink'>删除</a></td></tr>";
                document.write(item);}

            </script>

          </table>
          <div class="bottomsubmit">
            <ul>
              <li><input type="submit" /></li>
              <li><span>总价格：</span><span>接口</span></li>
              <li><span>总件数：</span><span>接口</span></li>
            </ul>
          </div>
        </div>
        <!-- 购物车结束    -->
        <!-- 订单开始 -->
        <div class="indent">
          <div class="indent-item">
            <table class="tablelist">
              <tr>
                <th>订单编号</th>
                <th>接口</th>
                <!-- <th>商品类别</th>
                <th>数量(件）</th> -->
                <th>物流编号）</th>
                <th>接口</th>
              </tr>
              <script>
                var imgs=["06.png"];
                var name=["书本"];
                var tag=["tag"];
                var prices=["price"];
                var number=["number"];var hang=2;
                for(var i=0;i<hang;i++){
                  var item="<tr class='odd'><td class='imgtd'><img src='images/img"+imgs[0]+"'/></td><td>"+name[0]+"</td><td>"+tag[0]+"</td><td>"+prices[0]+"</td><td>¥"+number[0]+"</td><td><a href='#' class='tablelink'>删除</a></td></tr>";
                  document.write(item);}

              </script>

            </table>
            <div class="bottomsubmitnone">
              <ul>
                <li><input type="submit" /></li>
                <li><span>总价格：</span><span>接口</span></li>
                <li><span>总件数：</span><span>接口</span></li>
              </ul>
            </div>
          </div>
          <div class="indent-item">
            <table class="tablelist">
              <tr>
                <th>订单编号</th>
                <th>接口</th>
                <!-- <th>商品类别</th>
                <th>数量(件）</th> -->
                <th>物流编号）</th>
                <th>接口</th>
              </tr>
              <script>
                var imgs=["06.png"];
                var name=["书本"];
                var tag=["tag"];
                var prices=["price"];
                var number=["number"];var hang=2;
                for(var i=0;i<hang;i++){
                  var item="<tr class='odd'><td class='imgtd'><img src='images/img"+imgs[0]+"'/></td><td>"+name[0]+"</td><td>"+tag[0]+"</td><td>"+prices[0]+"</td><td>¥"+number[0]+"</td><td><a href='#' class='tablelink'>删除</a></td></tr>";
                  document.write(item);}

              </script>

            </table>
            <div class="bottomsubmitnone">
              <ul>
                <li><input type="submit" /></li>
                <li><span>总价格：</span><span>接口</span></li>
                <li><span>总件数：</span><span>接口</span></li>
              </ul>
            </div>
          </div>
          <div class="indent-item">
            <table class="tablelist">
              <tr>
                <th>订单编号</th>
                <th>接口</th>
                <!-- <th>商品类别</th>
                <th>数量(件）</th> -->
                <th>物流编号）</th>
                <th>接口</th>
              </tr>
              <script>
                var imgs=["06.png"];
                var name=["书本"];
                var tag=["tag"];
                var prices=["price"];
                var number=["number"];var hang=2;
                for(var i=0;i<hang;i++){
                  var item="<tr class='odd'><td class='imgtd'><img src='images/img"+imgs[0]+"'/></td><td>"+name[0]+"</td><td>"+tag[0]+"</td><td>"+prices[0]+"</td><td>¥"+number[0]+"</td><td><a href='#' class='tablelink'>删除</a></td></tr>";
                  document.write(item);}

              </script>

            </table>
            <div class="bottomsubmitnone">
              <ul>
                <li><input type="submit" /></li>
                <li><span>总价格：</span><span>接口</span></li>
                <li><span>总件数：</span><span>接口</span></li>
              </ul>
            </div>
          </div>

        </div>
        <!-- 订单 -->



      </div>
    </div>

  </div>
  <!-- =====  CONTAINER END  ===== -->
  <!-- =====  FOOTER START  ===== -->
  <div class="footer pt_60">
    <div class="container">
      <div class="row">
        <div class="col-md-3 footer-block">
          <div class="content_footercms_right">
            <div class="footer-contact">
              <div class="footer-logo mb_40"> <a href="index.html"> <img src="images/footer-logo.png" alt="HealthCare"> </a> </div>
              <ul>
                <li>B-14 Collins Street West Victoria 2386</li>
                <li>(+123) 456 789 - (+024) 666 888</li>
                <li>Contact@yourcompany.com</li>
              </ul>
              <div class="social_icon">
                <ul>
                  <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="#"><i class="fa fa-google"></i></a></li>
                  <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="#"><i class="fa fa-rss"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-2 footer-block">
          <h6 class="footer-title ptb_20">Categories</h6>
          <ul>
            <li><a href="#">Medicines</a></li>
            <li><a href="#">Healthcare</a></li>
            <li><a href="#">Mother & Baby</a></li>
            <li><a href="#">Vitamins</a></li>
            <li><a href="#">Toiletries</a></li>
            <li><a href="#">Skincare</a></li>
          </ul>
        </div>
        <div class="col-md-2 footer-block">
          <h6 class="footer-title ptb_20">Information</h6>
          <ul>
            <li><a href="#">Specials</a></li>
            <li><a href="#">New Products</a></li>
            <li><a href="#">Best Sellers</a></li>
            <li><a href="#">Our Stores</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="#">About Us</a></li>
          </ul>
        </div>
        <div class="col-md-2 footer-block">
          <h6 class="footer-title ptb_20">My Account</h6>
          <ul>
            <li><a href="#">Checkout</a></li>
            <li><a href="#">My Account</a></li>
            <li><a href="#">My Orders</a></li>
            <li><a href="#">My Credit Slips</a></li>
            <li><a href="#">My Addresses</a></li>
            <li><a href="#">My Personal Info</a></li>
          </ul>
        </div>
        <div class="col-md-3">
          <h6 class="ptb_20">SIGN UP OUR NEWSLETTER</h6>
          <p class="mt_10 mb_20">For get offers from our favorite brands & get 20% off for next </p>
          <div class="form-group">
            <input class="mb_20" type="text" placeholder="Enter Your Email Address">
            <button class="btn">Subscribe</button>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-bottom mt_60 ptb_10">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="copyright-part">Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
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
<script src="js/jquery-ui.js"></script>

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
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
  function selectAll(){
    var items=document.getElementsByName("checkItem");
    var checkAll=document.getElementById("checkAll");
    var checkOther=document.getElementById("checkOther");
    checkOther.checked=false;
    for(var i=0;i<items.length;i++){
      items[i].checked=checkAll.checked;
    }
  }
  //反选
  function selectOther(){
    var items=document.getElementsByName("checkItem");
    var checkAll=document.getElementById("checkAll");
    var checkOther=document.getElementById("checkOther");
    checkAll.checked=false;
    for(var i=0;i<items.length;i++){
      items[i].checked=!items[i].checked;
    }
  }
</script>

</body>

</html>
