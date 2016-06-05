<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!--文件底部-->
<div class="footer tc">
    <div class="foot-nav">
      <a href="#">关于踢踢</a>
      <a href="#">公司发展</a>
      <a href="#">招聘信息</a>
      <a href="#">联系我们</a>
    </div>
    <p>踢踢www.baidu.com2014@All Right Reserved</p>
    <p>京公网安备：11010802014467 京ICP14013745号</p>
    <p>武汉六脉神掌科技有限公司 地址：武汉市洪山区野芷湖西路创意天地</p>
  </div>
</div>	
<script type="text/javascript" src="${contextPath}/static/website2/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/static/website2/js/base.js"></script>
<script>
    $(function() {
//        console.log("start");
//        $("ul.menu li").each(function() {
//            $(this).click(function() {
//                $(this).addClass("active");
//                console.log("end")
//            });
//        });

        $("ul.menu li").each(function () {
            var menu_a = $(this).find("a").eq(0);
            var page_title = $("title").text();
            if (menu_a.text() == page_title) {
                $(this).addClass("active");
            }
        })
    });
</script>
</body>
</html>