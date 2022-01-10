<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>티켓크루 관리시스템</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="/lib/css/cmsbase.css" rel="stylesheet" type="text/css" />
<link href="/lib/css/cmsadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function logout(){
	window.top.location.href = "/giftcard/admin/login.do?mode=logout";
}
</script>
</head>
<body>
<div id="headerwrap">

  	<h1>
  		<a href="javascript:window.top.location.reload();">
  			<img src="/images/admin/header/admin_logo.svg" alt="TICKETCREW" />
  		</a>
  		<span>상품권관리&nbsp;<span>통합관리시스템</span></span>
  	</h1>

	  <div class="admin_profile">
	    <p class="profileico">
	    	<i class="xi-user"></i>
	    	<span>${sessionScope.member.member_nm }</span>님 이 로그인 하셨습니다.
	    </p>
	    <p class="profileicob"><a href="javascript:logout()">로그아웃</a></p>
	  </div>
	
</div>
</body>
</html>
