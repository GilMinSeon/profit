<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$( "#mydate" ).datepicker({
		changeYear : true,
		changeMonth : true,
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    yearRange: 'c-100:c+10',
	    dateFormat: 'yymmdd'
		
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
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>이용권 구매내역</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>카테고리</h4>
							<ul>
                                <li><a href="myinfo">내정보</a></li>
                                <li><a href="bookmark">북마크</a></li>
                                <li><a href="trainerApply">트레이너신청(전)</a></li>
                                <li><a href="trainerInfo">트레이너정보(후)</a></li>
                                <li><a href="listenList">마이클래스(일반)</a></li>
                                <li><a href="teachList">마이클래스(트레이너)</a></li>
                                <li><a href="myChatList">상담내역</a></li>
                                <li><a href="ticketPayList">이용권 구매내역</a></li>
                            </ul>
						</div>
						<div class="blog__sidebar__recent">
							<h4>최신글</h4>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-1.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>09 Kinds Of Vegetables Protect The Liver</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-2.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>Tips You To Balance Nutrition Meal Day</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-3.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>4 Principles Help You Lose Weight With Vegetables</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
						</div>
						<div class="blog__sidebar__tags">
							<h4>인기 검색어</h4>
							<a href="#">Weight</a> <a href="#">Beauty</a> <a href="#">Yoga
								Ball</a> <a href="#">Fruit</a> <a href="#">Healthy Food</a> <a
								href="#">Lifestyle</a>
						</div>
					</div>
				</div>
				
				
				
				
				<!-- 여기부터 달라짐 -->
				<div class="col-lg-8 order-lg-2 order-1">
					<div class="row" style="display: inline-block; width: 100%;">
						<!-- Classes Section Begin -->
						<section class="classes spad" style="margin-top: 0px; padding-top: 0px;">
							<div class="classes__filter" style="background-color: #9e9e9e0a; padding : 60px 10px;">
								<div class="row">
									<div class="col-lg-12">
									<div style="text-align: center;">
										<h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;">이용권 구매내역</h4>
										<br/>
										<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;">자신이 구매한 이용권의 정보를 확인하세요.</p>
										<p style="color:#5768AD;">▶ 이용권에 관련한 궁금 사항은 <span style="color:#FC7F65;">문의하기</span>에 남겨주세요.</p>
										<br/><br/>
									</div>
										<form id="ticketPay_form" action="#" >

											<div class="class__filter__select">
												<p>검색조건:</p>
												<select>
													<option>전체</option>
													<option>이름</option>
													<option>아이디</option>
												</select>
	<!-- <input type="text" id="mydate"/>	 -->									</div>
											
											<div id="searchBtn" class="class__filter__input" style="margin-right: 20px;">
												<p>날짜:</p>
												<input type="text" placeholder="검색" id="mydate" style="width: 100%;">
											</div>
											
											<div id="searchBtn" class="class__filter__input">
												<p>Search:</p>
												<input type="text" placeholder="검색" style="width: 100%;">
											</div>
											<div id="search2" class="class__filter__btn_re">
												<button>
													<i class="fa fa-search"></i>
												</button>
											</div>

										</form>
									</div>
								</div>
								<br>

								<table class="table table-hover" style="text-align: center;">
									<thead>
										<tr style="background: #E6E6E6;">
											<th scope="col">이용권 종류</th>
											<th scope="col">남은 횟수</th>
											<th scope="col">결제내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3회권</td>
											<td>1회</td>
											<td><a href="ticketPayDetail" style="text-decoration: none; color: #5768AD;">결제내역 상세보기</a></td>
										</tr>
										<tr>
											<td>3회권</td>
											<td>1회</td>
											<td><a href="ticketPayDetail" style="text-decoration: none; color: #5768AD;">결제내역 상세보기</a></td>
										</tr>
										<tr>
											<td>3회권</td>
											<td>1회</td>
											<td><a href="ticketPayDetail" style="text-decoration: none; color: #5768AD;">결제내역 상세보기</a></td>
										</tr>
										<tr>
											<td>3회권</td>
											<td>1회</td>
											<td><a href="ticketPayDetail" style="text-decoration: none; color: #5768AD;">결제내역 상세보기</a></td>
										</tr>
										<tr>
											<td>3회권</td>
											<td>1회</td>
											<td><a href="ticketPayDetail" style="text-decoration: none; color: #5768AD;">결제내역 상세보기</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>
						<!-- Classes Section End -->
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Blog Section End -->




	<!-- Js Plugins -->



	<!-- <script src="./resources/js/jquery-3.3.1.min.js"></script> -->
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>