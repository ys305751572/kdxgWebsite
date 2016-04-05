<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行业咨讯</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/static/website/css/cc.css">
<script src="${contextPath}/static/js/jquery-1.11.0.js"></script>
</head>
<body>

<div class="header">
	<%@include file="top.jsp" %>
</div><!-- header ending -->
<div class="wrap">
	<div class="nav_box">
		<ul>
			<c:forEach items="${wsList}" var="classify">
				<li><a href="#" onclick="website.fn.selectType(${classify.id})">${classify.name}</a></li>
			</c:forEach>
		</ul>
	</div>
<div class="aside" style="display: none">

</div>
<div class="section1" style="display: none">

</div>
	<input type="hidden" id="type" name="type" value>
	<input type="hidden" id="start" name="start" value>
	<input type="hidden" id="length" name="length" value>
<button class="btn">点击查看更多</button>
</div><!-- wrap ending -->
<div class="footer">
	<%@ include file="foot.jsp"%>
</div>
<script type="application/javascript">

	var website = {
		v : {},
		fn : {
			init : function() {
				$(".btn").click(function() {
					website.fn.selectType($("#type").val());
				});
				website.fn.selectType(null);
			},

			selectType : function(type) {
				$.post("${contextPath}/ws/infows/list",{"type" : type, "start" : $("#start").val(), "length" : $("#length").val()} ,function(result) {
					$(".section1").last().after(result.html);

					$("#start").val(result.start);
					$("#length").val(result.length);
					$("#type").val(type);

					if(result.isEnd) {
						$(".btn").css("display","none");
					}
				});
			},

			detail : function(id) {
				window.location.href = "${contextPath}/ws/infows/detail?id = " + id;
			}
		}
	}

	$(function() {
		website.fn.init();
	});
</script>
</body>
</html>
