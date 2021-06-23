<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
#submitBtn {
	font-size: 14px;
	color: #5768AD;
	text-transform: uppercase;
	display: inline-block;
	background: #ffffff;
	padding: 14px 35px 12px;
	border-radius: 2px;
	border: none;
	font-weight: 700;
	letter-spacing: 2px;
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
						<h2>비밀번호 찾기</h2>
						<!-- <div class="breadcrumb__widget">
                            <a href="./index.html">Home</a>
                            <span>Our Classes</span>
                        </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->

	<!-- Appoinment Section Begin -->
	<section class="appointment" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="container">
			<div class="appointment__text">
				<!-- <div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2 style="font-size: 35px;"></h2>
						</div>
					</div>
				</div> -->
				<form action="#" class="appointment__form">
					<div class="text-center" >
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto; ">
							<input type="text" placeholder="아이디" >
						</div>
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto; ">
							<input type="text" placeholder="이메일">
						</div>
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto; ">
							<input type="button" value="비밀번호 찾기" id="submitBtn" style="font-size: 1.1em;"><br>
						</div><br>
							<div class="text-center">
								<h5 style="display: inline; color: white; cursor: pointer;" onClick="location.href='login'">로그인</h5>&nbsp;&nbsp;&nbsp;&nbsp;
								<h5 style="display: inline; color: white; cursor: pointer;" onClick="location.href='findId'">아이디 찾기</h5>&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Appoinment Section End -->




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