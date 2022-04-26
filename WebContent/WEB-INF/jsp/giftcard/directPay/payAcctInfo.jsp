<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>기프트밴드 상품권 구매하기</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <link rel="stylesheet" href="/lib/css/reset.css">
  <link rel="stylesheet" href="/lib/css/common_dc.css">
  <link rel="stylesheet" href="/lib/css/style.css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head><!DOCTYPE html>
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
<link rel="stylesheet" href="/lib/css/common.css">
<link rel="stylesheet" href="/lib/css/style.css">

<!-- jQuery-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var $inputs = $('#cellLi input[type="tel"]');
	// var $inputs = $('.serial > input, .pin > input');
	$inputs.each(function(idx) {
		var $input = $(this);
		$input.on('keyup', function(e) {
			var val = $input.val();
			if(parseInt($input.attr('maxlength')) == val.length) {
				if(idx + 1 < $inputs.length) {
					$inputs[idx + 1].focus(); //다음 요소에 포커스
				}
			}
		});
	});
});

function frm_chk() {
	if($("#receiver").val() == "" ){
		alert("수취인 이름을 입력해주세요.");
		$("#receiver").focus();
		return false;
	}
	if($("#bankCd").val() == "" ){
		alert("입금계좌 은행을 선택해주세요.");
		$("#bankCd").focus();
		return false;
	}
	if($("#account").val() == "" ){
		alert("계좌번호를 입력해주세요.");
		$("#account").focus();
		return false;
	}
	if($("#cell1").val() == "" || isNaN($("#cell1").val())){
		alert("휴대폰 번호를 정확히 입력해주세요.");
		$("#cell1").focus();
		return false;
	}
	if($("#cell2").val() == "" || isNaN($("#cell2").val())){
		alert("휴대폰 번호를 정확히 입력해주세요.");
		$("#cell2").focus();
		return false;
	}
	if($("#cell3").val() == "" || isNaN($("#cell3").val())){
		alert("휴대폰 번호를 정확히 입력해주세요.");
		$("#cell3").focus();
		return false;
	}
	if($("#identity").val() == "" ){
		alert("수취인 생년월일을 입력해주세요.");
		$("#amt").focus();
		return false;		
	}
	$('.wrap-loading').removeClass('display-none');
	$("#frm").submit();
}

</script>
</head>

<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="기프트밴드">
    </h1>
  </header>
<form name="frm"  id="frm" method="post" action="/giftband/payOrder.do">
	<input type="hidden" name="mid" value="${params.mid}"/>
	<input type="hidden" name="amt" value="${params.amt}"/>
	<div class="container">
	  <div class="inner">
	    <h2 class="main_tit" style="margin-bottom: 5rem;">기프티콘 구매 정보</h2>
	
	    <h5 class="title">구매 정보 <span>현재 진행 중인 구매 정보입니다.</span></h5>
	    <ul class="history_wrap">
	      <li class="history_list">
	        <ul>
	          <li>구매품 </li>
	          <li>기프트밴드 모바일 상품권</li>
	        </ul>
	      </li>
	      <li class="history_list">
	        <ul>
	          <li>추천인 ID</li>
	          <li>${params.mid}</li>
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
	          <li><input type="text" name="receiver" id="receiver" class="info_input" placeholder="이름을 입력해주세요."></li>
	        </ul>
	      </li>
	      <li class="history_list">
	        <ul>
	          <li>입금계좌</li>
	          <li>
	            <div class="bank_wrap">
	              <select name="bankCd" id="bankCd">
	                <option value="">선택</option>
	                <c:forEach var="item" items="${params.bankList}" varStatus="status">
	                 <option value="${item.code }">${item.code_nm }</option>
	                </c:forEach>
	              </select>
	              <input type="text" name="account" id="account" class="info_input" placeholder="입금 계좌를 입력해주세요.">
	            </div>
	          </li>
	        </ul>
	      </li>
	      <li class="history_list">
	        <ul>
	          <li>수취인 휴대폰</li>
	          <li id="cellLi">
	          	<!-- <input type="tel" name="cell" id="cell" class="info_input" placeholder="핸드폰 번호를 입력해주세요." maxlength="11"> -->
	          	<input type="tel" id="cell1" name="cell1" class="info_input" maxlength="3" style="width:15%;">  
				&nbsp;-&nbsp;<input type="tel" id="cell2" name="cell2" class="info_input"	maxlength="4" style="width:15%;"> 
				&nbsp;-&nbsp;<input type="tel" id="cell3"	name="cell3" class="info_input" maxlength="4" style="width:15%;">
	          </li>
	        </ul>
	      </li>
	      <li class="history_list">
	        <ul>
	          <li>수취인 생년월일</li>
	          <li><input type="tel" name="identity" id="identity" class="info_input" placeholder="생년월일 6자리" maxlength="6"></li>
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
	
	    <article class="btn_wrap">
	      <button type="button" onclick="javascript:history.back();" >뒤로가기</button>
	      <button type="button" class="gray" onclick="frm_chk()">다음</button>
	    </article>
	  </div>
	</div>
</form>
<div class="wrap-loading display-none">
    <div><img src="/images/common/loading.gif" /></div>
</div>

<style type="text/css" >
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.2); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	}
    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
</style>
</body>

</html>
