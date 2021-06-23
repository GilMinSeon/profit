<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>필레테스</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
				<!-- 여기부터 달라짐 -->
				<section class="classes spad">
					<div class="container">
						<h3>📽 강의시청</h3>
						<br>
						<table class="table table" style="text-align: center;">
							<tbody>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;">강의명</th>
									<td>1강 필라테스 기초</td>
								</tr>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;">영상시간</th>
									<td>20:30</td>
								</tr>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;">강의 상세 설명</th>
									<td>필라테스</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">동영상</th>
								</tr>
								<tr>
									<th scope="row" colspan="2"><video controls  src="./resources/img/classes/endG.mp4" width="100%"></video></th>
								</tr>
							</tbody>
						</table>
						<div class="classes__item__text" style="text-align: right;">
							<a href="lessionDetail" class="class-btn">목록</a>
							<a href="classMod" class="class-btn">수정</a>
							<a href="lessionDetail" class="class-btn">삭제</a>
						</div>
					</div>
				</section>
		</div>
	</section>
	<!-- Blog Section End -->
	<!-- Js Plugins -->
	<script src="./resources/js/jquery-3.3.1.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>