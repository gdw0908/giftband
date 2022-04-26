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
  <meta name="description" content="����Ʈ��� ��ǰ�� ���� �ȳ� �Դϴ�." />
  <meta name="Keywords" content="����Ʈ���, ��ǰ��, ��ǰ�� ����, �¶��� ��ǰ��" />
  <title>����Ʈ��� ��ǰ�� �����ϱ�</title>

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
		alert("���� �ݾ��� �Է��� �ּ���.");
		$("#amt").focus();
		return false;
	}
	if($("#amt").val() < 1 ){
		alert("�ּ� ���� �ݾ��� 1���� �Դϴ�.");
		$("#amt").focus();
		return false;
	}
	if(Number($("#amt").val() > 300) ){
		alert("�ִ� ���� �ݾ��� 300���� �Դϴ�.");
		$("#amt").focus();
		return false;		
	}
	$("#frm").submit();
}
</script>
<body>
	<header>
	  <h1>
		<img src="/images/directPay/logo.svg" alt="����Ʈ���">
	  </h1>
	</header>

	<div class="container">
		<div class="inner price_container">
	      	<h2 class="main_tit">��ǰ�� �����ϱ�</h2>
	      	<p class="main_dec">�����Ͻ� ��ǰ���� �Ѿ��� �Է����ּ���.</p>
	     
			<div class="img_wrap">
			  <img src="/images/directPay/product_img.png" alt="����Ʈ ��ǰ��">
			  <div class="price_wrap">
			    <p class="price"></p><span>����</span>
			  </div>
			</div>
			<form class="pay_form" method="post" name="frm" id="frm" action="/direct/payAcctInfo.do" >
				<article>
				  <h5 class="title">�ݾ� �Է�</h5>
				  <div class="price_input">
				    <input type="number" id="amt" name="amt" onkeyup="printName()" placeholder="�ּ� �ݾ��� 1���� �Դϴ�." maxlength="4">
				    <button type="button" class="price_btn" onclick="frm_chk()">�����ϱ�</button>
				  </div>
				</article>
	      	</form>
		</div>
	</div>
</body>

</html>