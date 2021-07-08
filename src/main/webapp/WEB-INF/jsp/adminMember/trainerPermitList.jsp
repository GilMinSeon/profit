<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
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
</script>
</head>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}
</style>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
	</section>
	<!-- Breadcrumb End -->
	
	<!-- 본문 시작 -->
	<section class="classes spad">
		<div class="container">
			<h3 style="text-align: center;">트레이너 승인</h3>
			<br>
			<!-- 1 -->
			<div class="classes__filter" style="margin-bottom: 40px;">
				<table class="table table-bordered" style="text-align: center;">
					<h5>◼ 2021-07-08 신청내역</h5>
					<br>
					<tbody>
						<tr>
							<th scope="row">신규 승인요청건수</th>
							<td colspan="2"><a href="noticeDetail" style="text-decoration: none; color: blue;"> 회원정지 </a></td>
						</tr>
						<tr>
							<th scope="row">검토중인 건수</th>
							<td colspan="2"><a href="noticeDetail" style="text-decoration: none; color: blue;"> 회원정지 </a></td>
						</tr>
						<tr>
							<th scope="row">보완중인 건수</th>
							<td colspan="2"><a href="noticeDetail" style="text-decoration: none; color: blue;"> 회원정지 </a></td>
						</tr>
						<tr>
							<th scope="row">오늘의 처리건수</th>
							<td colspan="2"><a href="noticeDetail" style="text-decoration: none; color: blue;"> 회원정지 </a></td>
						</tr>
					</tbody>
				</table>
			</div>
						
			<!-- 2 -->
		    <div class="classes__filter" style="margin-bottom: 0px;">
			<br>
               <div class="row">
                   <div class="col-lg-12">
                       <form action="#">
                           <div class="class__filter__select" style="width: 150px;">
                               <p>상태</p>
                               <select>
                                   <option>전체</option>
                                   <option>신청</option>
                                   <option>검토</option>
                                   <option>보완</option>
                                   <option>반려</option>
                                   <option>승인</option>
                               </select>
                           </div>
                           <div class="class__filter__select" style="width: 150px;">
                               <p>검색조건</p>
                               <select>
                                   <option>전체</option>
                                   <option>이름</option>
                                   <option>아이디</option>
                               </select>
                           </div>
                           <div id="searchDiv" class="class__filter__input" style="margin-right: 28px;width: 150px;">
							<p>날짜</p>
							<input type="text" placeholder="검색" id="mydate" style="width: 100%;">
						</div>
						
						<div id="searchDiv" class="class__filter__input"  style="margin-right: 20px;width: 350px;">
							<p>검색어</p>
							<input type="text" placeholder="검색" style="width: 100%;">
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
						<th scope="col">종류</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">결제일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>2</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>3</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>4</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
					<tr>
						<td>5</td>
						<td>1회권</td>
						<td>S00001</td>
						<td>김기석</td>
						<td>2021-07-07</td>
					</tr>
				</tbody>
			</table>
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