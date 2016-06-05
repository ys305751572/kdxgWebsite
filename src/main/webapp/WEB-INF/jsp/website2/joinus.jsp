<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>加入我们</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="stylesheet" href="${contextPath}/static/website2/css/common.css"/>
<link rel="stylesheet" href="${contextPath}/static/website2/css/all.css"/>

</head>
<body>
<!--页面头部-->
<%@ include file = "top.jsp"%>
<!--中间内容区域-->
<div class="main">
  <div class="container">
    <div class="invite">
        <br/><br/>
        ${joinInfo.content}
    </div>      
  </div>
</div>
<!--文件底部-->
<%@ include file = "footer.jsp"%>
</body>
</html>