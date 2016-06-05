<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
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
  <div class="content bigbg">
    <div class="container">
      <!--公众号二维码-->
      <div class="item-1 tc">
          <h3 class="b-title">有需要<i>·</i>找踢踢</h3>
          <p class="prompt">扫描二维码关注公众号</p>
          <div class="iphone rel">
            <img src="${contextPath}/static/website2/images/phone.png"/>
            <div class="code" style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:200px;width:200px;"></div>
          </div>
       </div>
       <!--下载二维码-->
       <div class="item-2 tc">
          <h3 class="h-title">同城服务</h3>
          <p class="p-title">总有人在你身边  帮你递送温暖</p>
          <img class="cityImg" src="${contextPath}/static/website2/images/serve.png"/>
          <div class="download">
            <ul class="clearfix">
              <li><span  style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:190px;width:200px;"></span><p>iOS下载</p></li>
              <li><span  style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:190px;width:200px;"></span><p>安卓下载</p></li>
            </ul>
          </div>
       </div>
    </div>
  </div>
  <!--水果套餐订购-->
  <div class="container">
    <div class="item-3 tc">
      <h3 class="h-title">水果套餐订购</h3>
      <p class="p-title">水果套餐定时配送  美好的一天从这里开始</p>
      <img src="${contextPath}/static/website2/images/meal.png"/>
      <div class="code-2"  style="background: url(${contextPath}/static/website/images/erwei.jpg);background-size:190px;width:200px;"></div>
      <p class="prompt">扫描二维码关注公众号</p>
    </div>
  </div>
</div>
<!--文件底部-->
<%@ include file = "footer.jsp"%>
</body>
</html>