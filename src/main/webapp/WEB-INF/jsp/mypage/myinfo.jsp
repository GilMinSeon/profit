<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <a href="#">Weight</a>
                            <a href="#">Beauty</a>
                            <a href="#">Yoga Ball</a>
                            <a href="#">Fruit</a>
                            <a href="#">Healthy Food</a>
                            <a href="#">Lifestyle</a>
                        </div>
                    </div>
                </div>
                <!-- 여기부터 달라짐 -->
                <div class="col-lg-8 order-lg-2 order-1">
                    <div class="row" style="display: inline-block;width: 100%;" >
                        	<!-- Appoinment Section Begin -->
	<section class="appointment" style=" margin-bottom: 50px;">
		<div class="container">
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
								<h5 style="display: inline; float: left; color: black;">아이디</h5>
								&nbsp;
							</div>
							<input type="text" style="background-color: #3f51b50d;color: black;" readonly="readonly" value="dgafas214">
						</div>
						
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">비밀번호</h5>
								&nbsp;
							</div>
							<div class="input-group" style="margin-bottom: 20px;">
								<input type="password" class="form-control" placeholder="Password" style="background-color: #3f51b50d;color: black;" value="회원의 실제 비밀번호">
					            <span class="input-group-addon" style="border:1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">수정</button>
					            </span>
					        </div>
						</div>
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">이름</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Name" style="background-color: #3f51b50d;color: black;" value="송하나">
						</div>
						
						
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">성별</h5>
								&nbsp;
							</div>
							<div class="r_gender">
								<input type="radio" name="gend_type" id="male" value="남자" autocomplete="off" style="opacity: 0;" onclick="return(false);">
								<label for="male" style="border:1px solid;float:left;">남자</label>
								<input type="radio" name="gend_type" id="female" value="여자" autocomplete="off" style="opacity: 0;" checked onclick="return(false);">
								<label for="female" style="border:1px solid;" >여자</label>
							</div>
						</div>
						
						
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">닉네임</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Nickname" style="background-color: #3f51b50d;color: black;" value="DIVA">
						</div>
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">핸드폰 번호</h5>
								&nbsp;
							</div>
							<div class="input-group" style="margin-bottom: 20px;">
								<input type="text" class="form-control" placeholder="Mobile" style="background-color: #3f51b50d;color: black;" value="010-4444-5555">
					            <span class="input-group-addon" style="border:1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='mobileMod'" class="input-group-addon" style=" font-weight: bold;font-size: 0.9em;">수정</button>
					            </span>
					        </div>
						</div>
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">이메일</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Email" style="background-color: #3f51b50d;color: black;" value="hana@naver.com">
						</div>
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">키 (cm)</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="height" style="background-color: #3f51b50d;color: black;" value="165">
						</div>
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: black;">몸무게 (kg)</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="weight" style="background-color: #3f51b50d;color: black;" value="50">
						</div>
						
						<div class="col-lg-12" style="text-align: right;">
                             <button type="submit" class="site-btn" style="font-size: 1.1em;color: white; background-color: #5768AD;width: 150px;height: 48px;margin-right: 7px;">수정하기</button>
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
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</body>
</html>