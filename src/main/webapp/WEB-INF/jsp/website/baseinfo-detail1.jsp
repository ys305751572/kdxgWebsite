<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
	<c:if test="${info.type eq 3}">加入我们</c:if>
	<c:if test="${info.type eq 4}">联系我们</c:if>
</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/static/website/css/cc.css">
</head>
<body>
<div class="header">
	<%@include file="top.jsp" %>
</div><!-- header ending -->
<div class="wrap">
<div class="section1" style="border:none;margin-bottom: 80px;height: auto;overflow: auto;">
	${info.content}
</div>
</div><!-- wrap ending -->
<div class="footer">
	<%@include file="foot.jsp" %>
</div>
</body>
</html>
