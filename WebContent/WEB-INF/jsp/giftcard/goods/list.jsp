<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="dtf" uri="/WEB-INF/tlds/DateUtil_fn.tld" %>
<%@ taglib prefix="suf" uri="/WEB-INF/tlds/StringUtil_fn.tld" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
   <meta http-equiv="X-UA-Compatible" content="ie=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
   <meta name="format-detection" content="telephone=no" />
   <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=yes" name="viewport" />
   <title>상품상세</title>
   
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<!-- 파라미터 -->
<c:set var="paramset" value=""/>
<c:forEach var="item" items="${pageContext.request.parameterNames}">
   <c:if test="${!(item eq 'totalpage' || item eq 'cpage' || item eq 'rows' || item eq 'sort' || item eq 'focus' || item eq 'show')}">
   <c:choose>
      <c:when test="${paramset eq '' }">
         <c:set var="paramset" value="${paramset }?${item }=${param[item] }"/>
      </c:when>
      <c:otherwise>
         <c:set var="paramset" value="${paramset }&${item }=${param[item] }"/>
      </c:otherwise>
   </c:choose>
   </c:if>
</c:forEach>
<c:choose>
   <c:when test="${paramset eq '' }">
      <c:set var="paramset" value="?"/>
   </c:when>
   <c:otherwise>
      <c:set var="paramset" value="${paramset }&"/>
   </c:otherwise>
</c:choose>
<!-- //파라미터 -->
<script type="text/javascript">

$(document).ready(function(){
  // $(window).scrollTop($("#content_view").offset().top);
});
   
//#submenu
$("#submenu_open").toggle(function(){
   $("#sub_menu").slideToggle(250);
   this.src = "/images/sub/sub_menu_open.gif";
   }, function() {
   $("#sub_menu").slideToggle(250);
   this.src = "/images/sub/sub_menu_close.gif";
});

 
function changeMenu(){
   var upcodenoNumber = '';
   if($("#menu_id").val() == 'menu9'){
      upcodenoNumber = '6';
   }else{
      upcodenoNumber = $("#menu_id").val().replace("menu","");
   }
   $.getJSON("/json/list/old_code.codeList.do", {upcodeno : "05090100"+upcodenoNumber}, function(data){
      $("#part2_1").empty();
      $("#part2_1").append("<option value=''>선 택</option>");
      $.each(data, function(i, o){
         $("#part2_1").append("<option value='"+o.code+"'>"+o.code_nm+"</option>");
      });
   });
}

function replaceApplication(){
   if(confirm("조회 건수가 없습니다.\n부품문의로 이동하시겠습니까?")){
      location.href="/mypage/application/index.do";
   }
}

function changeCarmaker(){
   
   $.getJSON("/json/list/old_code.carmodel.do", {carmakerseq : $("#carmakerseq").val()}, function(data){
      $("#carmodelseq").empty();
      $("#carmodelseq").append("<option value=''>선 택</option>");
      $.each(data, function(i, o){
         $("#carmodelseq").append("<option value='"+o.carmodelseq+"'>"+o.carmodelnm+"</option>");
      });
   });
}

function changeCarmodel(){
   $.getJSON("/json/list/old_code.cargrade.do", {carmakerseq: $("#carmakerseq").val(),  carmodelseq: $("#carmodelseq").val()}, function(data){
      $("#cargradeseq").empty();
      $("#cargradeseq").append("<option value=''>선 택</option>");
      $.each(data, function(i, o){
         $("#cargradeseq").append("<option value='"+o.cargradeseq+"'>"+o.cargradenm+"</option>");
      });
   });
}

function changeSido(){
   $.getJSON("/json/list/code.sigungu.do", {sido: $("#sido").val()}, function(data){
      $("#sigungu").empty();
      $("#sigungu").append("<option value=''>시/군/구</option>");
      $.each(data, function(i, o){
         $("#sigungu").append("<option value='"+o.sigungu+"'>"+o.dong_nm+"</option>");
      });
   });
}

function changeSigungu(){
   $.getJSON("/json/list/code.dong.do", {sido: $("#sido").val(), sigungu: $("#sigungu").val()}, function(data){
      $("#dong").empty();
      $("#dong").append("<option value=''>읍/면/동</option>");
      $.each(data, function(i, o){
         $("#dong").append("<option value='"+o.dong+"'>"+o.dong_nm+"</option>");
      });
   });
}

function goSubmit(){
   $("#frm").submit();
}

function list(value)
{
   location.replace("${paramset}rows=" + value+"&show=${param.show}&sort=${param.sort}&focus=${param.focus}");
}

function go_url(url)
{   
   location.replace(url);

}

