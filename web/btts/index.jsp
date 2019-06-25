<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.servletContext.contextPath}/btts/css/bootstrap.css" rel="stylesheet">
    <!-- FONT AWESOME CSS -->
    <link href="${pageContext.servletContext.contextPath}/btts/css/style.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="row pad-top text-center">
        <div class="col-md-6 col-md-offset-3 text-center">
            <h1> What have you done? </h1>
            <h5> Now Go Back Using Below LInk</h5>
            <span id="error-link"></span>
            <h2>! ERROR DECETED !</h2>
        </div>
    </div>
    <div class="row text-center">
        <div class="col-md-8 col-md-offset-2">
            <h3><i class="fa fa-lightbulb-o fa-5x"></i></h3>
            <a href="#" class="btn btn-primary">GO TO HOME PAGE</a>
            <br/><br/>
        </div>
    </div>
</div>
<!--Core JavaScript file  -->
<script src="${pageContext.servletContext.contextPath}/btts/js/jquery-1.10.2.js"></script>
<!--bootstrap JavaScript file  -->
<script src="${pageContext.servletContext.contextPath}/btts/js/bootstrap.js"></script>
<!--Count Number JavaScript file  -->
<script src="${pageContext.servletContext.contextPath}/btts/js/countUp.js"></script>
<!--Custom JavaScript file  -->
<script src="${pageContext.servletContext.contextPath}/btts/js/custom.js"></script>
</body>
</html>
