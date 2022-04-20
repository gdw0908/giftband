<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib prefix="dtf" uri="/WEB-INF/tlds/DateUtil_fn.tld" %>
<script language="javascript">
	function action(){
		popwindow = window.open('','pop_window','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=405,height=310');
		document.form.target = "pop_window";
		document.form.submit();
		popwindow.focus();
	}
</script>
<footer id="footer">
  <div class="c_top">
	  <ul>
	  	<li><a href="/giftcard/mypage/notice/index.do">공지사항</a></li>
	  	<li><a href="/giftcard/mypage/forces/index.do">문의하기</a></li>
	  	<li><a href="/giftcard/mypage/annc/annc1.do">이용약관</a></li>
	  	<li><a href="/giftcard/mypage/annc/annc2.do">전자금융거래약관</a></li>
	  	<li><a href="/giftcard/mypage/annc/annc4.do">E-mail 무단수집거부</a></li>
	  	<li><a href="/giftcard/mypage/annc/annc3.do">개인정보 취급방침</a></li>
	  	<li><a href="/giftcard/mypage/shopping/state/index.do?mode=list1">주문조회</a></li>
	  <!-- <li><a href="/mypage/mantoman/index.do">1:1문의</a></li> -->
	  </ul>
	</div>
  <div class="f_wrap">
    <div class="f_logo"><img src="/images/logo/footer_logo.svg" alt="티켓크루"></div>
    <div class="copy">
      <div class="c_bottom">
	  	<p>대표자 : 이상민 ㅣ 상호: (주)패스샵<br>
	  		사업자등록번호 : 240-87-01710   |   사업자주소 : 경기도 성남시 분당구 서현동 251-3 엘지분당에클라트 1109호<br>
	  	<p>대표번호 : 1522-7622   |   E-mail : passshop@gmail.com<br><span>Copyrightⓒpassshop.All Rights Reserved.</span></p>
	  </div>
    </div>
  </div>
</footer>