<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>
<%@ page import="com.mc.common.util.*" %>
<%
	String home_url = Util.getProperty("home.url");
	String namesitecd = Util.getProperty("name.namesitecd");
	String namesitepwd = Util.getProperty("name.namesitepwd");
	String ipinsitecd = Util.getProperty("ipin.ipinsitecd");
	String ipinsitepwd = Util.getProperty("ipin.ipinsitepwd");
	/* 실명인증 시작 */
    
	NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	

    
	String sSiteCode = namesitecd;				// NICE로부터 부여받은 사이트 코드
	String sSitePassword = namesitepwd;		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubun 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
    String sReturnUrl = home_url+"/CheckPlusSafe/checkplus_success.jsp";      // 성공시 이동될 URL
    String sErrorUrl = home_url+"/CheckPlusSafe/checkplus_fail.jsp";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    sEncData = niceCheck.getCipherData();
    
    /* 실명인증 끝*/
    
    /* IPIN 시작 */
    
    String sIpinSiteCode				= ipinsitecd;
	String sIpinSitePw					= ipinsitepwd;
	String sIpinReturnURL				= home_url+ "/IPIN/ipin_result.jsp";
	String sIpinCPRequest				= "";
	String sIpinEncData					= "";
	
	IPINClient pClient = new IPINClient();
	
	sIpinCPRequest = pClient.getRequestNO(sIpinSiteCode);
	
	session.setAttribute("CPREQUEST" , sIpinCPRequest);
	
	int iRtn = pClient.fnRequest(sIpinSiteCode, sIpinSitePw, sIpinCPRequest, sIpinReturnURL);
	
	sIpinEncData = pClient.getCipherData();
	
	
	/* IPIN 끝 */
%>
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
<title>비밀번호찾기</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/lib/css/join.css" type="text/css">
<script type="text/javascript" src="/lib/js/common.js"></script>
<script type = "text/javascript">


// function openPop()
// {
// 	if(document.getElementById("auth_member_nm_input").value == "")
// 	{
// 		alert("이름을 입력하세요.");
// 		document.getElementById("auth_member_nm_input").value = "";
// 		document.getElementById("auth_member_nm_input").focus();
// 		return;
// 	}
// 	else if(document.getElementById("member_id").value == "")
// 	{
// 		alert("아이디를 입력하세요.");
// 		document.getElementById("member_id").value = "";
// 		document.getElementById("member_id").focus();
// 		return;
// 	}
// 	else
// 	{
// 		if(document.pw_search_method.CheckUser[0].checked == true)
// 		{
// 			checkReadName();
// 		}
// 		else
// 		{
// 			iPinPop();
// 		}
		
// 	}
	
// }

function checkReadName()
{
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.target = "popupChk";
	document.form_chk.submit();

}

function failCerti()
{
	alert("인증에 실패하였습니다. 다시 시도 하여주십시오.\n계속 문제가 발생할 경우 관리자에게 문의하시기 바랍니다.");
	return;
}

function go_next(str, ipin)
{
	alert("인증이 완료 되었습니다.");

	document.next_step.auth_member_nm.value = str;
	document.next_step.member_id.value = document.getElementById("member_id").value;
	document.next_step.auth_member_nm_1.value = document.getElementById("auth_member_nm_input").value;
	document.next_step.ipin.value = ipin;
	document.next_step.submit();
}

function iPinPop(){
	window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_ipin.target = "popupIPIN2";
	document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
	document.form_ipin.submit();
}

