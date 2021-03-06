<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suf" uri="/WEB-INF/tlds/StringUtil_fn.tld"%>
<%@ taglib prefix="dtf" uri="/WEB-INF/tlds/DateUtil_fn.tld"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta
	content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes"
	name="viewport" />
<meta name="author" content="31system" />
<meta name="description" content="안녕하세요  기프트밴드 입니다." />
<meta name="Keywords" content="기프트밴드, 기프트콘, 기프트콘쇼핑" />
<title>기프트밴드</title>

<!-- og -->
<meta property="og:type" content="website" />
<meta property="og:site_name" content="기프트밴드" />
<meta property="og:title" content="기프트밴드 입니다." />
<meta property="og:description" content="안녕하세요 기프트밴드 입니다." />
<meta property="og:url" content="#" />
<meta property="og:image" content="./images/kakao_img.png" />
<meta property="og:image:width" content="800" />
<meta property="og:image:height" content="400" />

<!-- twitter -->
<meta name="twitter:title" content="기프트밴드" />
<meta name="twitter:description" content="안녕하세요 기프트밴드 입니다." />
<meta name="twitter:url" content="#" />
<meta name="twitter:image" content="./images/kakao_img.png" />

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/lib/js/common.js"></script>
<script type="text/javascript" src="/lib/js/common_sc.js"></script>
<script type="text/javascript" src="/lib/js/gnb.js"></script>
<script type="text/javascript">
	function popup_close() {
		$(".h_slide").slideUp(400);
	}
	$(document).ready(

			
			function() {
				//#notice
				$("#notice_roll").jCarouselLite({
					visible : 1,
					speed : 500,
					auto : 3000,
					circular : true,
					vertical : true,
					easing : "swing",
					btnPrev : "#roll1_1_prev",
					btnStop : "#roll1_1_pause",
					btnStart : "#roll1_1_play"

				});

				//new
				$("#new_roll").jCarouselLite({
					visible : 1,
					speed : 500,
					auto : 3000,
					circular : true,
					vertical : true,
					easing : "swing",
					btnPrev : "#roll1_2_prev",
					btnStop : "#roll1_2_pause",
					btnStart : "#roll1_2_play"

				});

				//event
				$("#event_roll").jCarouselLite({
					visible : 1,
					speed : 0,
					auto : 4000,
					circular : true,
					vertical : false,
					easing : "swing",
					btnPrev : "#roll2_prev",
					btnStop : "#roll2_pause",
					btnStart : "#roll2_play"

				});

				//left side banner

				$(document).ready(function() {
					$('#close_l').click(function() {
						$('.side_banner_l').hide();
					});
				});

				// category_tab hover event
				$('.brand_tab .category_tab li').hover(function() {
					$(this).prevAll().addClass('active');
					$(this).nextAll().addClass('active');
				}, function() {
					$(this).prevAll().removeClass('active');
					$(this).nextAll().removeClass('active');
				});

				//right side banner

				$(document).ready(function() {
					$('#close_r').click(function() {
						$('.side_banner_r').hide();
					});
				});

				lastest_part(1, 1);

				$.getJSON("/json/list/code.sido.do", "", function(data) {
					$("#sido").empty();
					$("#sido").append("<option value=''>시/도</option>");
					$("#sidot").empty();
					$("#sidot").append("<option value=''>시/도</option>");
					$.each(data, function(i, o) {
						$("#sido").append(
								"<option value='"+o.sido+"'>" + o.dong_nm
										+ "</option>");
						$("#sidot").append(
								"<option value='"+o.sido+"'>" + o.dong_nm
										+ "</option>");
					});
				});

				$.getJSON("/json/list/code.codeList.do", {
					code_group_seq : 38
				}, function(data) {
					$("#grade").empty();
					$("#grade").append("<option value=''>전체</option>");
					$.each(data, function(i, o) {
						$("#grade").append(
								"<option value='"+o.code+"'>" + o.code_nm
										+ "</option>");
					});
				});

				$.getJSON("/json/list/old_code.carmaker.do", '',
						function(data) {
							$("#carmakerseq").empty();
							$.each(data, function(i, o) {
								$("#carmakerseq").append(
										"<option value='"+o.carmakerseq+"'>"
												+ o.makernm + "</option>");
							});
						});

			});

	//브랜드별최근부품
	var lastest_timer;
	function lastest_part(page, tab) {
		var time = 15000;
		if (!!lastest_timer) {
			clearTimeout(lastest_timer);
		}
		$("#tabNav0201").load(
				"/giftcard/popup/latest_part.do?cpage=" + page + "&tab=" + tab,
				function() {
					$("#tabNav0201 img").on(
							"error",
							function() {
								$(this).off("error").attr("src",
										"/images/common/no_image.gif");
							});
					var totalpage = $("#lastest_page").data("totalpage");
					page++;
					if (page > totalpage) {
						tab = (tab + 1) >= 20 ? 1 : (tab + 1);
						lastest_timer = setTimeout(function() {
							shwoTabNav2(tab);
						}, time);
					} else {
						lastest_timer = setTimeout(function() {
							lastest_part(page, tab)
						}, time);
					}
				});
	}

	function shwoTabNav2(no) {
		$("h4[id^='tabNavTitle020']").removeClass("on");
		$("#tabNavTitle020" + no).addClass("on");
		lastest_part(1, no)
	}

	function changeSido(who) {
		if (who == "A") {
			$.getJSON("/json/list/code.sigungu.do", {
				sido : $("#sido").val()
			}, function(data) {
				$("#sigungu").empty();
				$("#sigungu").append("<option value=''>시/군/구</option>");
				$("#dong").empty();
				$("#dong").append("<option value=''>읍/면/동</option>");
				$.each(data, function(i, o) {
					$("#sigungu").append(
							"<option value='"+o.sigungu+"'>" + o.dong_nm
									+ "</option>");
				});
			});
		} else {
			$.getJSON("/json/list/code.sigungu.do", {
				sido : $("#sidot").val()
			}, function(data) {
				$("#sigungut").empty();
				$("#sigungut").append("<option value=''>시/군/구</option>");
				$("#dongt").empty();
				$("#dongt").append("<option value=''>읍/면/동</option>");
				$.each(data, function(i, o) {
					$("#sigungut").append(
							"<option value='"+o.sigungu+"'>" + o.dong_nm
									+ "</option>");
				});
			});
		}
	}

	function changeSigungu(who) {
		if (who == "A") {
			$.getJSON("/json/list/code.dong.do", {
				sido : $("#sido").val(),
				sigungu : $("#sigungu").val()
			}, function(data) {
				$("#dong").empty();
				$("#dong").append("<option value=''>읍/면/동</option>");
				$.each(data, function(i, o) {
					$("#dong").append(
							"<option value='"+o.dong+"'>" + o.dong_nm
									+ "</option>");
				});
			});
		} else {
			$.getJSON("/json/list/code.dong.do", {
				sido : $("#sidot").val(),
				sigungu : $("#sigungut").val()
			}, function(data) {
				$("#dongt").empty();
				$("#dongt").append("<option value=''>읍/면/동</option>");
				$.each(data, function(i, o) {
					$("#dongt").append(
							"<option value='"+o.dong+"'>" + o.dong_nm
									+ "</option>");
				});
			});
		}
	}

	function search_main_cooperation_reset(f) {
		$("#sigungu").empty();
		$("#sigungu").append("<option value=''>시/군/구</option>");
		$("#dong").empty();
		$("#dong").append("<option value=''>읍/면/동</option>");
		f.reset();
	}

	function search_main_cooperation(f) {
		var searchType = f.searchType.value;
		if (searchType == "1") {
			f.action = "/cooperation/repair_list.do?menu=menu7";
		}
		f.submit();
	}

	function changeMenu() {
		$.getJSON("/json/list/old_code.codeList.do", {
			upcodeno : "05090100" + $("#menu_id").val()
		}, function(data) {
			$("#part2_1").empty();
			$.each(data, function(i, o) {
				$("#part2_1")
						.append(
								"<option value='"+o.code+"'>" + o.code_nm
										+ "</option>");
			});
		});
	}

	function changeCarmaker() {

		$.getJSON("/json/list/old_code.carmodel.do", {
			carmakerseq : $("#carmakerseq").val()
		}, function(data) {
			$("#carmodelseq").empty();
			$.each(data, function(i, o) {
				$("#carmodelseq").append(
						"<option value='"+o.carmodelseq+"'>" + o.carmodelnm
								+ "</option>");
			});
		});
	}

	function changeCarmodel() {
		$.getJSON("/json/list/old_code.cargrade.do", {
			carmakerseq : $("#carmakerseq").val(),
			carmodelseq : $("#carmodelseq").val()
		}, function(data) {
			$("#cargradeseq").empty();
			$.each(data, function(i, o) {
				$("#cargradeseq").append(
						"<option value='"+o.cargradeseq+"'>" + o.cargradenm
								+ "</option>");
			});
		});
	}

	function product_submit(f) {
		if (f.menu_id.value != '') {
			if (f.menu_id.value != '6') {
				f.menu.value = "menu" + f.menu_id.value;
			} else {
				f.menu.value = "menu8";
			}
		}
		f.submit();
	}

	 function addCart(item_seq) {
		$("#cartFrm>[name='mode']").val("add_cart");
		$("#cartFrm>[name='seq']").val(item_seq);
		$("#cartFrm").submit();
		return false;
	} 

	function directOrder(item_seq) {
		$("#cartFrm>[name='mode']").val("direct_order");
		$("#cartFrm>[name='seq']").val(item_seq);
		$("#cartFrm").submit();
		return false;
	}
	
	
