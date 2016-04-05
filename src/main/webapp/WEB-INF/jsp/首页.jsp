<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/3/3
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>首页</title>
    <%@ include file="inc/css.jsp" %>

</head>

<body>

<div id="posts" class="wrapper">

    <%@ include file="inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">首页</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div>
            <h2 class="page content" style="text-align: center">欢迎进入踢踢同城官网后台管理系统！</h2>
        </div>
        <div class="row">
            <!-- 加载编辑器的容器 -->
            <script id="container" name="content" type="text/plain">这里写你的初始化内容</script>

        </div>


    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<%@ include file="inc/footer.jsp" %>
</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">

</script>


</html>