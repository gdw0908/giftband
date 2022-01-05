<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes" name="viewport" />
<meta name="author" content="31system" />
<meta name="description" content="안녕하세요  티켓모아 입니다." />
<meta name="Keywords" content="티켓모아, 음향기기, 중고음향기기, 중고악기, 중고 쇼핑몰, 중고 악기 쇼핑몰, 중고 음향기기 쇼핑몰" />

<title>로그인</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/lib/css/common.css" type="text/css">
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">

<script type="text/javascript" src="/lib/js/jquery.cookie.js"></script>
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script type="text/javascript" src="/lib/js/common.js"></script>
<script type = "text/javascript">


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
	else
	{
		if(obj.id_save.checked){
			$.cookie("save_id", obj.member_id.value, { path: '/', expires: 365 });
		}else{
			$.cookie("save_id", "", { path: '/', expires: -1 });
		}

		return true;	
	}
}

function non_member(){
	if($("#receiver").val() == ""){
		alert("구매자를 입력해주세요.");
		$("#receiver").focus();
		return;
	}else if($("#orderno").val() == ""){
		alert("구매번호를 입력해주세요.");
		$("#orderno").focus();
		return;
	}else if($("#passwd").val() == ""){
		alert("주문비밀번호를 입력해주세요.");
		$("#passwd").focus();
		return;
	}else{
		$("#nonMemberFrm").submit();
	}
	
}

jQuery(document).ready(function(){
	jQuery("#nonMemberFrm").attr("autocomplete","Off");
	jQuery("#receiver").attr("autocomplete","Off");
	jQuery("#orderno").attr("autocomplete","Off");
	jQuery("#passwd").attr("autocomplete","Off");	
	if(!!$.cookie("save_id")){
		jQuery("#member_id").val($.cookie("save_id"));
		jQuery("#id_save").attr("checked", true);
	}
})

</script>
</head>

<body>

    <div class="title_rocation">
<!--       <div class="tr_wrap"> -->
<!-- 			<h3>로그인</h3> -->
<!--       </div> -->
    </div>

    <div class="j_wrap">

<!--       <div class="j_visual"><img src="/images/join/jm_img1.gif" alt="국내최대 자동차 중고부품 쇼핑몰 PARTS MOA에 오신 것을 환영합니다"></div> -->

      <div id="tabNav_j1" class="join_tab login_tab">
<!--         <h4 id="tabNavTitle0101" class="on"> -->
<!--         	<a href="#" onclick="shwoTabNav('01', 2, 1); return false;" onfocus="this.onclick();">사업자회원</a> -->
<!--         </h4> -->
        <div id="tabNav0101" style="display: block;">

          <div class="login_wrap">
          	<h3 class="login_tit">로그인</h3>

            <form action="/giftcard/login/login.do" id="login_form" name="login_form" method="post" onsubmit = "return login_proc(this);">
            <input type = "hidden" name = "member" value = "1"/>
            <input type = "hidden" name = "mode" value = "proc"/>
            <fieldset>
            <legend>로그인</legend>
            <div class="login_con">
              <div class="login_box">
                <div class="l_left">
<!--                   <p> -->
<!--                   	<input type="text" id="member_id" name="member_id" placeholder="아이디" class="inputs"> -->
<!--                   </p> -->
<!--                   <p class="last"> -->
<!--                   	<input type="password" id="member_pw" name="member_pw" placeholder="패스워드"> -->
<!--                   </p> -->
						
          			<div class="input_div one">
         				 <div class="i">
           					 <i class="xi-user"></i>
         				 </div>
          				<div>
           					 <h5>ID</h5>
           					 <input type="text" class="input"  id="member_id" name="member_id">
          				</div>
        			</div>
        			<div class="input_div pass">
          				<div class="i">
            				<i class="xi-lock"></i>
          				</div>
          				<div>
           					 <h5>Password</h5>
            				<input type="password" class="input" id="member_pw" name="member_pw">
          				</div>
        			</div>
              <div class="btn_lnk">
                <ul>
                  <li class="first"><label style="cursor: pointer;"><input type="checkbox" id="id_save" name="id_save" class="check"><span class="icon"></span> 아이디저장</label></li>
                  <li><a href="/giftcard/join/join_2.do">회원가입</a></li>
                  <li><a href="/giftcard/join/id_search.do">아이디 찾기</a></li>
                  <li class="last"><a href="/giftcard/join/pw_search.do">비밀번호 찾기</a></li>
                </ul>
              </div>
                <div class="l_btn">
                	<button type="submit" class="login_btn">로그인</button>
                </div>
              </div>
            </div>

            </fieldset>
            </form>

          </div>

        </div>
<!--         <h4 id="tabNavTitle0102"> -->
<!--         	<a href="#" onclick="shwoTabNav('01', 2, 2); return false;" onfocus="this.onclick();">개인회원</a> -->
<!--         </h4> -->
        <div id="tabNav0102" style="display: none;">

          <div class="t_box1">
            <p>
            <strong class="c1">비회원으로 구매한 이력이 있는 경우에만 주문/배송조회가 가능합니다.</strong>  주문/배송조회 이외의 서비스는 회원가입 후 이용이 가능합니다.<br>
            <strong class="c1">주문번호가 기억나지 않으실 경우 고객센테로 문의주시기 바랍니다.</strong> <strong>(주문번호는 주문시 휴대폰으로 발송되오니 확인 바랍니다)</strong>
            </p>
          </div>

          <div class="licensee_2 licensee_pw">
			<form id="nonMemberFrm" name="nonMemberFrm" method="post" action="/mypage/shopping/state/non_member.do">
				<input type = "hidden" name = "member" value = "1"/>
            	<input type = "hidden" name = "mode" value = "nomember_view"/>
	            <dl class="type_2">
	            <dt>주문번호를 입력해 주세요</dt>
	            <dd><span class="standard">구매자</span><span><input type="text" id="receiver" name="receiver" class="input_1 ws_2" placeholder="구매자명을 입력해주세요."></span></dd>
	            <dd><span class="standard">주문번호</span><span><input type="text" id="orderno" name="orderno" class="input_1 ws_2" placeholder="주문번호를 입력해주세요."></span></dd>
	            <dd>
	            <span class="standard">주문비밀번호</span>
	            <input type="text" name="fakevalue" value="none" style="display:none">
	            <span><input type="password" id="passwd" name="passwd" class="input_1 ws_2" placeholder="주문비밀번호를 입력해주세요."></span>
	            </dd>
	            </dl>
			</form>
          </div>

          <div class="pw_s_btn">
            <a href="javascript:non_member()">비회원 주문/배송조회</a>
          </div>

		  <div class="b_gui">
            <p class="gui_l"><span class="text">아직 티켓모아 회원이 아니세요?</span><span><a href="/giftcard/join/join_1.do"><img class="btn" src="/images/join/btn_join.gif" alt="회원가입"></a></span></p>
          </div>

        </div>
      </div>
      <script type="text/javascript">
      //login focus
      const inputs = document.querySelectorAll('.input');

      function addcl() {
        const parent = this.parentNode.parentNode;
        parent.classList.add('focus');
      }

      function remcl() {
        const parent = this.parentNode.parentNode;
        if(this.value === '') {
          parent.classList.remove('focus');
        }
      }

      inputs.forEach(input => {
        input.addEventListener('focus', addcl);
        input.addEventListener('blur', remcl);
      });
      
      
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
      <c:if test="${param.mode == 'guest'}">      
      shwoTabNav('01', 2, 2);
      </c:if>
      </script>

    </div>
</body>
</html>