</script>
</head>

<body>
	<main class="container">
		<div class="main_banner">
			<article class="tit_wrap">
				<h2 class="banner_tit">Sensational gift trends</h2>
				<p class="banner_sub_tit">요즘 센스있는 선물, 기프티콘 어때요?</p>
				<button type="button">
					<a href="/giftcard/goods/list.do?menu=menu">전체 상품 보기</a>
				</button>
			</article>
<!-- 			<img src="/images/banner/main_banner.jpg" /> -->
		</div>
	</main>

	<!-- side_banner -->
	<c:set var="right" value="" />
	<c:set var="left" value="" />
	<c:forEach var="item" items="${list.quick_popup }" varStatus="status">
		<c:if test="${item.rl == 'R' }">
			<c:set var="right" value="true" />
		</c:if>
		<c:if test="${item.rl == 'L' }">
			<c:set var="left" value="true" />
		</c:if>
	</c:forEach>
	<c:if test="${left == 'true'}">
		<div class="side_banner_l">
			<ul>
				<c:forEach var="item" items="${list.quick_popup }"
					varStatus="status">
					<c:if test="${item.rl == 'L' }">
						<li><a
							<c:choose><c:when test="${item.link_yn == 'Y' }">href="${item.link_url }" target="${item.link_target }"</c:when><c:otherwise>href="#"</c:otherwise></c:choose>><img
								src="${item.file_path }" alt="${item.alt }"
								style="width: 100px;"></a></li>
					</c:if>
				</c:forEach>
			</ul>
			<span id="close_l"> <a href="javascript:closePop();"> <img
					src="/images/container/side_banner_close.gif" alt="닫기">
			</a>
			</span>
		</div>
	</c:if>

	<c:if test="${right == 'true'}">
		<div class="side_banner_r">
			<ul>
				<c:forEach var="item" items="${list.quick_popup }"
					varStatus="status">
					<c:if test="${item.rl == 'R' }">
						<li><a
							<c:choose><c:when test="${item.link_yn == 'Y' }">href="${item.link_url }" target="${item.link_target }"</c:when><c:otherwise>href="#"</c:otherwise></c:choose>><
								src="${item.file_path }" alt="${item.alt }" style="width:
								100px;"></a></li>
					</c:if>
				</c:forEach>
			</ul>
			<span id="close_r"><a href="javascript:closePop();"><img
					src="/images/container/side_banner_close.gif" alt="닫기"></a></span>
		</div>
	</c:if>
	<!-- //side_banner -->
	
	<div class="con_middle_bg">
		<div class="c_wrap_2">
			<div class="md">
				<h3>고객님을 위한 <span>추천상품</span></h3>
				<div class="md_list">
					<ul>
						<c:forEach var="mdpart" items="${list.mdpart }" varStatus="status">
							<li>
								<div class="md_top">
									<div class="item_wrap">
										<p class="mt_img">
											<a href="/giftcard/goods/view.do?seq=${mdpart.item_seq }"><img src="${mdpart.THUMB }"></a>
										</p>
										<p class="mb_3 price">
											<span class="c1">${suf:getThousand(mdpart.USER_PRICE) }원</span>
											<span>${mdpart.PRODUCTNM }</span>
										</p>			
									</div>
									<p class="mt_btn">
										 <a href="/giftcard/mypage/shopping/cart/index.do?mode=direct_order&seq=${mdpart.item_seq }&qty=1">바로구매</a>
										 <a href="javascript:void();" onclick="return addCart('${mdpart.item_seq }')"><img src="/images/common/product_cart.svg" alt="장바구니">장바구니</a>
									</p>
								</div>
								<div class="md_bottom">
