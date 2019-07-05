<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/zui/css/zui.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.css"/>
<style>
    .myright_bar {
        margin: 0 auto;
        height: 300px;
        width: 500px;
    }
</style>
<div class="myright_bar">
    <div style="height:50px;"></div>
    <div id='uploaderExample1' class="uploader" data-ride="uploader" data-url="your/file/upload/url">
        <div class="uploader-message text-center">
            <div class="content"></div>
            <button type="button" class="close">×</button>
        </div>
        <div class="uploader-files file-list file-list-grid"></div>
        <div>
            <hr class="divider">
            <div class="uploader-status pull-right text-muted"></div>
            <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>
            <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i> 开始上传
            </button>
        </div>
    </div>
</div>
<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 250px;">关闭</button>
<script src="${pageContext.servletContext.contextPath}/zui/lib/jquery/jquery.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/js/zui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/zui/lib/uploader/zui.uploader.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript">
    $('#uploaderExample1').uploader({
        autoUpload: false,            // 当选择文件后立即自动进行上传操作
        url: '${pageContext.servletContext.contextPath}/upload.action'  // 文件上传提交地址
    });
</script>
