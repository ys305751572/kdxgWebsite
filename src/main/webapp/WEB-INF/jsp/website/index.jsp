<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
	<link rel="stylesheet" type="text/css" href="${contextPath}/static/website/css/cc.css">
</head>
<body>
<div class="header">
	<%@include file="top.jsp" %>
</div><!-- header ending -->
	<div class="banner">
		<div class="banner_tips1">
			<span>有需要.找踢踢</span>
		</div>
		<div class="banner_tips2" style="background-image: url(${contextPath}/static/website/images/erwei.jpg);width: 200px;background-size:200px">
			<span>扫描二维码关注公众号</span>
		</div>
		<div class="banner_tips3">
			<span class="tc">同城服务</span><br>
			<span class="wn">总有人在您身边，帮你递送温暖</span>
		</div>
	</div><!-- banner ending -->
	<div class="section">
		<div class="download">
		<div class="az" style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:200px;width:200px;"><span class="download_box">安卓下载</span></div>
		<div class="ios" style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:200px;width:200px;"><span class="download_box">ios下载</span></div>
		</div>
	</div><!-- section ending -->
	<div class="content">
		<div class="content_box">
			<span class="tc">水果套餐订购</span><br>
			<span class="wn">水果套餐及时配送，美好的一天从这里开始</span>
		</div>
		<div class="gzh" style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:200px;">
			<span>扫描二维码关注公众号</span>
		</div>
	</div>
<div class="footer">
	<%@include file="foot.jsp" %>
</div>
</body>
</html>
