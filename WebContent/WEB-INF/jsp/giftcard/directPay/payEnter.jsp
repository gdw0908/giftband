<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

</head>
<script type="text/javascript">
function printName() {
  const price = document.getElementById('amt').value;
  document.querySelector(".price").innerText = price;
}

function frm_chk() {
	if($("#amt").val() == "" ){
		alert("구매 금액을 입력해 주세요.");
		$("#amt").focus();
		return false;
	}
	if($("#amt").val() < 1 ){
		alert("최소 구매 금액은 1만원 입니다.");
		$("#amt").focus();
		return false;
	}
	if(Number($("#amt").val() > 300) ){
		alert("최대 구매 금액은 300만원 입니다.");
		$("#amt").focus();
		return false;		
	}
	$("#frm").submit();
}
</script>
<body>
	<header>
	  <h1>
		<img src="/images/directPay/logo.svg" alt="기프트밴드">
	  </h1>
	</header>

	<div class="container">
		<div class="inner price_container">
	      	<h2 class="main_tit">상품권 구매하기</h2>
	      	<p class="main_dec">구매하실 상품권의 총액을 입력해주세요.</p>
	     
			<div class="img_wrap">
			  <img src="/images/directPay/product_img.png" alt="포인트 상품권">
			  <div class="price_wrap">
			    <p class="price"></p><span>만원</span>
			  </div>
			</div>
			<form class="pay_form" method="post" name="frm" id="frm" action="/direct/payAcctInfo.do" >
				<article>
				  <h5 class="title">금액 입력</h5>
				  <div class="price_input">
				    <input type="number" id="amt" name="amt" onkeyup="printName()" placeholder="최소 금액은 1만원 입니다." maxlength="4">
				    <button type="button" class="price_btn" onclick="frm_chk()">구매하기</button>
				  </div>
				</article>
	      	</form>
		</div>
	</div>
</body>

</html>