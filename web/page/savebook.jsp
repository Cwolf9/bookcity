<%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/26
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加书籍</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.css"/>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <style>
        .myright_bar {
            margin: 0 auto;
        }
    </style>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="page1"></div>
<script>
    $("#page1").load("${pageContext.servletContext.contextPath}/page/top.jsp");
</script>
<div class="myright_bar">
    <div style="height:50px;">
        <input type="text" style="display: none;" id = "mybook" value="-1">
    </div>
    <form id="saveForm" class="form-horizontal" action="${pageContext.servletContext.contextPath}/savebook.do"
          method="post">
        <div class="form-group">
            <label for="bowner" class="col-sm-2">你的账号</label>
            <div class="col-md-6 col-sm-10">
                <input type="text" class="form-control" name="bowner" id="bowner" placeholder="你的账号" readonly value="${u.adminacc}">
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
                <input type="text" class="form-control" name="tags" id="tags" placeholder="标签(以逗号分割)">
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
            url: '${pageContext.servletContext.contextPath}/uploadbookimgs.do?book='+document.getElementById('mybook').getAttribute("book") // 文件上传提交地址
        });
</script>
</body>
</html>

