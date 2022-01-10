<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="description" content="안녕하세요  티켓크루 입니다." />
<meta name="Keywords" content="티켓크루, 상품권, 백화점 상품권, 롯데 백화점, 롯데 상품권, 갤러리아 백화점, 갤러리아 상품권, 신세계 백화점, 신세계 상품권" />

<title>비밀번호찾기</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">
</head>

<body>
<div class="title_rocation">
</div>
<div class="j_wrap">
  <div class="pw_last">
    <div class="licensee_3">
      <c:choose>
        <c:when test = "${not empty article }">
          <dl class="type_2">
            <dt>성공적으로 비밀번호가 발급되었습니다.</dt>
            <dd><span class="standard">아이디</span><span>: ${article.member_id }</span></dd>
            <dd> <span class="standard">비밀번호확인</span>
              <c:choose>
                <c:when test = "${not empty article.busi_nm }"> <span>: 회원정보 이메일 (${article.email })</span> </c:when>
                <c:otherwise> <span>: 회원정보 휴대폰 (${article.cell })</span> </c:otherwise>
              </c:choose>
            </dd>
            <dd class="btn_2">
            	<a href="/giftcard/index.do">메인화면</a>
            	<a href="/giftcard/login/login.do">로그인</a>
            </dd>
          </dl>
        </c:when>
        <c:otherwise>
          <dl class="type_2">
            <dt>일치하는 회원 정보가 없습니다.</dt>
            <dd class="btn_2">
            	<a href="/giftcard/index.do">메인화면</a>
            	<a href="/giftcard/login/login.do">로그인</a>
            </dd>
          </dl>
        </c:otherwise>
      </c:choose>
    </div>
    <div class="b_gui_2">
      <p><strong>위의 방법으로도 찾지 못했다면, 티켓크루쇼핑몰 고객센터로 문의주십시오</strong><br>
        고객센터 전화문의 : 1566-6444 (상담가능시간: 평일 오전 9시~오후 6시)</p>
    </div>
  </div>
</div>

<script src="/lib/js/common.js"></script>
</body>
</html>
