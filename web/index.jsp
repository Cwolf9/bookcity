﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
  <!-- =====  BASIC PAGE NEEDS  ===== -->
  <meta charset="utf-8">
  <title>Home</title>
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="css/style0.css">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">

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
              <input type="email" name="email-popup" id="email-popup" placeholder="Enter Your Email" class="form-control input-lg" required />
              <button type="submit" class="btn btn-default btn-lg" id="email-popup-submit">Subscribe</button>
              <label class="checkme">
                <input type="checkbox" value="" id="checkme" />Dont show again</label>
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
             <div class="headbrand">
               
             </div>
             <div class="headlocate"><ul>
                 <li><a href="#home">HOME</a></li>
                 <li><a href="#classify">Classify</a></li>
                 <li><a href="#focus">Focus</a></li>
                 <li><a href="#newarrival">New Arrival</a></li>
                 <li><a href="#myfavorite">Myfavorite</a></li>
                 <li><a href="#recommend">Recommend</a></li>
                 <li><a href="#blog">Blog</a></li>
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
                 <li><a href="#home">HOME</a></li>
                 <li><a href="#classify">Classify</a></li>
                 <li><a href="#focus">Focus</a></li>
                 <li><a href="#newarrival">New Arrival</a></li>
                 <li><a href="#myfavorite">Myfavorite</a></li>
                 <li><a href="#recommend">Recommend</a></li>
                 <li><a href="#blog">Blog</a></li>
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
                 <li><a href="index.jsp" >HOME</a></li>
                <li><a href="listlishi.html" >历史书籍</a></li>
                <li><a href="#" >经济书籍</a></li>
                <li><a href="#" >历史</a></li>
                <li><a href="#">文学</a></li>
                <li><a href="#" >小说</a></li>
                <li><a href="#">散文</a></li>
                <li><a href="#">传记</a></li>
                <li><a href="#">经济类</a></li>
                <li><a href="#">科技类</a></li>
                <li><a href="#">玄幻</a></li>
                <li><a href="#">言情</a></li>
                <li><a href="#">阅读器</a></li>
              </ul>
            </div>
            </div>
          </div>
          <!-- 导航栏 -->
          <!-- 左侧海报图功能图 -->
          <div class="left_banner left-sidebar-widget mt_30 mb_50"> <a href="#"><img src="images/left1.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
          <div class="left-cms left-sidebar-widget mb_50">
            <ul>
              <li>
                <div class="feature-i-left ptb_40">
                  <div class="icon-right Shipping"></div>
                  <a href=""><h6>物流查询</h6></a>
                  <p>Free delivery worldwide</p>
                </div>
              </li>
              <li>
                <div class="feature-i-left ptb_40">
                  <div class="icon-right Order"></div>
                  <a href=""><h6>与我联系</h6></a>
                  <p>Hours : 8am - 11pm</p>
                </div>
              </li>
              <li>
                <div class="feature-i-left ptb_40">
                  <div class="icon-right Save"></div>
                  <a href=""><h6>购物车界面</h6></a>
                  <p>For All Spices & Herbs</p>
                </div>
              </li>
            </ul>
          </div>
          <!-- 左侧海报图功能图           -->
          <!-- 栏目预订 -->
          <div id="myfavorite" class="left-special left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">栏目预订</h2></div>
              <div id="left-special" class="owl-carousel">
                <!-- js接口 -->
                <script>
                var imgs = ["4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg"];
                var alimgs = ["4-1.jpg", "4-1.jpg", "4-1.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg", "4.jpg"];
                var star = "<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                var prices = ["111"];
                var dates = ["333"];
                var lie = 3;
                var hang = 3;
                for (var zyx = 0; zyx < lie; zyx++) {
                  var row = "<ul class='row'>";
                  for (var i = 0; i < hang; i++) {
                    var item = "<li class='item product-layout-left mb_20'><div class='product-list col-xs-4'><div class='product-thumb'><div class='image product-imageblock'><a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product" + imgs[i] + "'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product" + alimgs[i] + "'></a></div></div></div><div class='col-xs-8'><div class='caption product-detail'><h6 class='product-name'><a href='#'>Latin literature from 45 BC, making it over old.</a></h6><div class='rating'>" + star + "</div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>" + prices[i] + "</span><span class='dates'>" + dates[i] + "</span></span></div></div></li>";
                    row = row + item;
                  }
                  row = row + "</ul>";
                  document.write(row);
                }</script>
              </div>
            </div>
            <!-- 栏目预订 -->
          <div class="left_banner left-sidebar-widget mb_50"> <a href="#"><img src="images/left2.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
          <!-- 博客推荐界面适当的时候不要 -->
          <div class="Testimonial left-sidebar-widget mb_50">
            <div id="blog" class="heading-part mb_20 ">
              <h2 class="main_title">BLOG</h2>
            </div>
            <div class="client owl-carousel text-center pt_10">
              <div class="item client-detail">
                <div class="client-avatar"> <img alt="" src="images/user1.jpg"> </div>
                <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                <div class="client-designation mb_10">php Developer</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
              </div>
              <div class="item client-detail">
                <div class="client-avatar"> <img alt="" src="images/user2.jpg"> </div>
                <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                <div class="client-designation mb_10">php Developer</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
              </div>
              <div class="item client-detail">
                <div class="client-avatar"> <img alt="" src="images/user3.jpg"> </div>
                <div class="client-title  mt_30"><strong>joseph Lui</strong></div>
                <div class="client-designation mb_10">php Developer</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>Lorem ipsum dolor sit amet, volumus oporteat his at sea in Rem ipsum dolor sit amet, sea in odio ..</p>
              </div>
            </div>
          </div>
          <!-- 标签索引 -->
          <div class="Tags left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">Tags</h2>
            </div>
            <ul>
              <li><a href="#">business</a></li>
              <li><a href="#">clean</a></li>
              <li><a href="#">corporate</a></li>
              <li><a href="#">blog</a></li>
              <li><a href="#">creative</a></li>
              <li><a href="#">ecommerce</a></li>
              <li><a href="#">modern</a></li>
              <li><a href="#">portfolio</a></li>
              <li><a href="#">retina</a></li>
              <li><a href="#">multipurpose</a></li>
              <li><a href="#">photography</a></li>
              <li><a href="#">responsive</a></li>
            </ul>
          </div><!-- 博客推荐界面适当的时候不要 -->
        </div>
        <!-- 左边 -->

        <!-- 右边 -->
        <div id="column-right" class="col-sm-8 col-md-8 col-lg-9 mtb_30">
        <!-- 焦点图         -->
          <div class="banner"id="focus">
            <div class="main-banner owl-carousel">
              <div class="item"><a href="#"><img src="images/main_banner1.jpg" alt="Main Banner" class="img-responsive" /></a></div>
              <div class="item"><a href="#"><img src="images/main_banner1.jpg" alt="Main Banner" class="img-responsive" /></a></div>
            </div>
          </div>
          <!-- 焦点图 -->
          <!-- 副焦点图 -->
          <div class="row">
            <div class="cms_banner mt_10">
              <div class="col-xs-6 col-sm-12 col-md-6 mt_20">
                <div id="subbanner1" class="sub-hover"> <a href="#"><img src="images/sub1.jpg" alt="Sub Banner1" class="img-responsive"></a>
                  <div class="bannertext">
                    <h2>Full HD Camera</h2>
                    <p class="mt_10">Different Resolutions</p>
                  </div>
                </div>
              </div>
              <div class="col-xs-6 col-sm-12 col-md-6 mt_20">
                <div id="subbanner2" class="sub-hover"> <a href="#"><img src="images/sub2.jpg" alt="Sub Banner2" class="img-responsive"></a>
                  <div class="bannertext">
                    <h2>smart watches</h2>
                    <p class="mt_10">Most Popular Brands</p>
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
              <li class="active"> <a href="#hopsort" data-toggle="tab">HopSort</a> </li>
              <li><a href="#datesort" data-toggle="tab">DateSort</a> </li>
              <li><a href="#commentsort" data-toggle="tab">CommentSort</a> </li>
            </ul>
            <!-- 书本展示栏 -->
            <div class="tab-content clearfix box">
              <!-- 按照人气排名 -->
              <div class="tab-pane active" id="hopsort">
                <div class="hopsort owl-carousel">
                 <script>
                    var imgs=["1.jpg","2.jpg","3.jpg","3.jpg","1.jpg","2.jpg","3.jpg","3.jpg"];
                    var alimgs=["product1-1.jpg","product2-1.jpg","product3-1.jpg","product3-1.jpg","product1-1.jpg","product2-1.jpg","product3-1.jpg","product3-1.jpg"];
                    var context=["Latin literature from 45 BC, making it over old."];
                    var prices=["111"];
                     var dates=["444"];
                    var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                
                    for(var i=0;i<imgs.length;i+=2){
                    var item="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/product"+imgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[0]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[0]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                    var item1="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/product"+imgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[i]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                  var productgrid="<div class='product-grid'>"+item+item1+"</div>";
                  document.write(productgrid);}
                  
                   
                    </script> 
                  </div>
                    </div>
              <!-- 人气end -->
             
              <!-- 按照时间排名 -->
              <div class="tab-pane" id="datesort">
                <div class="datesort owl-carousel">
                  <script>
                    var imgs=["product2.jpg","product2.jpg","product3.jpg","product4.jpg","product5.jpg","product6.jpg","product7.jpg","product8.jpg","product9.jpg","product10.jpg"];
                    var alimgs=["product3-1.jpg","product2-1.jpg","product3-1.jpg","product4-1.jpg","product5-1.jpg","product6-1.jpg","product7-1.jpg","product8-1.jpg","product9-1.jpg","product10-1.jpg"];
                    var context=["Latin literature from 45 BC, making it over old."];
                    var prices=["222"];
                    var dates=["444"];
                    var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                
                    for(var i=0;i<imgs.length;i+=2){
                    var item="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/"+imgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[0]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[0]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                    var item1="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/"+imgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[i]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                  var productgrid="<div class='product-grid'>"+item+item1+"</div>";
                  document.write(productgrid);}
                  
                   
                    </script> 
                  </div>
                </div>
              <!-- 时间end -->
              <!-- 按照评价排名 -->
              <div class="tab-pane" id="commentsort">
                <div class="commentsort owl-carousel">
                  <script>
                    var imgs=["product3.jpg","product2.jpg","product3.jpg","product3.jpg","product1.jpg","product2.jpg","product3.jpg","product3.jpg"];
                    var alimgs=["product3-1.jpg","product2-1.jpg","product3-1.jpg","product3-1.jpg","product1-1.jpg","product2-1.jpg","product3-1.jpg","product3-1.jpg"];
                    var context=["Latin literature from 45 BC, making it over old."];
                    var prices=["333"];
                     var dates=["1991.10.7"];
                    var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                
                    for(var i=0;i<imgs.length;i+=2){
                    var item="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/"+imgs[i]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[0]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[0]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                    var item1="<div class='item'><div class='product-thumb '><div class='image product-imageblock'> <a href='#''><img data-name='product_image' src='images/product/"+alimgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> <img src='images/product/"+imgs[i+1]+"' alt='iPod Classic' title='iPod Classic' class='img-responsive'> </a> </div><div class='caption product-detail text-left'><h6 data-name='product_name' class='product-name mt_20'><a href='#'' title='Casual Shirt With Ruffle Hem'> "+context[i]+"</a></h6><div class='rating'>"+star+" </div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span><div class='button-group text-center'><div class='wishlist'><a href='#'><span>wishlist</span></a></div><div class='quickview'><a href='#'><span>Quick View</span></a></div><div class='compare'><a href='#'><span>Compare</span></a></div><div class='add-to-cart'><a href='#'><span>Add to cart</span></a></div></div></div></div></div>";
                  var productgrid="<div class='product-grid'>"+item+item1+"</div>";
                  document.write(productgrid);}
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
                <div id="subbanner3" class="banner sub-hover"> <a href="#"><img src="images/sub3.jpg" alt="Sub Banner3" class="img-responsive"></a> </div>
              </div>
            </div>
          </div>
          <!-- 横向海报图 -->
          <!-- 每日推荐畅销书本 -->
          <div id="sale-product">
            <div id="recommend" class="heading-part mb_20 ">
              <h2 class="main_title">Daily recommendation</h2>
            </div>
            <div class="Specials owl-carousel">
              <div class="item product-layout product-list">
                <div class="product-thumb">
                  <div class="image product-imageblock"> <a href="#"> <img data-name="product_image" src="images/product/product8.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="images/product/product8-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                  <div class="caption product-detail text-left">
                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">Latin literature from 45 BC, making it over old.</a></h6>
                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                    </span>
                    <p class="product-desc mt_20"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.Cover Flow. Browse through your music collection by flipping..</p>
                    <div class="timer mt_80">
                      <div class="days"></div>
                      <div class="hours"></div>
                      <div class="minutes"></div>
                      <div class="seconds"></div>
                    </div>
                    <div class="button-group text-center">
                      <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                      <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                      <div class="compare"><a href="#"><span>Compare</span></a></div>
                      <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
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
                <div id="subbanner4" class="banner sub-hover"> <a href="#"><img src="images/sub4.jpg" alt="Sub Banner4" class="img-responsive"></a>
                  <div class="bannertext"> </div>
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
                var imgs=["4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var alimgs=["4-1.jpg","4-1.jpg","4-1.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                var prices=["111"];
                var dates=["333"];
                var lie=3;var hang=3;
                for(var zyx=0;zyx<lie;zyx++){
                  var row="<ul class='row'>";
                  for(var i=0;i<hang;i++){
                    var item="<li class='item product-layout-left mb_20'><div class='product-list col-xs-4'><div class='product-thumb'><div class='image product-imageblock'><a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+imgs[i]+"'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+alimgs[i]+"'></a></div></div></div><div class='col-xs-8'><div class='caption product-detail'><h6 class='product-name'><a href='#'>Latin literature from 45 BC, making it over old.</a></h6><div class='rating'>"+star+"</div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span></div></div></li>";
                    row=row+item;}
                    row=row+"</ul>";document.write(row);}
                </script>
              </div>
            </div>
            <div class="col-md-4">
              <div class="heading-part mb_20 ">
                <h2 class="main_title">教育</h2>
              </div>
              <div id="bests-pro" class="owl-carousel">
               <!-- js接口 -->
                <script>
                var imgs=["4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var alimgs=["4-1.jpg","4-1.jpg","4-1.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                var prices=["111"];
                var dates=["333"];
                var lie=3;var hang=3;
                for(var zyx=0;zyx<lie;zyx++){
                  var row="<ul class='row'>";
                  for(var i=0;i<hang;i++){
                    var item="<li class='item product-layout-left mb_20'><div class='product-list col-xs-4'><div class='product-thumb'><div class='image product-imageblock'><a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+imgs[i]+"'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+alimgs[i]+"'></a></div></div></div><div class='col-xs-8'><div class='caption product-detail'><h6 class='product-name'><a href='#'>Latin literature from 45 BC, making it over old.</a></h6><div class='rating'>"+star+"</div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span></div></div></li>";
                    row=row+item;}
                    row=row+"</ul>";document.write(row);}
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
                var imgs=["4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var alimgs=["4-1.jpg","4-1.jpg","4-1.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg","4.jpg"];
                var star="<span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-1x'></i></span> <span class='fa fa-stack'><i class='fa fa-star-o fa-stack-1x'></i><i class='fa fa-star fa-stack-x'></i></span>";
                var prices=["111"];
                var dates=["333"];
                var lie=3;var hang=3;
                for(var zyx=0;zyx<lie;zyx++){
                  var row="<ul class='row'>";
                  for(var i=0;i<hang;i++){
                    var item="<li class='item product-layout-left mb_20'><div class='product-list col-xs-4'><div class='product-thumb'><div class='image product-imageblock'><a href='#'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+imgs[i]+"'><img class='img-responsive' title='iPod Classic' alt='iPod Classic' src='images/product/product"+alimgs[i]+"'></a></div></div></div><div class='col-xs-8'><div class='caption product-detail'><h6 class='product-name'><a href='#'>Latin literature from 45 BC, making it over old.</a></h6><div class='rating'>"+star+"</div><span class='price'><span class='amount'><span class='currencySymbol'>$</span>"+prices[i]+"</span><span class='dates'>"+dates[i]+"</span></span></div></div></li>";
                    row=row+item;}
                    row=row+"</ul>";document.write(row);}
                </script>
              </div>
            </div>
          </div>
          <!-- 畅销展示end -->
          <!-- 博客展示不显示。。。 -->
          <!-- <div id="Blog" class="mt_40">
            <div class="heading-part mb_20 show">
              <h2 class="main_title">Latest from the Blog</h2>
            </div>
            <div class="blog-contain box">
              <div class="blog owl-carousel "> -->
                <!-- js接口
                <script>
                var imgs=["01.jpg","01.jpg","01.jpg","01.jpg","01.jpg","01.jpg"];
                var href=["#"];
                var title=["Unknown printer took a galley book."];var context=["Aliquam egestas pellentesque est. Etiam a orci Nulla id enim feugiat ligula ullamcorper scelerisque. Morbi eu luctus nisl."];
                var days=["111"];var months=["AUG"];var lie=6;
                for(var i=0;i<lie;i++){
                  var item="<div class='item'><div class='box-holder'><div class='thumb post-img'><a href='"+href[0]+"'><img src='images/blog/blog_img_"+imgs[bee]+"' alt='BOOKBLOG'></a></div><div class='post-info mtb_20 '><h6 class='mb_10 text-uppercase'><a href='#'>"+title[0]+"</a></h6><p>"+context[0]+"</p><div class='date-time'><div class='day'>"+days[0]+"</div><div class='month'>"+months[0]+"</div></div></div></div></div>";
                  document.write(item);}
                  </script>
              </div>
            </div> -->
            <!-- 博客展示end -->
          </div>
        </div>
        <!-- 右边结束 -->
      </div>
    </div>
    <!-- 中间框架end -->

    <!-- =====  FOOTER START  ===== -->
    <div class="footer pt_60">
      <div class="container">
        <div class="row">
          <div class="col-md-3 footer-block">
            <div class="content_footercms_right">
              <div class="footer-contact">
                <div class="footer-logo mb_40"> <a href="index.jsp"> <img src="images/footer-logo.png" alt="HealthCare"> </a> </div>
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
  <script src="js/jquery.js"></script>
  <script src="js/jQuery_v3.1.1.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.magnific-popup.js"></script>
  <script src="js/jquery.firstVisitPopup.js"></script>
  <script src="js/custom0.js"></script>

</body>

</html>