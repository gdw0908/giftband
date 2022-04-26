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
  <title>기프트밴드 로그인</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/reset.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/common_dc.css" type="text/css">
  <link rel="stylesheet" href="/lib/css/style.css" type="text/css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>
<script type="text/javascript">
  function login_proc(obj) {
		if(obj.member_id.value == "")
		{
			alert("아이디를 입력하세요.");
			obj.member_id.focus();
			return false;
		}
		else if(obj.member_pw.value == "")
		{
			alert(" 패스워드를 입력하세요.");
			obj.member_pw.focus();
			return false;
		}
		return true;
	}
</script>
<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="기프트밴드">
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit">로그인</h2>
      <article>
        <form class="login_form" action="/giftband/payLoginChk.do" id="frm" name="frm" method="post" onsubmit = "return login_proc(this);">
          <div class="input_wrap">
            <input type="text" class="login_input" placeholder="아이디" id="member_id" name="member_id">
            <input type="password" class="login_input pw_input" placeholder="비밀번호" id="member_pw" name="member_pw">
          </div>
          <button type="submit" class="main_btn">로그인</button>
          <a href="/giftband/paySignup.do">아직 회원이 아니신가요?</a>
        </form>
      </article>

      <article class="info_list_box">
        <ul>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              상품권을 구매하려면 최초 1회<br>
              회원가입이 필요합니다.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              현재 이용 중이신 사이트와 동일한 정보<br>
              (이름, ID 등)로 가입하시기 바랍니다.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              고객님의 정보와 상품권 구매자의 정보가<br>
              동일해야만 서비스 담당자가<br>
              두 정보를 일치시킬 수 있습니다.
            </span>
          </li>
        </ul>
      </article>
    </div>
  </div>
</body>
</html>