function search_email_form_fnc()
{
	if(document.getElementById("email_member_nm").value == "")
	{
		alert("이름을 입력하세요.");
		document.getElementById("email_member_nm").focus();
		document.getElementById("email_member_nm").value = "";
		return false;
	}
	else if(document.getElementById("email_member_id").value == "")
	{
		alert("아이디를 입력하세요.");
		document.getElementById("email_member_id").focus();
		document.getElementById("email_member_id").value = "";
		return false;
	}
	else if(document.getElementById("email").value == "")
	{
		alert("이메일을 입력하세요.");
		document.getElementById("email").focus();
		document.getElementById("email").value = "";
		return false;
	}
	else
	{
		if(confirm("개인회원은 개인탭에서 기업회원은 기업탭에서 검색 을 하셔야 정확하게 비밀번호를 찾으 실수 있습니다. 진행하시겠습니까?"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

/* function busi_search_form_chk()
{
	if(document.getElementById("busi_member_id").value == "")
	{
		alert("아이디를 입력하세요.");
		document.getElementById("busi_member_id").value = "";
		document.getElementById("busi_member_id").focus();
		return false;
	}
	else if(document.getElementById("busi_nm").value == "")
	{
		alert("상호명을 입력하세요.");
		document.getElementById("busi_nm").value = "";
		document.getElementById("busi_nm").focus();
		return false;
	}
	else if(document.getElementById("busi_no1").value == "" || isNaN(document.getElementById("busi_no1").value))
	{
		alert("사업자등록번호를 입력하지 않았거나 숫자만 입력가능합니다.");
		document.getElementById("busi_no1").value = "";
		document.getElementById("busi_no1").focus();
		return false;
	}
	else if(document.getElementById("busi_no2").value == "" || isNaN(document.getElementById("busi_no2").value))
	{
		alert("사업자등록번호를 입력하지 않았거나 숫자만 입력가능합니다.");
		document.getElementById("busi_no2").value = "";
		document.getElementById("busi_no2").focus();
		return false;
	}
	else if(document.getElementById("busi_no3").value == "" || isNaN(document.getElementById("busi_no3").value))
	{
		alert("사업자등록번호를 입력하지 않았거나 숫자만 입력가능합니다.");
		document.getElementById("busi_no3").value = "";
		document.getElementById("busi_no3").focus();
		return false;
	}
	else
	{
		if(confirm("개인회원은 개인탭에서 기업회원은 기업탭에서 검색 을 하셔야 정확하게 비밀번호를 찾으 실수 있습니다. 진행하시겠습니까?"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
} */

</script>
</head>

<body>
<div class="j_wrap">
   <h3 class="tit">비밀번호 찾기</h3>
  <div id="tabNav_j1" class="join_tab pw_search_tab">
<!--     <h4 id="tabNavTitle0101" class="on"><a href="#" onclick="shwoTabNav('01', 2, 1); return false;" onfocus="this.onclick();">사업자회원</a></h4> -->
	<!-- <ul class="tabs">
		<li class="tab_link current" data-tab="tab-1">개인회원 비밀번호찾기</li>
		<li class="tab_link" data-tab="tab-2">사업자회원 비밀번호찾기</li>
	</ul> -->
    <div id="tab-1" id="tabNav0101" class="tab-content current">
      <div class="t_box1">
        <p><strong>개인회원이신경우</strong> :&nbsp;&nbsp;&nbsp;① 휴대폰 또는 아이핀 또는 이메일 인증정보 기재&nbsp;&nbsp;&nbsp;② 본인인증 완료 후 비밀번호 재발급</p>
        <!-- <p><strong>사업자회원이신경우</strong> :&nbsp;&nbsp;&nbsp;① 사업자 인증정보 기재&nbsp;&nbsp;&nbsp;② 이메일 전송 선택&nbsp;&nbsp;&nbsp;③ 선택한 인증 방식으로 비밀번호 재발급</p> -->
      </div>
      <div class="authentication auth_2">
        <div class="ipin ipin_3">
        <form name = "search_email_form" id = "search_email_form" method = "post" action = "/giftcard/join/pw_search_2.do" onsubmit = "return search_email_form_fnc();">
            <input type = "hidden" name = "mode" id = "mode" value = "pw_search"/>
          <dl class="type_2 type_2_2">
          <dt>
          이메일 본인인증 <span>회원님이 가입하신 이메일주소를 통해 비밀번호를 찾을 수 있습니다.</span>
            </dt>
            <dd><span class="standard">이름</span><span>
              <input type="text" id="email_member_nm" name="member_nm" class="input_1">
              </span></dd>
            <dd><span class="standard">아이디</span><span>
              <input type="text" id="email_member_id" name="member_id" class="input_1 ws_2">
              </span></dd>
            <dd> <span class="standard">이메일</span> <span>
              <input type="text" id="email" name="email" class="input_1 ws_2">
              </span> </dd>
            <dd class="btn">
              <input type = "submit" value="확인" class="search_btn" style="padding: 10px 25px;">
            </dd>
            </dl>
          </form>
        </div>
      </div>
      <div class="b_gui_2">
        <p><strong>위의 방법으로도 찾지 못했다면, 티켓모아쇼핑몰 고객센터로 문의주십시오</strong><br>
          고객센터 전화문의 : 1566-6444 (상담가능시간: 평일 오전 9시~오후 6시)</p>
      </div>
    </div>
<!--     <h4 id="tabNavTitle0102"><a href="#" onclick="shwoTabNav('01', 2, 2); return false;" onfocus="this.onclick();">개인회원</a></h4> -->
    <!-- <div id="tab-2" id="tabNav0102" class="tab-content">
      <div class="t_box1">
        <p><strong>개인회원이신경우</strong> :&nbsp;&nbsp;&nbsp;① 이메일 인증정보 기재&nbsp;&nbsp;&nbsp;② 본인인증 완료 후 비밀번호 재발급</p>
        <p><strong>사업자회원이신경우</strong> :&nbsp;&nbsp;&nbsp;① 사업자 인증정보 기재&nbsp;&nbsp;&nbsp;② 이메일 인증 방식으로 비밀번호 재발급</p>
      </div>
      <form name = "busi_search_form" id = "busi_search_form" method = "post" action = "/giftcard/join/pw_search_2.do" onsubmit = "return busi_search_form_chk();">
        <input type = "hidden" name = "mode" id = "mode" value = "pw_search"/>
      <div class="licensee_2 licensee_pw">
        <dl class="type_2">
          <dt>사업자 회원정보로 비밀번호찾기</dt>
          <dd><span class="standard">아이디</span><span>
            <input type="text" id="busi_member_id" name="member_id" class="input_1 ws_2">
            </span></dd>
          <dd><span class="standard">상호명</span><span>
            <input type="text" id="busi_nm" name="busi_nm" class="input_1 ws_2">
            </span></dd>
          <dd> <span class="standard">사업자등록번호</span> <span>
            <input type="text" id="busi_no1" name="busi_no1" class="input_1 ws_1" maxlength = "3">
            -
            <input type="text" id="busi_no2" name="busi_no2" class="input_1 ws_1"  maxlength = "2">
            -
            <input type="text" id="busi_no3" name="busi_no3" class="input_1 ws_1"  maxlength = "5">
            </span> </dd>
        </dl>
        </div> -->
        <div class="pw_s_btn">
          <input type = "submit" value="이메일로 비밀번호 발급받기">
        </div>
      </form>
      <div class="b_gui_2">
        <p><strong>위의 방법으로도 찾지 못했다면, 티켓모아쇼핑몰 고객센터로 문의주십시오</strong><br>
          고객센터 전화문의 : 11661-8431 (상담가능시간: 평일 오전 9시~오후 6시)</p>
      </div>
    </div>
  </div>
  <script type="text/javascript">
	//tabs
	$(function() {
	  $('ul.tabs li').click(function() {
	    var tab_id = $(this).attr('data-tab');
	    
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	    
	    $(this).addClass('current');
	    $('#' + tab_id).addClass('current');
	  });
	});
//       function shwoTabNav(eName, totalNum, showNum) {
//       	for(i=1; i<=totalNum; i++){
//       		var zero = (i >= 10) ? "" : "0";
//       		var e = document.getElementById("tabNav" + eName + zero + i);
//       		var eTitle = document.getElementById("tabNavTitle" + eName + zero + i);
//       		e.style.display = "none";
//       		eTitle.className = "";
//       	}

//       	var zero = (showNum >= 10) ? "" : "0";
//       	var e = document.getElementById("tabNav" + eName + zero + showNum);
//       	var eTitle = document.getElementById("tabNavTitle" + eName + zero + showNum);
//       	e.style.display = "block";
//       	eTitle.className = "on";
//       }
      </script> 
</div>
<form name="form_chk" method="post">
  <input type="hidden" name="m" value="checkplusSerivce">
  <input type="hidden" name="EncodeData" value="<%= sEncData %>">
</form>
<form name="form_ipin" method="post">
  <input type="hidden" name="m" value="pubmain">
  <input type="hidden" name="enc_data" value="<%= sIpinEncData %>">
</form>
<form name="vnoform" method="post">
  <input type="hidden" name="enc_data">
</form>
<form name = "next_step" id = "next_step" method = "post" action = "/giftcard/join/pw_search_2.do">
  <input type = "hidden" name = "auth_member_nm" id = "auth_member_nm" value = ""/>
  <input type = "hidden" name = "mode" id = "mode" value = "pw_search"/>
  <input type = "hidden" name = "member_id" id = "member_id" value = ""/>
  <input type = "hidden" name = "ipin" id = "ipin" value = ""/>
  <input type = "hidden" name = "auth_member_nm_1" id = "auth_member_nm_1" value = ""/>
</form>
</body>
</html>
