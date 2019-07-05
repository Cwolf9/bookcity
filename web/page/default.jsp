<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Cwolf9
  Date: 2019/06/19
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>editBlog</title>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/imgs/csust.jpg">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/editor.md-master/css/editormd.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
    <script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<h1>${adminname}, Edit you blog!</h1>
<form action="${pageContext.servletContext.contextPath}/submitBlog.action">
    <input type="text" name="AdId" value="${adminname}" style="border: none;" readonly>
<div id="test-editormd" style="margin-top: 20px;height: 470px;">
    <textarea name="blogContent" id="blogContent">${blogContent}</textarea>
</div>
<button class="btn btn-primary" type="submit" style="width: 104px;margin-left: 600px;margin-top: 10px;" onclick="sublog()">提交日志内容</button>
</form>
<a href="${pageContext.servletContext.contextPath}/person.do">
    <button class="btn btn-primary" type="button" style="width: 104px;margin-left: 600px;margin-top: 10px;" >回到首页</button>
</a>
<script src="${pageContext.servletContext.contextPath}/editor.md-master/editormd.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script>
    var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {
            width   : "90%",
            height  : 400,
            syncScrolling : "single",
            saveHTMLToTextarea : true, //设置可保存为html 获取的时候testEditor.getHtml();就可以了
            /*theme : "dark",*/  //设置主题，有默认
            /*previewTheme : "dark",*/
            /*editorTheme : "pastel-on-dark",*/
            searchReplace : true,
            emoji : true,
            taskList : true,
            tocm            : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "./php/upload.php",
            path    : "${pageContext.servletContext.contextPath}/editor.md-master/lib/"
        });
    });
</script>
<script>
</script>
</body>
</html>