<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#mydate').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: 'yymm',
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    });
});

function fn_detail(){
	location.href="adminSalesDetail.do";
}
</script>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}

.table tr:hover {
	background-color: #f8f6ff;
}

</style>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<!-- <h2>트레이너 승인</h2> -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
				
	<section class="classes spad">
		<div class="container">
			<h3 style="text-align: center;">상세보기</h3>
			<br>
			<div class="classes__filter">
			 <button type="button" class="btn btn-outline-primary" style="float:right;">일괄 정산</button>
			 <br/><br/><br/>
			<table class="table" style="text-align: center;">
				<thead>
					<tr style="background: #6d7ab0; color: white;font-size: 1.1em;">
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col" >강의명</th>
						<th scope="col" >총금액</th>
						<th scope="col" >수수료</th>
						<th scope="col" >실수령액</th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:forEach var="result" items="${adminLessonList}" varStatus="status"> --%>
					
					<tr>
					 
						<td>oo</td>
						<td>oo</td>
						<td>oo</td>
						<td>oo</td>
						<td>oo</td>
						<td >oo</td>
					</tr>
<%-- 					</c:forEach> --%>
				</tbody>
			</table>
			<br>
			<div style="width: 100%;text-align: right;padding-right: 20px;font-weight: bold;">
			
<%-- 				<c:set var="total" value="${totalCount * 3200}" /> --%>
<%-- 				<fmt:formatNumber value="${totalCount}" type="number" var="numberType" /> --%>
				
<%-- 				<span style="background-color: #FFFF66">${fn:substring(chatAccountList[0].chatDate,0,4)}년 ${fn:substring(chatAccountList[0].chatDate,5,7)}월 총 상담 건수 : ${totalCount}건<br></span> --%>
<%-- 				<span style="background-color: #FFFF66">${fn:substring(chatAccountList[0].chatDate,0,4)}년 ${fn:substring(chatAccountList[0].chatDate,5,7)}월 정산금액(예정) : ${total}원</span> --%>
					<span>총 금액합계</span><br/>
					<span>총 수수료합계</span><br/>
					<span>총 실수령액합계</span>
			</div>
			<!-- 페이징처리 -->
<!--             	<div class="col-lg-12"> -->
<!-- 					<div class="classes__pagination"> -->
<%-- 					<c:if test="${pageMaker.prev}"> --%>
<%-- 						<a href="adminLessonList.do${pageMaker.makeQueryAdminLessonList(pageMaker.startPage - 1)}"> --%>
<!-- 							<span class="arrow_carrot-left"></span> -->
<!-- 						</a> -->
<%-- 					</c:if>  --%>
					
<%-- 					<c:set var="page" value="${pageMaker.cri.page}"/> --%>
<%-- 					<c:set var="idx" value="${idx}"/> --%>
<%-- 					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx"> --%>
<%--             			<a href="adminLessonList.do${pageMaker.makeQueryAdminLessonList(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a> --%>
<%-- 					</c:forEach> --%>
					
<%-- 					<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<%-- 						<a href="adminLessonList.do${pageMaker.makeQueryAdminLessonList(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a> --%>
<%-- 					</c:if> --%>
<!-- 					</div> -->
<!-- 				</div> -->
			
			</div>
		</div>
	</section>
				

	<!-- Js Plugins -->
				
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
