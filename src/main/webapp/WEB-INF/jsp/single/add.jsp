<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/8/17
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>班级单页</title>
    <%@ include file="../inc/css.jsp" %>
    <link href="static/js/plugins/bootstrap-fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <script src="static/js/plugins/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="static/js/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <link href="static/js/plugins/dropper/jquery.fs.dropper.css" rel="stylesheet">
    <script src="static/js/plugins/dropper/jquery.fs.dropper.js"></script>
</head>
<style>
    .kv-file-upload{display: none;}
    .fileinput-upload-button {display: none;}
</style>
<body>
<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑单页</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                        <form id="productForm" method="post" enctype="multipart/form-data" action="admin/single/save" class="form-horizontal" role="form">
                            <input type="hidden" id="id" name="id" value = "${single.id}">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">单页名称:</label>
                                <div class="col-sm-5">
                                    <h4>
                                        <c:if test="${single.type==1}" >
                                            <h4>关于我们</h4>
                                        </c:if>
                                        <c:if test="${single.type==2}">
                                            <h4>公司发展</h4>
                                        </c:if>
                                        <c:if test="${single.type==3}">
                                            <h4>加入我们</h4>
                                        </c:if>
                                        <c:if test="${single.type==4}">
                                            <h4>联系我们</h4>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">单页详情:</label>
                                <div class="col-sm-6">
                                    <script id="container" name="content" type="text/plain">${single.content}</script>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" id="submitProduct" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<%@ include file="../inc/footer.jsp" %>
<!-- 配置文件 -->
<script type="text/javascript" src="ueditor1_4_3/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor1_4_3/ueditor.all.js"></script>

</body>
<script type="text/javascript">
    var product = {
        v: {
            id: "product",
            list: [],
            dTable: null
        },
        fn: {
            init: function () {

                if($("#id").val()!=""){
                    $(".page-header").text("编辑平台")
                }
                $("#submitProduct").click(function(){
                    product.fn.save();
                })
                product.fn.imageInit();
                $("#removeImg").click(function(){
                    product.fn.clearImageView();
                })
                UE.getEditor('container');

            },
            clearImageView: function(){
                $("#imageId").val("");
                $(".image_show").html("");
                $(".image_handle").show();
                $(".dropper-input").val("");
            },
            viewImage: function (image) {
                if (image) {
                    $(".dropper-input").val("");
                    $(".image_handle").hide();
                    $(".image_show").show();
                    $("#imageId").val(image.id);
                    $(".image_show").html("<img src='" + image.path + "' class='img-responsive' >");
                }
            },
//            dropperInit: function () {
//                $(".dropped").dropper({
//                    postKey: "file",
//                    action: "common/file/save/image",
//                    postData: {thumbSizes: '480x800'},
//                    label: "把图片拖拽到此处 ",
//                    maxSize: 204857
//                }).on("fileComplete.dropper", product.fn.onFileComplete)
//                        .on("fileError.dropper", product.fn.onFileError);
//            },
            onFileComplete: function (e, file, response) {
                if (response.status == '0') {
                    product.fn.viewImage(response.data);
                } else {
                    $bluemobi.notify(response.msg, "error");
                }
            },
            onFileError: function (e, file, error) {
                $bluemobi.notify(error, "error");
            },
            initialPreview:function(){
                var imgPreViews = [];
                <c:forEach var="_image" items="${product.images}" >
                var img =  "<img src='${_image.path}' style ='height:160px'>"
                imgPreViews.push(img);
                </c:forEach>
                return imgPreViews;
            },
            initialPreviewConfig:function(){
                var imgPreViewsConf = [];
                <c:forEach var="_image" items="${product.images}" >
                var conf = {
                    caption: "",
                    width: "120px",
                    url: "product/delPic?productId=${product.id}&imageId=${_image.id}",
                    key: ${_image.id}
                }
                imgPreViewsConf.push(conf);
                </c:forEach>
                return imgPreViewsConf;

            },
            imageInit:function(){
                var $input = $("#the_file");
                $input.fileinput({
                    uploadUrl: "gen/save/images", // server upload action
                    uploadAsync: false,
                    showUpload: true, // hide upload button
                    showRemove: false, // hide remove button
                    overwriteInitial: false,
                    minFileCount: 1,
                    maxFileCount: 3,
                    initialPreview: product.fn.initialPreview(),
                    initialPreviewConfig: product.fn.initialPreviewConfig(),
                    msgFilesTooMany:"只能上传三张图片",
                    allowedFileTypes:['image'],
                    uploadExtraData: function() {  // callback example
                        var out = {}, key, i = 0;
                        $('.kv-input:visible').each(function() {
                            $el = $(this);
                            key = $el.hasClass('kv-new') ? 'new_' + i : 'init_' + i;
                            out[key] = $el.val();
                            i++;
                        });
                        return out;
                    }
                }).on('filebatchuploadsuccess', function(event, data, previewId, index) {
                    var response = data.response;
                    if(response.status==0){
                        var imageIds = "";
                        $.each(response.data,function(index,data){
                            imageIds+=data.id+",";
                        })
                        if(imageIds.length>0){
                            imageIds =  imageIds.substr(0,imageIds.length-1);
                        }
                        $("#imageIds").val(imageIds);

                        $("#productForm").ajaxSubmit({
                            dataType: "json",
                            success: function (result) {
                                $("#imageIds").val("");
                                product.fn.responseComplete(result);
                            }
                        })
                    }
                });
            },
            save: function () {

                console.log($("#datetest").val());
                if(!$('#productForm').isValid()) {
                    return false;
                };

                if($("#imageId")==""||$("#imageId")==null){
                    $bluemobi.notify("缩略图不能为空!", "error");
                    return false;
                }

                if($(".glyphicon-hand-down").length==0){ // 没有图片的情况
                    $("#productForm").ajaxSubmit({
                        dataType: "json",
                        success: function (result) {
                            product.fn.responseComplete(result,true);
                        }
                    });
                }else{ // 有图片的情况
                    $(".fileinput-upload-button").trigger("click");
                }

            },
            responseComplete: function (result) {
                if (result.status == "0") {
                    $bluemobi.notify(result.msg, "success");
//                    $("#id").val(result.data.id)
                    window.location.href = " ${contextPath}/admin/single/index";
                } else {
                    $bluemobi.notify(result.msg, "error");
                }
            }
        }
    }

    $(document).ready(function () {
        product.fn.init();


    });
</script>


</html>
