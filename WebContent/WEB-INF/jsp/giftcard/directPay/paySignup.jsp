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
  <title>기프트밴드 회원가입</title>


  <!-- Faivicon -->
  <link rel="icon" type="image/png" href="/images/directPay/favicon.ico">

  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css?">
  <link rel="stylesheet" href="/lib/css/reset.css">
  <link rel="stylesheet" href="/lib/css/common_dc.css">
  <link rel="stylesheet" href="/lib/css/style.css">

  <!-- jQuery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js?"></script>
  <script type="text/javascript" src="/lib/js/mc.js"></script>

</head>

<script type="text/javascript">
function join_form_chk() {
	if(jQuery("#ef_chk").is(":checked") == false)
	{
		alert("서비스 이용약관 동의 체크를 해주세요.");
		$("#ef_chk").focus();
		return false;
	}else if(jQuery("#ps_chk").is(":checked") == false)
	{
		alert("개인정보 수집 및 이용안내 동의 체크를 해주세요.");
		$("#ps_chk").focus();
		return false;
	}
	if (jQuery("#member_id").val() == ""
	       || jQuery("#member_id").val().length < 5) {
	    alert("아이디를 입력하지 않았거나 5자리 이상 등록해야합니다.");
	    $("#member_id").val("");
	    $("#member_id").focus();
	    return false;
	} else if (jQuery("#member_id_chk").val() == "") {
		alert("아이디 중복확인을 진행해주세요.");
		return false;
	} else if (!CheckPassword(jQuery("#member_id").val(), jQuery(
    "#member_pw").val())) {
        alert("비밀번호는 5~15글자 이내\n영문 대/소문자, 숫자를 조합해야합니다.");
        jQuery("#member_pw").val("");
        jQuery("#member_pw").focus();
        return false;
     }
}

function CheckPassword(uid, upw) {
    if (upw == "") {
       return false;
    }

    if (!/^[a-zA-Z0-9]{5,15}$/.test(upw)) {
       return false;
    }

    var chk_num = upw.search(/[0-9]/g);
    var chk_eng = upw.search(/[a-z]/ig);

    if (chk_num < 0 || chk_eng < 0) {
       return false;
    }

    if (/(\w)\1\1\1/.test(upw)) {
       return false;
    }

    /*if (upw.search(uid) > -1) {
       return false;
    }*/

    return true;
}

