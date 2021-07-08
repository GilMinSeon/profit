<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>

<style type="text/css">
.counter-section i {
    display: block;
    margin: 0 0 10px
}

.counter-section span.counter {
    font-size: 40px;
    color: #000;
    line-height: 60px;
    display: block;
    font-family: "Oswald", sans-serif;
    letter-spacing: 2px
}

.counter-title {
    font-size: 16px;
    letter-spacing: 2px;
    text-transform: uppercase
}

.counter-icon {
    top: 25px;
    position: relative
}

.counter-style2 .counter-title {
    letter-spacing: 0.55px;
    float: left
}

.counter-style2 span.counter {
    letter-spacing: 0.55px;
    float: left;
    margin-right: 10px
}

.counter-style2 i {
    float: right;
    line-height: 26px;
    margin: 0 10px 0 0
}

.counter-subheadline span {
    float: right
}

.medium-icon {
    font-size: 40px !important;
    margin-bottom: 15px !important
}
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#mydate").datepicker({
		changeYear : true,
		changeMonth : true,
		dayNamesMin : [ '일', '월', '화', '수', '목','금', '토' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월','5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
		yearRange : 'c-100:c+10',
		dateFormat : 'yymmdd'
	});
});

/* $(document).ready(function() {
	$('.counter').each(function() {
		$(this).prop('Counter', 0).animate({
			Counter : $(this).text()
		}, {
			duration : 500,
			easing : 'swing',
			step : function(now) {
				$(this).text(Math.ceil(now));
			}
		});
	});

}); */

function fn_status(){
	alert("ddd")
}

</script>


</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
	</section>
	<!-- Breadcrumb End -->
	
	
	<!-- 본문 시작 -->
	<section class="classes spad" style="visibility: visible; animation-name: fadeIn;">
		<div class="container">
			<h3 style="text-align: center;">트레이너 승인</h3>
			<br>
        <div class="row" style="margin-bottom: 30px;margin-top: 30px;">
            <!-- counter -->
            <div class="col-md-3 col-sm-6 bottom-margin text-center counter-section wow fadeInUp sm-margin-bottom-ten animated" data-wow-duration="300ms" style="visibility: visible; animation-duration: 300ms; animation-name: fadeInUp;"> 
	            <i class="fa fa-user medium-icon"></i> 
	            <span id="anim-number-pizza" class="counter-number"></span> 
	            <span class="timer counter alt-font appear" data-to="980" data-speed="7000" onclick="fn_status()" style="cursor: pointer">${todayNumberList.statusA }</span>
	            <p class="counter-title">승인요청</p>
            </div> 
            <!-- end counter -->
            
            <!-- counter -->
            <div class="col-md-3 col-sm-6 bottom-margin text-center counter-section wow fadeInUp sm-margin-bottom-ten animated" data-wow-duration="600ms" style="visibility: visible; animation-duration: 600ms; animation-name: fadeInUp;"> 
	            <i class="fa fa-user medium-icon"></i> 
	            <span class="timer counter alt-font appear" data-to="980" data-speed="7000">${todayNumberList.statusB }</span> 
	            <span class="counter-title">검토단계</span> 
	        </div> 
	        <!-- end counter -->
            
            <!-- counter -->
            <div class="col-md-3 col-sm-6 bottom-margin-small text-center counter-section wow fadeInUp xs-margin-bottom-ten animated" data-wow-duration="900ms" style="visibility: visible; animation-duration: 900ms; animation-name: fadeInUp;"> 
            	<i class="fa fa-user medium-icon"></i> 
            	<span class="timer counter alt-font appear" data-to="810" data-speed="7000">${todayNumberList.statusC }</span> 
            	<span class="counter-title">보완단계</span> 
            </div> 
            <!-- end counter -->
            
            <!-- counter -->
            <div class="col-md-3 col-sm-6 text-center counter-section wow fadeInUp animated" data-wow-duration="1200ms" style="visibility: visible; animation-duration: 1200ms; animation-name: fadeInUp;"> 
            	<i class="fa fa-heart medium-icon"></i> 
            	<span class="timer counter alt-font appear" data-to="600" data-speed="7000">${todayNumberList.today }</span> 
            	<span class="counter-title">오늘처리건수</span> 
            </div> 
            <!-- end counter -->
        </div>

						
			<!-- 2 -->
		    <div class="classes__filter" style="margin-bottom: 0px;">
			<br>
               <div class="row">
                   <div class="col-lg-12">
                   		<!-- 검색조건 form 시작 -->
                       <form action="trainerPermitList.do" method="get">
                           <div class="class__filter__select" style="width: 150px;">
                               <p>상태</p>
                               <select name="selStatus" id="selStatus">
                                   <option value="">전체</option>
                                   <option value="A">신청</option>
                                   <option value="B">검토</option>
                                   <option value="C">보완</option>
                                   <option value="D">반려</option>
                                   <option value="E">승인</option>
                               </select>
                           </div>
                           <div class="class__filter__select" style="width: 150px;">
                               <p>검색조건</p>
                               <select name="selIdentity">
                                   <option value="">전체</option>
                                   <option value="이름">이름</option>
                                   <option value="아이디">아이디</option>
                               </select>
                           </div>
                           <div id="searchDiv" class="class__filter__input" style="margin-right: 28px;width: 150px;">
							<p>날짜</p>
							<input type="text" placeholder="검색" id="mydate" style="width: 100%;">
						</div>
						
						<div id="searchDiv" class="class__filter__input"  style="margin-right: 20px;width: 350px;">
							<p>검색어</p>
							<input type="text" placeholder="검색" style="width: 100%;" name="searchKeyword" id="searchKeyword">
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
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">신청일자</th>
						<th scope="col">처리일자</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${processList}" varStatus="status">
					<tr>
						<td>${list.processSeq }</td>
						<td>${list.memberId }</td>
						<td>${list.memberName }</td>
						<td>${fn:substring(list.inDate,0,10)}</td>
						<td>${fn:substring(list.upDate,0,10)}</td>
						<td>${list.processStatus }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			
			
						<!-- 페이징처리 -->
            	<div class="col-lg-12">
					<div class="classes__pagination">
					<c:if test="${pageMaker.prev}">
						<a href="trainerPermitList.do${pageMaker.makeQueryAdminChat(pageMaker.startPage - 1)}">
							<span class="arrow_carrot-left"></span>
						</a>
					</c:if> 
					
					<c:set var="page" value="${pageMaker.cri.page}"/>
					<c:set var="idx" value="${idx}"/>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            			<a href="trainerPermitList.do${pageMaker.makeQueryAdminChat(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="trainerPermitList.do${pageMaker.makeQueryAdminChat(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
					</c:if>
					</div>
				</div>
			
			
			
			
			
			</div>

		<!-- container div 끝 -->	
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
</html>