function frmreset(){
   <c:if test="${param.menu eq '' || param.menu eq null}">
   document.frm.menu.value = "";
   </c:if>
   document.frm.carmakerseq.value = "";
   document.frm.carmodelseq.value = "";
   document.frm.cargradeseq.value = "";
   document.frm.caryyyy.value = "";
   <c:if test="${param.menu eq 'menu1' || param.menu eq 'menu2' || param.menu eq 'menu3' || param.menu eq 'menu4' || param.menu eq '' || param.menu eq null}">
   document.frm.part2_1.value = "";
   </c:if>
   document.frm.grade.value = "";
   document.frm.sido.value = "";
   document.frm.sigungu.value = "";
   document.frm.dong.value = "";
   document.frm.keyword.value = "";
   document.frm.search_all_text.value = "";
}

function inquery_y(){
   alert("협의가 필요한 물품입니다.\n고객센터로 문의 바랍니다.");
}

function addCart(item_seq) {
	$("#cartFrm>[name='mode']").val("add_cart");
	$("#cartFrm>[name='seq']").val(item_seq);
	$("#cartFrm").submit();
	return false;
} 


function directOrder(item_seq){
   $("#cartFrm>[name='mode']").val("direct_order");
   $("#cartFrm>[name='seq']").val(item_seq);
   $("#cartFrm").submit();
   return false;
}

</script>
</head>

<body>
<div class="top_box">
	<article class="title_wrap">
		<h2 class="menu_tit">상품상세</h2>
		<img src="/images/common/title_bg_img.png" >
	</article>
</div>
   <div class="container">
    <div class="sub_line_bg">
      <div class="sub_line">
        <div class="sl_wrap">
<!--           <div class="sl_l" id="content_view"> -->
<%--              <c:choose> --%>
<%--                 <c:when test="${param.menu eq 'menu1' }"><h3>롯데</h3></c:when> --%>
<%--                 <c:when test="${param.menu eq 'menu2' }"><h3>신세계</h3></c:when> --%>
<%--                 <c:when test="${param.menu eq 'menu3' }"><h3>갤러리아</h3></c:when>                 --%>
<%--              </c:choose> --%>
<%--             <c:if test = "${not empty param.menu}"> --%>
<%--             <span>${param.cname }</span> --%>
<%--             </c:if> --%>
<!--              &gt; <span><strong>총 부품 : <b>${suf:getThousand(data.pagination.totalcount) }</b> 개</strong></span>  -->
<!-- <!--             </p> --> 
<!--           </div> -->
        </div>
      </div>
    
    <div class="sub_wrap product_container">       
        <div class="sub_contents">
         <div class="sc_top">
                <div class="sc_type">
                  <p class="total_item_count">총 상품 <span>${suf:getThousand(data.pagination.totalcount) }</span>개</p>
                </div>
                
                <ul class="sc_tab">
                  <li><a <c:if test = "${empty param.focus}">class="on"</c:if> href="javascript:go_url('${paramset }show=${param.show }&rows=${param.rows }');">최근등록순</a></li>
                  <li><a <c:if test = "${param.focus eq '1'}">class="on"</c:if> href="javascript:go_url('${paramset }sort=row&focus=1&show=${param.show }&rows=${param.rows }');">낮은가격</a></li>
                  <li class="last"><a <c:if test = "${param.focus eq '2'}">class="on"</c:if> href="javascript:go_url('${paramset }sort=high&focus=2&show=${param.show }&rows=${param.rows }');">높은가격</a></li>
                </ul>
            </div>
        
            <!-- 방명록 스타일 시작 -->
              <div class="sub_list">
              
                   <div class="list_item_wrap">
                      <ul class="item_wrap" style="height: 100%; background: none; ">
                       <c:if test="${empty data.list }"><li>조회 건수가 없습니다.</li></c:if>
                            <c:forEach var="item" items="${data.list }">
                         <li class="item_list">
                            <div class="item">
                               	<a href="javascript:void();" onclick="return addCart('${mdpart.item_seq }')" class="cart_box">
                               		<img src="/images/common/cart_icon.svg" alt="장바구니">
                               	</a>
                               <a href="javascript:void();" class="img_wrap">
                                   <img src="${item.thumb }" alt="${item.PRODUCTNM }">
                                   <span class="price">${suf:getThousand(item.USER_PRICE) }</span>
                                   <span class="product_name">${item.PRODUCTNM }</span>
                               </a>
                               <a class="purchase_btn"  href="view.do?menu=${param.menu }&seq=${item.item_seq }">바로 구매하기</a>
                            </div>
                         </li>
                         </c:forEach>
                      </ul>
                   </div>
                
               <jsp:include page="/giftcard/inc/paging2.do">
                  <jsp:param  name="cpage" value="${param.cpage }"/>
                  <jsp:param  name="rows" value="${param.rows }"/>
                  <jsp:param  name="totalpage" value="${data.pagination.totalpage }"/>
               </jsp:include>
      
              </div>

      </div>
    </div>
    <form id="cartFrm" name="cartFrm" method="post" action="/giftcard/mypage/shopping/cart/index.do">
       <input type="hidden" name="mode" value=""/>
       <input type="hidden" name="seq" value=""/>
       <input type="hidden" name="qty" value="1"/>
    </form>
    </div>
    </div>
</body>