function chk_member_id() {
    if (jQuery("#member_id").val() == "") {
       alert("아이디를 입력하세요.");
       jQuery("#member_id").val("");
       jQuery("#member_id").focus();
       return;
    } else {
       getJSON("/json/list/member.getMemberIdCheck.do", {
          "member_id" : jQuery("#member_id").val()
       }, function(data) {
          $("body").data("chk_member_id", data);
          var chk_member_id = $("body").data("chk_member_id");

          $.each(chk_member_id, function() {
             var data = this["member_id"];
          });

          if (data == "" || data == null) {
             //jQuery("#check_member_id").html("사용 가능한 아이디 입니다.");
             alert("사용 가능한 아이디 입니다.");
             jQuery("#member_id_chk").val("Y");
             return;
          } else {
             //jQuery("#check_member_id").html("이미 가입 되어있는 아이디 입니다.");
             alert("이미 가입 되어있는 아이디 입니다.")
             jQuery("#member_id").val("");
             jQuery("#member_id").focus();
             return;
          }

       });
    }

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
      <h2 class="main_tit">회원가입</h2>
      <section class="terms_container">
        <h5 class="title">약관 동의</h5>
        <div class="terms_wrap">
          <article>
            <div class="box">
              <h6>제1조 (구매자의 서비스 이용)</h6>
              <ol>
                <li>
                  1. 구매자는 구매의사 없이 판매자의 상품에 입찰하거나 구매표시를 하여서는 아니 되며, 구매의사 없이 입찰행위를 통하여 상품의 가격을 올리거나 구매의사를 표시하여 판매자의 상품판매의 기회를 방해하거나 다른 구매자의
                  구매기회를 방해한 것이 적발되는 경우 기프트밴드쇼핑몰 운영자는 해당 아이디에 대하여 회원자격을 정지하는 등의 조치를 취할 수 있습니다.
                </li>
                <li>
                  2. 구매자는 상품을 구매하기 전에 반드시 판매자가 사이트 내에 작성한 상품의 상세 내용과 거래의 조건을 정확하게 확인한 후 구매를 하여야 합니다. 구매하려는 상품의 내용과 거래의 조건을 확인하지 않고 구매하여
                  발생한 모든 손실, 손해는 구매자 본인에게 있습니다.
                </li>
                <li>
                  3. 구매자는 이 약관 및 기프트밴드쇼핑몰 운영자가 서비스 화면에서 고지하는 내용을 준수하여야 하며, 약관 및 고지내용을 위반하거나 이행하지 아니하여 발생하는 모든 손실, 손해에 대하여 책임을 부담합니다.
                </li>
                <li>
                  4. 기프트밴드쇼핑몰 운영자는 판매자가 상품 등록한 상품의 내용과 거래조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 구매자는 상품 구매 시 스스로의 책임 하에 상품을 구매하여야 합니다.
                </li>
                <li>
                  5. 구매자는 구매한 상품에 청약철회의 원인이 발생한 경우 수령한 상품을 임의로 사용하거나 훼손되도록 방치하여서는 안 됩니다. 청약철회 상품의 임의사용이나 상품보관의 미흡으로 인한 상품훼손에 대하여 합당한 비용을
                  부담하여야 합니다.
                </li>
                <li>
                  6. 구매자는 판매자와 상품매매 절차에서 분쟁이 발생한 경우 분쟁의 해결을 위하여 성실히 임하여야 하며, 분쟁해결의 불성실로 인하여 판매자와 기프트밴드쇼핑몰 운영자에 발생한 모든 손실, 손해를 부담하여야 합니다.
                </li>
                <li>
                  7. 구매자는 상품의 구매 시 결제방법을 사용함에 있어 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단의 임의사용 등을 하여서는 안 됩니다. 타인의 결제수단을 임의 사용함으로써 발생하는
                  기프트밴드쇼핑몰 운영자, 결제수단 소유자, 판매자의 손실과 손해에 대한 모든 책임은 구매자에게 있습니다.
                </li>
                <li>
                  8. 매매대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 부담하여야 합니다.
                </li>
                <li>
                  9. 상품을 주문한 후 7영업일(토요일, 공휴일 제외)이내에 매매대금을 결제하지 않을 경우 주문취소로 간주되며, 해당 주문은 자동 취소됩니다.
                </li>
                <li>
                  10. 기프트밴드쇼핑몰 운영자는 구매자가 매매대금 결제 시 사용한 결제수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나 해당거래를 취소할
                  수 있습니다.
                </li>
              </ol>
            </div>

            <p class="agreement agree_box">
              <span>서비스 이용약관</span>
              <label style="cursor: pointer;">
                <input type="checkbox" id="ef_chk" name="ef_chk" class="check">
                <span class="icon"></span> [필수] 동의합니다.
              </label>
            </p>
          </article>

          <article>
            <div class="box">
              <h6>제1조 (구매자의 서비스 이용)</h6>
              <ol>
                <li>
                  1. 구매자는 구매의사 없이 판매자의 상품에 입찰하거나 구매표시를 하여서는 아니 되며, 구매의사 없이 입찰행위를 통하여 상품의 가격을 올리거나 구매의사를 표시하여 판매자의 상품판매의 기회를 방해하거나
                  다른 구매자의
                  구매기회를 방해한 것이 적발되는 경우 기프트밴드쇼핑몰 운영자는 해당 아이디에 대하여 회원자격을 정지하는 등의 조치를 취할 수 있습니다.
                </li>
                <li>
                  2. 구매자는 상품을 구매하기 전에 반드시 판매자가 사이트 내에 작성한 상품의 상세 내용과 거래의 조건을 정확하게 확인한 후 구매를 하여야 합니다. 구매하려는 상품의 내용과 거래의 조건을 확인하지 않고
                  구매하여
                  발생한 모든 손실, 손해는 구매자 본인에게 있습니다.
                </li>
                <li>
                  3. 구매자는 이 약관 및 기프트밴드쇼핑몰 운영자가 서비스 화면에서 고지하는 내용을 준수하여야 하며, 약관 및 고지내용을 위반하거나 이행하지 아니하여 발생하는 모든 손실, 손해에 대하여 책임을
                  부담합니다.
                </li>
                <li>
                  4. 기프트밴드쇼핑몰 운영자는 판매자가 상품 등록한 상품의 내용과 거래조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 구매자는 상품 구매 시 스스로의 책임 하에 상품을 구매하여야 합니다.
                </li>
                <li>
                  5. 구매자는 구매한 상품에 청약철회의 원인이 발생한 경우 수령한 상품을 임의로 사용하거나 훼손되도록 방치하여서는 안 됩니다. 청약철회 상품의 임의사용이나 상품보관의 미흡으로 인한 상품훼손에 대하여
                  합당한 비용을
                  부담하여야 합니다.
                </li>
                <li>
                  6. 구매자는 판매자와 상품매매 절차에서 분쟁이 발생한 경우 분쟁의 해결을 위하여 성실히 임하여야 하며, 분쟁해결의 불성실로 인하여 판매자와 기프트밴드쇼핑몰 운영자에 발생한 모든 손실, 손해를
                  부담하여야 합니다.
                </li>
                <li>
                  7. 구매자는 상품의 구매 시 결제방법을 사용함에 있어 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단의 임의사용 등을 하여서는 안 됩니다. 타인의 결제수단을 임의 사용함으로써 발생하는
                  기프트밴드쇼핑몰 운영자, 결제수단 소유자, 판매자의 손실과 손해에 대한 모든 책임은 구매자에게 있습니다.
                </li>
                <li>
                  8. 매매대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 부담하여야 합니다.
                </li>
                <li>
                  9. 상품을 주문한 후 7영업일(토요일, 공휴일 제외)이내에 매매대금을 결제하지 않을 경우 주문취소로 간주되며, 해당 주문은 자동 취소됩니다.
                </li>
                <li>
                  10. 기프트밴드쇼핑몰 운영자는 구매자가 매매대금 결제 시 사용한 결제수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나
                  해당거래를 취소할
                  수 있습니다.
                </li>
              </ol>
            </div>
                          
            <p class="agreement agree_box">
              <span>개인정보 수집 및 이용안내</span>
              <label style="cursor: pointer;">
                <input type="checkbox" id="ps_chk" name="ps_chk" class="check">
                <span class="icon"></span> [필수] 동의합니다.
              </label>
            </p>
          </article>
        </div>
      </section>

      <section>
        <h5 class="title">정보입력</h5>
        <form class="join_form" method="post" name="join_form" id="join_form"
               action="/giftband/paySignupProc.do" onsubmit="return join_form_chk();">
          <ul class="join_wrap">
            <li class="join_list">
              <ul>
                <li>아이디</li>
                <li>
	                <input type="text" id="member_id" name="member_id" class="join_input" placeholder=" 5 ~15자의 영문과 숫자만 사용 가능합니다.">&nbsp;
	                <button type="button" onclick="chk_member_id();" class="overlap_btn" style="color: #fff;">중복확인</button>
	                <input  type="hidden" name="member_id_chk" id="member_id_chk" value="" />
				</li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>비밀번호</li>
                <li><input type="text" class="join_input" id="member_pw" name="member_pw" placeholder="비밀번호을 입력해주세요."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>비밀번호확인</li>
                <li><input type="text" class="join_input" id="member_pw_chk" name="member_pw_chk" placeholder="비밀번호를 다시한번 입력해 주세요."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>이름</li>
                <li><input type="text" class="join_input" id="member_nm" name="member_nm" placeholder="성함을 입력해주세요."></li>
              </ul>
            </li>
            <li class="join_list">
              <ul>
                <li>휴대폰번호</li>
                <li><input type="tel" class="join_input" id="cell" name="cell" placeholder="휴대폰 번호를 숫자만 입력해주세요."></li>
              </ul>
            </li>
          </ul>
          <button type="submit" class="main_btn" style="margin: auto;">가입하기</button>
        </form>
      </section>

    </div>
  </div>
</body>

</html>