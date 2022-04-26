<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="suf" uri="/WEB-INF/tlds/StringUtil_fn.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no" />
  <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes" name="viewport" />
  <meta name="author" content="31system" />
  <meta name="description" content="기프트밴드 상품권 구매 안내 입니다." />
  <meta name="Keywords" content="기프트밴드, 상품권, 상품권 구매, 온라인 상품권" />
  <title>기프트밴드 상품권 구매 진행 안내</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <link rel="stylesheet" href="/lib/css/reset.css">
  <link rel="stylesheet" href="/lib/css/common_dc.css">
  <link rel="stylesheet" href="/lib/css/style.css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="기프트밴드">
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit" style="margin-bottom: 5rem;">상품권 구매 진행 안내</h2>

      <h5 class="title">구매 정보 <span>현재 진행 중인 구매 정보입니다.</span></h5>
      <ul class="history_wrap">
        <li class="history_list">
          <ul>
            <li>구매 상품</li>
            <li>기프트밴드 모바일 상품권</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>주문 번호</li>
            <li>${resultInfo.orderno }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>구매 일자</li>
            <li>${resultInfo.paydate }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>구매 총액</li>
            <li><strong>${suf:getThousand(params.amt) }만원</strong></li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>구매자 (입금자명)</li>
            <li>${params.receiver}</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>가상계좌정보</li>
            <li>${resultInfo.vir_banknm } / ${resultInfo.vir_acctno } / ${resultInfo.receiver}</li>
          </ul>
        </li>
      </ul>

      <article class="mi_box">
        <p>
          ※ 기프트밴드의 모바일 상품권은 결제 전문(PG) 업체에 의뢰하여 판매하고 있습니다.<br>
          본 구매는 대행사인 통해 진행되며 결제 대행사에 따라 입금처 확인이 어려운 가상계좌가 안내될 수 있습니다.<br>
          결제를 위한 입금 계좌는 항상 이 화면에서 확인하실 수 있습니다.
        </p>
      </article>

      <h5 class="title">처리 현황</h5>
      <ul class="history_wrap">
        <li class="history_list">
          <ul>
            <li>주문 번호</li>
            <li>${resultInfo.orderno }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>구매 신청<br>(주문번호:${resultInfo.orderno })</li>
            <li>${resultInfo.paydate }</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>상태</li>
            <li>주문 접수</li>
          </ul>
        </li>
        <li class="history_list">
          <ul>
            <li>입금 여부</li>
            <li>대기</li>
          </ul>
        </li>
      </ul>

      <article class="btn_wrap">
        <button  type="button" onclick="window.close()" >닫기</button>
        <button class="gray"  type="button" onclick="window.close()" >확인</button>
      </article>
    </div>
  </div>
</body>

</html>