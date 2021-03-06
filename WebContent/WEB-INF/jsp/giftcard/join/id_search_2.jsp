<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes" name="viewport" />
<meta name="author" content="31system" />
<meta name="description" content="안녕하세요  기프트밴드입니다." />
<meta name="Keywords" content="기프트밴드, 상품권, 백화점 상품권, 롯데 백화점, 롯데 상품권, 갤러리아 백화점, 갤러리아 상품권, 신세계 백화점, 신세계 상품권" />

<title>아이디찾기</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">

</head>

<body>
<div class="title_rocation">
</div>
<div class="j_wrap">
  <div id="tabNav_j1" class="join_tab search_tab">
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
            <dd class="btn_2">
            	<a href="/giftcard/index.do">메인화면</a>
            	<a href="/giftcard/login/login.do">로그인</a>
            </dd>
          </dl>
        </div>
      </c:if>
      <div class="b_gui">
        <p class="gui_l"><span class="text">아직 기프트밴드 회원이 아니세요?</span><span><a href="/giftcard/join/join_2.do"><img class="btn" src="/images/join/btn_join.gif" alt="회원가입"></a></span></p>
        <p class="gui_r"><span class="text">비밀번호를 찾으시나요?</span><span><a href="/giftcard/join/pw_search.do"><img class="btn" src="/images/join/btn_pw_search.gif" alt="비밀번호 찾기"></a></span></p>
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

<script type="text/javascript" src="/lib/js/common.js"></script>
</body>
</html>
