<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 120px;
}
.current{
	color: black;
}
</style>
<script type="text/javascript">
	function fn_update(){
		$('.updateBtn').css({
			'display' : 'block'
		});
		
		
		$('#updBtn').attr({
			'value' : '수정완료'
		});
		$('.ta').prop('readonly', false);

	}
</script>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>트레이너 승인</h2>

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
								<li><a href="trainerPermitList">트레이너승인</a></li>
								<li><a href="adminMemberList">회원관리</a></li>
								<li><a href="adminLessonList">온라인클래스 내역조회</a></li>
								<li><a href="adminChatList">상담내역</a></li>
								<li><a href="adminTicketPayList">이용권 구매내역</a></li>
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
				<h3> 트레이너 정보</h3><br>
					<!-- Classes Section Begin -->
					
					<section >

						<div class="appointment__text" style="background-color: #9e9e9e0a">
							<!-- <div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2></h2>
						</div>
					</div>
				</div> -->
							<form action="#" class="appointment__form">
								<div class="text-center">

									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">이름</h5>
											&nbsp;
										</div>
										<input type="text" readonly="readonly"
											style="background-color: #3f51b50d; color: black;"
											value="마동석">
									</div>
									
									<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">이메일</h5>
								&nbsp;
							</div>
							<div class="input-group" style="margin-bottom: 20px;">
								<input type="text" class="form-control" placeholder="Mobile" style="background-color: #3f51b50d;color: black;" value="010-4444-5555">
					            <span class="input-group-addon" style="border:1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='adminSendMail'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">이메일전송</button>
					            </span>
					        </div>
						</div>
									
									
									
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">성별</h5>
											&nbsp;
										</div>
										<input type="text" placeholder="Password" readonly="readonly"
											style="background-color: #3f51b50d; color: black;" value="남성">
									</div>
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">전화번호</h5>
											&nbsp;
										</div>
										<input type="text" placeholder="Password" readonly="readonly"
											style="background-color: #3f51b50d; color: black;"
											value="010-1234-5678">
									</div>
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">소속헬스장</h5>
											&nbsp;
										</div>
										<input type="text" placeholder="Name" readonly="readonly"
											style="background-color: #3f51b50d; color: black;"
											value="헬스짐">
									</div>
									
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">수상이력</h5>
											&nbsp;
										</div>
										<div class="row">
											<div class="col-lg-12"></div>
											<div class="col-lg-12 text-center">
												<textarea class="ta" readonly="readonly" 
													style="background-color: #3f51b50d; color: black; margin-bottom: 20px;resize: none;">
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 

                                    </textarea>

											</div>
										</div>
									</div>
									
									
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">경력</h5>
											&nbsp;
										</div>
										<div class="row">
											<div class="col-lg-12"></div>
											<div class="col-lg-12 text-center">
												<textarea class="ta" readonly="readonly"
													style="background-color: #3f51b50d; color: black; margin-bottom: 20px;resize: none;">
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 

                                    </textarea>

											</div>
										</div>
									</div>
									
									
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">첨부파일</h5>
											&nbsp;
											<div class="col-lg-12" style="text-align: right; float: left; padding: 0; margin: 0;">
												<input type="button" value="첨부파일 추가" class="site-btn updateBtn" style="display:none; float:right; padding: 1px 6px ;font-size: 0.8em; color: white; background-color: #5768AD; width: 130px; height: 40px; margin-right: 7px;" onclick="fn_update()">
											</div>
										</div>
										
											
										<div class="input-group" style="margin-bottom: 5px;">
											<input type="text" class="form-control" placeholder="Password" style="background-color: #3f51b50d;color: black; margin-bottom: 5px;" value="성범죄자 이력 조회 서류">
								            <span class="input-group-addon updateBtn" style="border:1px solid #5768AD; border-radius: 4px; display: none;">
												<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">삭제</button>
								            </span>
								        </div>
								        
								        <div class="input-group" style="margin-bottom: 5px;">
											<input type="text" class="form-control" placeholder="Password" style="background-color: #3f51b50d;color: black; margin-bottom: 5px;" value="성범죄자 이력 조회 서류">
								            <span class="input-group-addon updateBtn" style="border:1px solid #5768AD; border-radius: 4px; display: none;">
												<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">삭제</button>
								            </span>
								        </div>
								        
								        <div class="input-group" style="margin-bottom: 5px;">
											<input type="text" class="form-control" placeholder="Password" style="background-color: #3f51b50d;color: black; margin-bottom: 5px;" value="성범죄자 이력 조회 서류">
								            <span class="input-group-addon updateBtn" style="border:1px solid #5768AD; border-radius: 4px; display: none;">
												<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">삭제</button>
								            </span>
								        </div>
										
										<div class="input-group" style="margin-bottom: 5px;">
											<input type="text" class="form-control" placeholder="Password" style="background-color: #3f51b50d;color: black; margin-bottom: 5px;" value="성범죄자 이력 조회 서류">
								            <span class="input-group-addon updateBtn" style="border:1px solid #5768AD; border-radius: 4px; display: none;">
												<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">삭제</button>
								            </span>
								        </div>
									</div>
									
									
									
									<div class="col-lg-6 text-center mypage_myinfo"
										style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
										<div style="margin-bottom: 2px;">
											<h5 style="display: inline; float: left; color: black;">관리자 메모</h5>
											&nbsp;
										</div>
										<div class="row">
											<div class="col-lg-12"></div>
											<div class="col-lg-12 text-center">
												<textarea class="ta" readonly="readonly"
													style="background-color: #3f51b50d; color: black; margin-bottom: 20px;resize: none;">
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 
2020~현재 대전 멋쟁이헬스장 트레이너 & 요가강사
2014~2019 서울 멋진헬스장 트레이너 

                                    </textarea>

											</div>
										</div>
									</div>
									
									
									
									
									
									
									
									<br>
									<div class="col-lg-12" style="text-align: right;">
										<input type="button" value="수정하기" id="updBtn" class="site-btn" style="padding: 1px 6px ;font-size: 1.1em; color: white; background-color: #5768AD; width: 150px; height: 48px; margin-right: 7px;" onclick="fn_update()">
									</div><br>

									<div class="col-lg-12" style="text-align: right; ">
										<input type="button" value="승인" class="site-btn" style="display: inline-block; padding: 1px 6px ;font-size: 1.1em; color: white; background-color: #5768AD; width: 100px; height: 48px; margin-right: 7px;">
										<input type="button" value="보완" class="site-btn" style="display: inline-block; padding: 1px 6px ;font-size: 1.1em; color: white; background-color: #5768AD; width: 100px; height: 48px; margin-right: 7px;">
										<input type="button" value="반려" class="site-btn" style="display: inline-block; padding: 1px 6px ;font-size: 1.1em; color: white; background-color: #5768AD; width: 100px; height: 48px; margin-right: 7px;">
										
									</div>

								</div>
								
							</form>
						</div>
					</section>
					<!-- Classes Section End -->
					
				</div>
			</div>
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