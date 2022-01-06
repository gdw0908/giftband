<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta
	content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes"
	name="viewport" />
<meta name="author" content="31system" />
<meta name="description" content="안녕하세요  티켓크루 입니다." />
<meta name="Keywords" content="티켓크루, 상품권, 백화점 상품권, 롯데 백화점, 롯데 상품권, 갤러리아 백화점, 갤러리아 상품권, 신세계 백화점, 신세계 상품권" />
<title>아이디찾기</title>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">
<script type="text/javascript" src="/lib/js/common.js"></script>
<script type="text/javascript">

function phone_chk_submit(obj) {
	if(jQuery("#member_nm").val() == "")
	{
		alert("이름을 입력하세요.");
		jQuery("#member_nm").val("");
		jQuery("#member_nm").focus();
		return false;
	}
	else if(jQuery("#cell1").val() == "" || isNaN(jQuery("#cell1").val()))
	{
		alert("전화번호를 입력하지 않았거나 숫자만 입력가능합니다.");	
		jQuery("#cell1").val("");
		jQuery("#cell1").focus();
		return false;
	}
	else if(jQuery("#cell2").val() == "" || isNaN(jQuery("#cell2").val()))
	{
		alert("전화번호를 입력하지 않았거나 숫자만 입력가능합니다.");	
		jQuery("#cell2").val("");
		jQuery("#cell2").focus();
		return false;
	}
	else if(jQuery("#cell3").val() == "" || isNaN(jQuery("#cell3").val()))
	{
		alert("전화번호를 입력하지 않았거나 숫자만 입력가능합니다.");	
		jQuery("#cell3").val("");
		jQuery("#cell3").focus();
		return false;
	}
	else
	{
		return true;
	}
}

function email_chk_submit(obj)
{
	if(jQuery("#member_nm1").val() == "")
	{
		alert("이름을 입력하세요.");
		jQuery("#member_nm1").val("");
		jQuery("#member_nm1").focus();
		return false;
	}
	else if(jQuery("#email").val() == "")
	{
		alert("이메일을 입력하세요.");	
		jQuery("#email").val("");
		jQuery("#email").focus();
		return false;
	}
	else if(!chk_email(jQuery("#email").val()))
	{
		alert("입력하신 이메일 형식이 올바르지 않습니다. 다시 입력하세요.");	
		jQuery("#email").val("");
		jQuery("#email").focus();
		return false;
	}
	else
	{
		return true;
	}
}


function chk_email(value)
{
	var pattern = new RegExp(/^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/);
	
	return pattern.test(value);
}
</script>
</head>

<body>
	<div class="title_rocation"></div>
	<div class="j_wrap">
		<h3 class="tit">아이디찾기</h3>
		<h4 class="login_subtit">티켓모아쇼핑몰 회원정보에 등록되어있는 정보 중 1가지를 택하여 입력해 주세요. 등록정보로 ID의 일부를 찾을 수 있습니다.</h4>
		<div id="tabNav_j1" class="join_tab search_tab">
			<div id="tab-1" id="tabNav0101" class="tab-content current">
				<div class="authentication auth_2">
					<div class="phone phone_2">
						<form name="phoneSearch" method="post"
							action="/giftcard/join/id_search_2.do"
							onsubmit="return phone_chk_submit(this);">
							<input type="hidden" name="mode" value="search" /> <input
								type="hidden" name="tab_val" value="2" />
							<dl class="type_2">
								<dt>휴대폰 번호로 찾기</dt>
								<dd>
									<span class="standard">이름</span>
									<span>
										<input type="text" id="member_nm" name="member_nm" class="input_1 ws_2"  placeholder= "띄어쓰기 없이 입력해주세요.">
									</span>
								</dd>
								<dd>
									<span class="standard">휴대폰</span>
									<span>
										<input type="text" id="cell1" name="cell1" class="input_1 ws_1" maxlength="3"> - 
										<input type="text" id="cell2" name="cell2" class="input_1 ws_1" maxlength="4"> - 
										<input type="text" id="cell3" name="cell3" class="input_1 ws_1" maxlength="4">
									</span>
								</dd>
								<dd class="btn">
									<input type="submit" value="조회" class="search_btn">
								</dd>
							</dl>
						</form>
					</div>
					<div class="ipin">
						<form name="emailSearch" method="post" action="/giftcard/join/id_search_2.do" onsubmit="return email_chk_submit(this);">
							<input type="hidden" name="mode" value="search" />
							<input type="hidden" name="tab_val" value="2" />
							<dl class="type_2 type_2_2">
								<dt>이메일 주소로 찾기</dt>
								<dd>
									<span class="standard">이름</span>
									<span>
										<input type="text" id="member_nm1" name="member_nm1" class="input_1 ws_2" placeholder= "띄어쓰기 없이 입력해주세요.">
									</span>
								</dd>
								<dd>
									<span class="standard">이메일</span> <span> <input
										type="text" id="email" name="email" class="input_1 ws_2">
									</span>
								</dd>
								<dd class="btn">
									<input type="submit" value="조회" class="search_btn">
								</dd>
							</dl>
							<p class="find_pw"><a href="/giftcard/join/pw_search.do" class="find_pw_link">비밀번호 찾기</a></p>
						</form>
					</div>
				</div>
			</div>
			
			<article class="join_banner">
			<div class="text_wrap">
				<h5>아직 회원이 아니신가요?</h5>
				<p>회원가입하고 다양한 혜택과 첫구매 쿠폰을 받으세요.<a href="/giftcard/join/join_2.do">회원가입<img src="/images/common/join_arrow.png" alt="회원가입"></a></p>
			</div>
			<div class="img_wrap">
				<img src="/images/common/login_img.png" />
			</div>
		</article>
		</div>
		<script type="text/javascript">
	// tabs
  	$(function() {
	  $('ul.tabs li').click(function() {
	    var tab_id = $(this).attr('data-tab');
	    
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	    
	    $(this).addClass('current');
	    $('#' + tab_id).addClass('current');
	  });
	});

      </script>
	</div>
</body>
</html>
