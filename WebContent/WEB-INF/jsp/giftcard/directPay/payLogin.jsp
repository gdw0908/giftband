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
  <title>����Ʈ��� �α���</title>


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
			alert("���̵� �Է��ϼ���.");
			obj.member_id.focus();
			return false;
		}
		else if(obj.member_pw.value == "")
		{
			alert(" �н����带 �Է��ϼ���.");
			obj.member_pw.focus();
			return false;
		}
		return true;
	}
</script>
<body>
  <header>
    <h1>
      <img src="/images/directPay/logo.svg" alt="����Ʈ���">
    </h1>
  </header>

  <div class="container">
    <div class="inner">
      <h2 class="main_tit">�α���</h2>
      <article>
        <form class="login_form" action="/giftband/payLoginChk.do" id="frm" name="frm" method="post" onsubmit = "return login_proc(this);">
          <div class="input_wrap">
            <input type="text" class="login_input" placeholder="���̵�" id="member_id" name="member_id">
            <input type="password" class="login_input pw_input" placeholder="��й�ȣ" id="member_pw" name="member_pw">
          </div>
          <button type="submit" class="main_btn">�α���</button>
          <a href="/giftband/paySignup.do">���� ȸ���� �ƴϽŰ���?</a>
        </form>
      </article>

      <article class="info_list_box">
        <ul>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              ��ǰ���� �����Ϸ��� ���� 1ȸ<br>
              ȸ�������� �ʿ��մϴ�.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              ���� �̿� ���̽� ����Ʈ�� ������ ����<br>
              (�̸�, ID ��)�� �����Ͻñ� �ٶ��ϴ�.
            </span>
          </li>
          <li>
            <img src="/images/directPay/check_icon.png" />
            <span>
              ������ ������ ��ǰ�� �������� ������<br>
              �����ؾ߸� ���� ����ڰ�<br>
              �� ������ ��ġ��ų �� �ֽ��ϴ�.
            </span>
          </li>
        </ul>
      </article>
    </div>
  </div>
</body>
</html>