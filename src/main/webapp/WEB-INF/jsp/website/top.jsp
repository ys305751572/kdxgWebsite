<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="topbar">
	<div class="logo">
		<img src="${contextPath}/static/website/images/index/index.gif">
	</div><!-- logo ending -->
	<div class="nav">
		<ul>
			<a href="#" onclick="toDetail('${contextPath}/ws/index/index')"><li>首页</li></a>
			<a href="#" onclick="toDetail('${contextPath}/ws/infows/index')"><li>行业资讯</li></a>
			<a href="#" onclick="toDetail('${contextPath}/ws/index/about?type=1')"><li>关于我们</li></a>
			<a href="#" onclick="toDetail('${contextPath}/ws/index/about?type=3')"><li>加入我们</li></a>
			<a href="#" onclick="toDetail('${contextPath}/ws/index/about?type=4')"><li>联系我们</li></a>
		</ul>
	</div><!-- nav ending -->

	<script type="application/javascript">
		function toDetail(url) {
			window.location.href = url;
		}

	</script>
</div><!-- topbar ending -->

