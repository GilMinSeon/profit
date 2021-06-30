<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview_img').attr('src', e.target.result);
				console.log(input.files[0])
			}
			reader.readAsDataURL(input.files[0]);
		}
		$("#exe_btn").show();
	}

	function fn_imageUpdate() {
		/* 	$('#text').c({
		 'display' : 'block'
		 }); */

		$('#after').css({
			'display' : 'block'
		});

		$('#file').css({
			'display' : 'block'
		});

		$('#before').css({
			'display' : 'none'
		});
		/* 	$('.updateBtn').css({
		 'display' : 'block'
		 });
		
		
		 $('#updBtn').attr({
		 'value' : '수정완료'
		 });
		 $('.ta').prop('readonly', false); */
	}

	function fn_imageSubmit() {

		alert("프로필 사진이 업로드 되었습니다.")
		$('#before').css({
			'display' : 'block'
		});

		$('#after').css({
			'display' : 'none'
		});

		$('#file').css({
			'display' : 'none'
		});
	}
</script>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>마이페이지</h2>

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
							<a href="#">Weight</a> <a href="#">Beauty</a> <a href="#">Yoga Ball</a> <a href="#">Fruit</a> <a href="#">Healthy
								Food</a> <a href="#">Lifestyle</a>
						</div>
					</div>
				</div>
				<!-- 여기부터 달라짐 -->
				<div class="col-lg-8 order-lg-2 order-1">
					<div class="row" style="display: inline-block; width: 100%;">
						<!-- Appoinment Section Begin -->
						<section class="appointment" style="margin-bottom: 50px;">
							<div class="container">
								<div class="appointment__text" style="background-color: #9e9e9e0a">
									<form action="#" class="appointment__form">
										<div class="text-center">
											<!-- 프로필이미지 -->
											<div class="classes__sidebar__instructor">
												<div class="classes__sidebar__instructor__pic" style="float: none; margin-right: 0px; height: 170px;">
													<img id="preview_img" src="${myInfo.filePath }" alt="">
													<p id="before" onclick="fn_imageUpdate()" style="display: block; text-align: right; cursor: pointer;">프로필
														사진 수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
													<br>
													<button id="after" type="button" onclick="location.href='pwdMod'" class="input-group-addon"
														style="display: none; cursor: pointer; border: 1px solid #5768AD; margin-right: 10px; float: right; padding: 4px 13px; font-weight: bold; font-size: 0.9em;">수정완료</button>
													<input id="file" type="file" onchange="readURL(this);"
														style="display: none; float: right; width: 100px; height: 30px; padding-left: 0px; margin-bottom: 0px;">&nbsp;&nbsp;

												</div>

											</div>
											
											<!-- 아이디 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">아이디</h5>
													&nbsp;
												</div>
												<input type="text" style="background-color: #3f51b50d; color: black;" readonly="readonly"
													value="${myInfo.memberId }">
											</div>

											<c:set var="memberRoute" value="${myInfo.memberRoute}" />
											<c:if test="${memberRoute == 'U' }">
												<!-- 비밀번호 (카카오 회원 안보임)-->
												<div class="col-lg-6 text-center mypage_myinfo"
													style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
													<div style="margin-bottom: 2px;">
														<h5 style="display: inline; float: left; color: black;">비밀번호</h5>
														&nbsp;
													</div>
													<div class="input-group" style="margin-bottom: 20px;">
														<input type="password" class="form-control" placeholder="Password" readonly="readonly"
															style="background-color: #3f51b50d; color: black;" value="회원의 실제 비밀번호"> <span
															class="input-group-addon" style="border: 1px solid #5768AD; border-radius: 4px;">
															<button type="button" onclick="location.href='pwdMod'" class="input-group-addon"
																style="font-weight: bold; font-size: 0.9em;">변경</button>
														</span>

													</div>
												</div>
											</c:if>

											<!-- 이메일 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">이메일</h5>
													&nbsp;
												</div>
												<div class="input-group" style="margin-bottom: 20px;">
													<input type="text" class="form-control" placeholder="Mobile" readonly="readonly"
														style="background-color: #3f51b50d; color: black;" value="${myInfo.memberEmail }">

													<c:if test="${memberRoute == 'U' }">
														<span class="input-group-addon" style="border: 1px solid #5768AD; border-radius: 4px;">
															<button type="button" onclick="location.href='mobileMod'" class="input-group-addon"
																style="font-weight: bold; font-size: 0.9em;">변경</button>
														</span>
													</c:if>
												</div>
											</div>

											<!-- 이름 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">이름</h5>
													&nbsp;
												</div>
												<input type="text" readonly="readonly" placeholder="Name" style="background-color: #3f51b50d; color: black;"
													value="${myInfo.memberName }">
											</div>


											<!-- 닉네임 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">닉네임</h5>
													&nbsp;
												</div>
												<input type="text" readonly="readonly" placeholder="Nickname"
													style="background-color: #3f51b50d; color: black;" value="${myInfo.memberNickname }">
											</div>

											<!-- 핸드폰 번호 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">핸드폰 번호</h5>
													&nbsp;
												</div>
												<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;"
													value="${myInfo.memberMobile }">
											</div>


											<!-- 성별 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">성별</h5>
													&nbsp;
												</div>
												<div class="r_gender">
													<input type="radio" name="gend_type" id="male" value="남자" autocomplete="off" style="opacity: 0;"
														onclick="return(false);"> <label for="male" style="border: 1px solid; float: left;">남자</label> <input
														type="radio" name="gend_type" id="female" value="여자" autocomplete="off" style="opacity: 0;"
														onclick="return(false);"> <label for="female" style="border: 1px solid;">여자</label>
												</div>
											</div>


											<!-- 키 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">키 (cm)</h5>
													&nbsp;
												</div>
												<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;"
													value="${myInfo.memberHeight }">
											</div>

											<!-- 몸무게 -->
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">몸무게 (kg)</h5>
													&nbsp;
												</div>
												<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;"
													value="${myInfo.memberWeight }">
											</div>


											<!-- 수정하기 버튼 -->
											<div class="col-lg-12" style="text-align: right;">
												<button type="submit" class="site-btn"
													style="font-size: 1.1em; color: white; background-color: #5768AD; width: 150px; height: 48px; margin-right: 7px;">수정하기</button>
											</div>

										</div>
									</form>
								</div>
							</div>
						</section>
						<!-- Appoinment Section End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->



	<!-- Js Plugins -->
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>