<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<c:set var="requestURI" value="${pageContext.request.requestURI }"/>

<div class="left_box">
	<article class="title_wrap">
		<h2 class="menu_tit"></h2>
		<img src="/images/common/title_bg_img.png" >
	</article>
	<!-- All Menu S -->
<%-- 	<jsp:include page="/giftcard/inc/all_menu_box.do"/> --%>
	<!-- All Menu E -->
</div>

<script type="text/javascript">
$( document ).ready(function() {
	
	if(location.pathname.indexOf("/mypage/carallbaro/") > -1){
		var O = $("a[href^='/mypage/carallbaro/index.do']");
		var fullO = $("a[href^='/mypage/carallbaro/index.do']");
	}else{
		if(location.pathname == "/mypage/mantoman_late/index.do"){
			var O = $("a[href^='/mypage/mantoman/index.do']");
			var fullO = $("a[href^='/mypage/mantoman/index.do"+location.search+"']");
		}else{
			var O = $("a[href^='"+location.pathname+"']");
			var fullO = $("a[href^='"+location.pathname+location.search+"']");
		}
	}
	var tit = $(document).find("title").text();
	if(fullO.size() > 0){
		fullO.closest("li").addClass("select");
		fullO.closest("li.left_depth2").addClass("select");
		$('.menu_tit').text(tit);
		$('.change_state').text(tit);
	}else{
		O.closest("li").addClass("select");
		O.closest("ul.left_menu_ul").show();
		$('.menu_tit').text(tit);
		$('.change_state').text(tit);
	}

	
	// 2depth menu
	$('.left_menu_a').click(function(e){
		e.stopPropagation();
		$('.left_menu_ul').slideUp();
		$(this).next().slideToggle(300);
		$(this).parent().siblings().removeClass('select');
		$(this).parent().addClass('select');
	});
	
	
	//전체 카테고리
	$("#allmenu_open").click(function() {
		$("#all_menu").slideToggle(250);
	});
	$("#allmenu_close").click(function() {
		$("#all_menu").slideToggle(250);
	});
	
});
</script>