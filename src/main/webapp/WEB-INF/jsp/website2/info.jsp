<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>行业资讯</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="stylesheet" href="${contextPath}/static/website2/css/common.css"/>
<link rel="stylesheet" href="${contextPath}/static/website2/css/all.css"/>
<script type="text/css">
    .range {
        max-height: 400px;
    }
</script>
</head>
<body>
<!--页面头部-->
<%@ include file = "top.jsp"%>
<!--中间内容区域-->
<div class="main">
  <div class="container">
      <div class="message">
        <ul class="clearfix">
          <li class="active">全部</li>
            <c:forEach items="${wsList}" var="classify">
                <li id="${classify.id}">${classify.name}</li>
            </c:forEach>
        </ul>
      </div>
      <div  class="information">
        <ul>
          <%--<c:forEach items="${list}" var="info">--%>
              <%--<li>--%>
                <%--<div class="lt-date">--%>
                  <%--<span class="year">${info.year}</span>--%>
                  <%--<span class="date">${info.monthday}</span>--%>
                <%--</div>--%>
                <%--<div class="rt-details">--%>
                  <%--<h3 class="ellips">${info.title}</h3>--%>
                  <%--&lt;%&ndash;<p class="intro range">今日，踢踢同城有限公司（titi.com）在北京JW万豪酒店召开首届全国商业合作伙伴峰会，本次峰会&ndash;%&gt;--%>
                    <%--&lt;%&ndash;主题是“总有NweBiz在身边”，来自全国各地的150多家广告代理商参加了此次峰会。</p>&ndash;%&gt;--%>
                  <%--&lt;%&ndash;<div class="introimg"><img src="${contextPath}/static/website2/images/inform-2.jpg"/></div>&ndash;%&gt;--%>
                    <%--${info.content}--%>
                  <%--<p><a class="read" href="行业资讯详情.html">阅读全文</a></p>--%>
                <%--</div>--%>
              <%--</li>--%>
          <%--</c:forEach>--%>
        </ul>
		<div class="broadside">
          <span class="get-top"></span>
        </div>
      </div>
      <div class="load-more">
          <input type="hidden" id="type" name="type" value>
          <input type="hidden" id="start" name="start" value>
          <input type="hidden" id="length" name="length" value>
        <input class="load btn" value="点击加载更多" type="button"/>
		<p class="to_load none"><img class="inline-b" src="${contextPath}/static/website2/images/load.gif">数据加载中...请稍候</p>
      </div>
  </div>
</div>
<!--文件底部-->
<%@ include file = "footer.jsp"%>
<script type="application/javascript">
    var website = {
        v : {},
        fn : {
            init : function() {
                $(".btn").click(function() {
                    website.fn.selectType($("#type").val());
                });
                website.fn.selectType(null,null);

                $(".clearfix li").each(function() {
                    $(this).click(function() {
                        if($(this).attr("id") == null) {
                            website.fn.selectType(null,this)
                        }
                        else {
                            website.fn.selectType($(this).attr("id"),this)
                        }
                    });
                });
            },

            selectType : function(type,classfy) {

                var start = $("#start").val();
                var length = $("#length").val();
                if(type != $("#type").val()) {
                    start = 1;
                    length = 10;
                }

                $.post("${contextPath}/ws/infows/list",{"type" : type, "start" : start, "length" : length} ,function(result) {

                    if(classfy != null) {
                        $(".clearfix li").each(function() {
                            $(this).removeClass("active");
                        }) ;
                        $(classfy).addClass("active");
                    }

                    if(type != $("#type").val()) {
                        $(".information ul").empty();
                    }
                    var html = "";
                    var list = result.list;
                    $.each(list,function(n,info) {
                        html += "<li>";
                        html += "<div class=\"lt-date\">";
                        html += "<span class=\"year\">" + info.year + "</span>";
                        html += "<span class=\"date\">" + info.monthday + "</span>";
                        html += "</div>";
                        html += "<div class=\"rt-details\">";
                        html += "<h3 class=\"ellips\">" + info.title + "</h3>";
                        html += "<p class=\"intro range\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + info.content +"</p>";
                        if(info.firstImageUrl != null) {
                            html += "<div class=\"introimg\"><img src=\"" + info.firstImageUrl + "\"/></div>";
                        }
                        html += "<p><a class=\"read\" href=\"javascript:void(0)\" onclick='website.fn.detail("+ info.id +")'>阅读全文</a></p>";
                        html += "</div>";
                        html += "</li>";

                    })
                    var liLength = $(".information ul li").length;
                    if(liLength == 0) {
                        $(".information ul").append(html);
                    }
                    else {
                        $(".information ul li:last").after(html);
                    }
                    //限制字符个数
                    $(".range").each(function(){
                        var maxwidth=200;
                        if($(this).text().length>maxwidth){
                            $(this).text($(this).text().substring(0,maxwidth));
                            $(this).html($(this).html()+"…");
                        }
//                        $(this).attr("max-heigth","300px");
                    });

                    $("#start").val(result.start);
                    $("#length").val(result.length);
                    $("#type").val(type);
                    console.log("isEnd:" + result.isEnd);
                    if(result.isEnd) {
                        $(".btn").css("display","none");
                    }
                    else {
                        $(".btn").css("display","block");
                    }
                });
            },

            detail : function(id) {
                window.location.href = "${contextPath}/ws/infows/detail?id=" + id;
            }
        }
    }

    $(function() {
        website.fn.init();
        $(".main").removeAttr("style");
    });
</script>
</body>
</html>