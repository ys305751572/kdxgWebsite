<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>行业资讯详情</title>
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
    <div class="matter">
        <div class="lt-date">
          <span class="year">${info.year}</span>
          <span class="date">${info.monthday}</span>
        </div>
        <div class="rt-details">
          <h3 class="ellips">${info.title}</h3>
          ${info.content}
          </div>
        </div>
    </div>        
  </div>
</div>
<!--文件底部-->
<%@ include file = "footer.jsp"%>
</body>
</html>