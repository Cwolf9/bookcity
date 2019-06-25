<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Free Bootstrap Error Template</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.servletContext.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- FONT AWESOME CSS -->
    <link href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" rel="stylesheet" />
    <!--GOOGLE FONT -->
 <link href='http://fonts.googleapis.com/css?family=Nova+Flat' rel='stylesheet' type='text/css'>
    <style>
        body {
            font-family: 'Nova Flat', cursive;
            background-color: #B396FF;
            color: #fff;
        }
        .pad-top {
            padding-top:60px;
        }
        .text-center {
            text-align:center;
        }
        #error-link {
            font-size:150px;
            padding:10px;
        }
    </style>
</head>
<body>
    
   
    <div class="container">
      
          <div class="row pad-top text-center">
                 <div class="col-md-6 col-md-offset-3 text-center">
                  <h1>  What have you done? </h1>
                   <h5> Now Go Back Using Below LInk</h5> 
              <span id="error-link"></span>
                     <h2>! ERROR DECETED !</h2>
</div>
        </div>

            <div class="row text-center">
                 <div class="col-md-8 col-md-offset-2">
                     
                     <h3> <i  class="fa fa-lightbulb-o fa-5x"></i> </h3>
               <a href="#" class="btn btn-primary">GO TO HOME PAGE</a> 
             <br/><br/>
                 </div>
        </div>

    </div>
    <!-- /.container -->
  
  
    <!--Core JavaScript file  -->
    <script src="${pageContext.servletContext.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--bootstrap JavaScript file  -->
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.js"></script>
     <!--Count Number JavaScript file  -->
    <script src="${pageContext.servletContext.contextPath}/js/countUp.js"></script>
       <!--Custom JavaScript file  -->
    <script src="${pageContext.servletContext.contextPath}/js/custom.js"></script>
</body>
</html>