<!-- 									<p class="mb_1"> -->
<%-- 										<strong>제품명</strong> : ${mdpart.PRODUCTNM } --%>
<!-- 									</p> -->
<!-- 									<p class="mb_1"> -->
<%-- 										<strong>브랜드</strong> : ${mdpart.MAKERNM } --%>
<!-- 									</p> -->
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- //md -->
		</div>
	</div>
	
	<!-- 브랜드별 베스트 상품 리스트  -->
	<article class="best_container">
		<div class="list_wrap">
			<h3>브랜드별 <span>BEST</span></h3>
			<ul class="best_list">
			<c:forEach var="bestItem" items="${list.newPartsList }" varStatus="status">
				<li>
					<!-- 장바구니 아이콘 클릭시 장바구니로 이동 -->
					<a href="javascript:void();" class="cart_icon">
						<img src="/images/common/product_cart.svg" alt="장바구니">
					</a>
					<!-- 바로구매 버튼 누르면 바로구매 -->
					<button type="button" class="purchase_btn">바로구매</button>
					<div class="item_info">
						<img src="${bestItem.THUMB }" />
						<span class="price">${suf:getThousand(bestItem.USER_PRICE) }원</span>
						<span class="product_name">${bestItem.PRODUCTNM }</span>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</article>

	<div class="con_bottom_bg">
		<div class="c_wrap_3">
			<!-- brand -->
			<div class="brand_box">
				<div class="brand_contents">
					<!-- brand tab -->
					<article id="tabNav2" class="brand_tab">
						<section>
							<div class="category_wrap">
								<h3>전체 상품</h3>
								<ul class="category_tab">
									<c:forEach var="item" items="${list.category }"
										varStatus="status">
										<li id="tabNavTitle020${status.count}" class="on">
											<a href="javascript:void();" onclick="shwoTabNav2(${status.count}); return false;" onfocus="this.onclick();">${item.makernm }</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div id="tabNav0201" class="animated"></div>
						</section>
					</article>
					<!-- //brand tab -->
					<p class="more">
						<!-- <span class="text">총 <b class="c1" id="lastest_cnt">0</b> 개의 최근부품이 있습니다</span> -->
						<span class="m_ver" id="lastest_page"><b>1</b>/2</span>
						<!-- span class="btn_more"><a href="#"><img src="/images/container/brand_more.gif" alt="더 많은 부품보기"></a></span-->
					</p>
				</div>
			</div>
		</div>
	</div>

	
	<form id="cartFrm" name="cartFrm" method="post"
		action="/giftcard/mypage/shopping/cart/index.do">
		<input type="hidden" name="mode" value="" /> <input type="hidden"
			name="seq" value="" /> <input type="hidden" name="qty" value="1" />
	</form>


	<script>
		function shwoTabNav(eName, totalNum, showNum) {
			for (i = 1; i <= totalNum; i++) {
				var zero = (i >= 10) ? "" : "0";
				var e = document.getElementById("tabNav" + eName + zero + i);
				var eTitle = document.getElementById("tabNavTitle" + eName + zero + i);
						e.style.display = "none";
						eTitle.className = "";
			}

			var zero = (showNum >= 10) ? "" : "0";
			var e = document.getElementById("tabNav" + eName + zero + showNum);
			var eTitle = document.getElementById("tabNavTitle" + eName + zero + showNum);
				   e.style.display = "block";
				   eTitle.className = "on";
		}
							
		$(function() {		
			// main slide
			var swiper = new Swiper(".mainSwiper", {
				loop: true,
				autoplay: true,
				pagination: {
					el: ".swiper-pagination",
					clickable: true,
					renderBullet: function (index, className) {
						return '<span class="' + className + '">' + (index + 1) + "</span>";
					},
			 	},
			});
		});
		
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-61956506-1', 'auto');
		ga('send', 'pageview');
	</script>

	<!-- WIDERPLANET  SCRIPT START 2015.6.3 -->
	<div id="wp_tg_cts" style="display: none;"></div>
	<script type="text/javascript">
		var wptg_tagscript_vars = wptg_tagscript_vars || [];
		wptg_tagscript_vars.push((function() {
			return {
				wp_hcuid : "", /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.*/
				ti : "22097", /*광고주 코드*/
				ty : "Home", /*트래킹태그 타입*/
				device : "web" /*디바이스 종류 (web 또는 mobile)*/
			};
		}));
	</script>
	<script type="text/javascript" async
		src="//astg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<!-- // WIDERPLANET  SCRIPT END 2015.6.3 -->

</body>
</html>
