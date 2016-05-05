<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
	<c:if test="${info.type eq 3}">关于我们</c:if>
	<c:if test="${info.type eq 4}">公司发展</c:if>
</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/static/website/css/cc.css">
</head>
<body>
<div class="header">
	<%@include file="top.jsp" %>
</div><!-- header ending -->
<div class="wrap">
<div class="aside" >
	<div class="side_box" style="border: none;">
	<span><a href="#" onclick="toDetail('${contextPath}/ws/index/about?type=1')">关于我们</a></span><br><br>
	<span><a href="#" onclick="toDetail('${contextPath}/ws/index/about?type=2')">公司发展</a></span>
	</div>
</div> 
<div class="section1" style="border-bottom:none;height:auto;border-left: 2px dashed #c4c4c4; box-sizing:border-box;padding-left: 20px;">
	<p>
		${info.content}
	</p>
</div>

</div><!-- wrap ending -->
<div class="footer" style="position: relative;top: 40px;">
	<%@include file="foot.jsp" %>
</div>
<script type="application/javascript">
	function toDetail(url) {
		window.location.href = url;
	}
</script>
</body>
</html>
