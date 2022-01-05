<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>아이디찾기</title>
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">
</head>

<body>
<div class="title_rocation">
  <div class="tr_wrap">
    <h3><img src="/images/join/id_search_title.gif" alt="아이디찾기"></h3>
  </div>
</div>
<div class="j_wrap">
  <div class="j_visual"><img src="/images/join/jm_img1.gif" alt="국내최대 자동차 중고부품 쇼핑몰 PARTS MOA에 오신 것을 환영합니다"></div>
  <div id="tabNav_j1" class="join_tab search_tab">
    <h4 id="tabNavTitle0101" class="on"><a href="#" onclick="shwoTabNav('01', 2, 1); return false;" onfocus="this.onclick();">사업자회원</a></h4>
    <div id="tabNav0101" style="display: block;">
      <c:if test = "${params.tab_val eq '2' }">
        <div class="licensee_3">
          <dl class="type_2">
            <c:choose>
              <c:when test = "${not empty article.member_nm }">
                <dt>찾으시는 아이디는 다음과 같습니다.</dt>
                <dd><span class="standard">아이디</span><span>: ${fn:substring(article.member_id, 0 , 2) }****</span></dd>
                <dd> <span class="standard">등록일</span> <span>: ${fn:substring(article.reg_dt, 0, 4)}년 ${fn:substring(article.reg_dt, 5, 7)}월 ${fn:substring(article.reg_dt, 8, 10)}일</span> </dd>
              </c:when>
              <c:otherwise>
                <dt>해당 정보가 없습니다.</dt>
              </c:otherwise>
            </c:choose>
            <dd class="btn_2"> <a href="/giftcard/index.do"><img class="btn" src="/images/join/join4_btn_1.gif" alt=""></a> <a href="/giftcard/login/login.do"><img class="btn" src="/images/join/join4_btn_2.gif" alt=""></a> </dd>
          </dl>
        </div>
      </c:if>
      <div class="b_gui">
        <p class="gui_l"><span class="text">아직 파츠모아 회원이 아니세요?</span><span><a href="/giftcard/join/join_2.do"><img class="btn" src="/images/join/btn_join.gif" alt=""></a></span></p>
        <p class="gui_r"><span class="text">아직 파츠모아 회원이 아니세요?</span><span><a href="/giftcard/join/pw_search.do"><img class="btn" src="/images/join/btn_pw_search.gif" alt=""></a></span></p>
      </div>
    </div>
    <h4 id="tabNavTitle0102"><a href="#" onclick="shwoTabNav('01', 2, 2); return false;" onfocus="this.onclick();">개인회원</a></h4>
    <div id="tabNav0102" style="display: none;">
      <c:if test = "${params.tab_val  eq '1' }">
        <div class="licensee_3">
          <dl class="type_2">
            <c:choose>
              <c:when test = "${not empty article.member_nm }">
                <dt>찾으시는 아이디는 다음과 같습니다.</dt>
                <dd><span class="standard">아이디</span><span>: ${fn:substring(article.member_id, 0 , 2) }****</span></dd>
                <dd> <span class="standard">등록일</span> <span>: ${fn:substring(article.reg_dt, 0, 4)}년 ${fn:substring(article.reg_dt, 5, 7)}월 ${fn:substring(article.reg_dt, 8, 10)}일</span> </dd>
              </c:when>
              <c:otherwise>
                <dt>해당 정보가 없습니다.</dt>
              </c:otherwise>
            </c:choose>
            <dd class="btn_2"> <a href="#"><img class="btn" src="/images/join/join4_btn_1.gif" alt=""></a> <a href="#"><img class="btn" src="/images/join/join4_btn_2.gif" alt=""></a> </dd>
          </dl>
        </div>
      </c:if>
      <div class="b_gui">
        <p class="gui_l"><span class="text">아직 파츠모아 회원이 아니세요?</span><span><a href="#"><img class="btn" src="/images/join/btn_join.gif" alt=""></a></span></p>
        <p class="gui_r"><span class="text">아직 파츠모아 회원이 아니세요?</span><span><a href="#"><img class="btn" src="/images/join/btn_pw_search.gif" alt=""></a></span></p>
      </div>
    </div>
  </div>
  <script type="text/javascript">
      function shwoTabNav(eName, totalNum, showNum) {
      	for(i=1; i<=totalNum; i++){
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
      </script> 
</div>
</body>
</html>
