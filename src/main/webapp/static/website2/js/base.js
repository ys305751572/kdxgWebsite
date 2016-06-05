// JavaScript Document
$(function(){
	/*关于我们*/
	$(".lt-tab ul li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var _index=$(this).index();
		$(".rt-part li").eq(_index).addClass("active").siblings().removeClass("active");
	})
	//加载更多
    //$(".load").click(function(){
     //    $(".load").hide();
     //    $(".to_load").show();
     //    setTimeout(function(){
     //         $(".load").show();
     //         $(".to_load").hide();
	//		  var Inform=$('<li><div class="lt-date"><span class="year">2016</span><span class="date">Jan.12</span></div><div class="rt-details"><h3 class="ellips">踢踢同城首届商业合作伙伴峰会召开，挖掘平台商业价值</h3><p class="intro">今日，踢踢同城有限公司（titi.com）在北京JW万豪酒店召开首届全国商业合作伙伴峰会，本次峰会主题是“总有NweBiz在身边”，来自全国各地的150多家广告代理商参加了此次峰会多家广告代理商参加了此次峰会。</p><p><a class="read" href="行业资讯详情.html">阅读全文</a></p></div></li>');
     //         $(".information ul").append(Inform);
     //    },1000);
    //});
	
	//页面底部不留白
	function footer(){
		var winH=$(window).height();
		var topH=$(".header").outerHeight(true);
		var bottomH=$(".footer").outerHeight(true);
		var tH=winH-topH-bottomH;
		if($(".main").outerHeight(true)<tH){
		   $(".main").css("height",tH);	
		}
	};
	footer();
	window.onresize = function(){footer();}
	
	//右侧悬浮回到顶部
	function Bfixed(){
		var winW=$(window).width();
		var Right=(winW-$(".container").width())/2-$(".broadside span").width();
		if(Right<0){
			$(".broadside").css("right","0px");
		}else{
			$(".broadside").css("right",Right);
		}
	};
	Bfixed();
	window.onresize = function(){Bfixed();}
	
    //返回顶部
	$(".broadside span.get-top").click(function(){
		$("html,body").animate({"scrollTop":0},100);
		return false;
	});
})
$(document).ready(function(){

});