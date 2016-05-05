<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行业咨讯详情</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/static/website/css/cc.css">
</head>
<body>
<div class="header">
	<%@include file="top.jsp" %>
</div><!-- header ending -->
<div class="wrap">
<div class="aside">
	<div class="side_box">
	<span class="time"><date:date value="${info.createDate}" format="yyyy-MM-dd"></date:date> </span><br>
	</div>
</div> 
<div class="section1" style="border:none;margin-bottom: 80px;height: 1000px;overflow: auto;">
	<span>${info.title}</span>
	<p>
		${info.content}
	</p>
</div>
</div><!-- wrap ending -->
<div class="footer">
	<%@include file="foot.jsp" %>
</div>
</body>
</html>
