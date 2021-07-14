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


	

</script>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}

.table tr:hover {
	background-color: #f8f6ff;
}
.ui-datepicker-calendar {
    display: none;
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
			<h3 style="text-align: center;">정산하기</h3>
			<br>
			    <div class="classes__filter" style="margin-bottom: 0px;">
				<br>
                <div class="row">
                    <div class="col-lg-12">
                        <form action="adminSalesList.do">
                           <div id="searchDiv" class="class__filter__input" style="margin-right: 28px;width: 150px;">
								<p>날짜 검색</p>
								<input type="text" placeholder="검색" id="mydate" style="width: 100%;" 
									<c:if test="${not empty selDate}">value=${selDate}</c:if>
									name="selDate" id="selDate">
							</div>
							<div class="class__filter__select" style="width: 150px;">
                                <p>카테고리</p>
                                <select name="selGubun">
                                    <option <c:if test="${selGubun eq '전체'}">selected</c:if>>전체</option>
                                    <option <c:if test="${selGubun eq '강좌'}">selected</c:if>>강좌</option>
                                    <option <c:if test="${selGubun eq '채팅'}">selected</c:if>>채팅</option>
                                </select>
                            </div>
                            <div class="class__filter__select" style="width: 150px;">
                                <p>상태</p>
                                <select name="selStatus">
                                    <option <c:if test="${selStatus eq '전체'}">selected</c:if>>전체</option>
                                    <option <c:if test="${selStatus eq '정산'}">selected</c:if>>정산</option>
                                    <option <c:if test="${selStatus eq '비정산'}">selected</c:if>>비정산</option>
                                </select>
                                
                            </div>
							<div id="searchDiv" class="class__filter__input"  style="margin-right: 20px;width: 350px;">
								<p>검색어</p>
								<input type="text" name="searchKeyword" placeholder="검색" style="width: 100%;" value="${searchKeyword}">
								<div class="class__filter__btn">
                                <button><i class="fa fa-search"></i></button>
                            </div>
							</div>
                            
                        </form>
                    </div>
                </div>
            </div>
			<div class="classes__filter">
			<table class="table" style="text-align: center;">
				<thead>
					<tr style="background: #6d7ab0; color: white;font-size: 1.1em;">
						<th scope="col">번호</th>
						<th scope="col">[월]카테고리</th>
						<th scope="col">정산여부</th>
						<th scope="col" >상세조회</th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:forEach var="result" items="${adminLessonList}" varStatus="status"> --%>
					
					<tr>
					 
						<td>oo</td>
						<td>oo</td>
						<td>oo</td>
						<td >
							<button type="button" class="btn btn-outline-dark" onclick="location.href='adminSalesDetail.do'">상세</button>
						</td>
					</tr>
<%-- 					</c:forEach> --%>
				</tbody>
			</table>
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
