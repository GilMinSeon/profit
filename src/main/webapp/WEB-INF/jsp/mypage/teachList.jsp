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
</head>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}
</style>
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
			<div class="appointment__text" style="background-color: #9e9e9e0a; padding: 60px 10px;">
				<form action="#" class="appointment__form">
					<div class="text-center">
						<h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;">마이 클래스</h4>
						<br/>
						<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;">나의 강의 정보를 확인해 보세요.</p>
						<br/><br/>

							
							<table class="table table-hover" style="text-align: center;">
								<thead>
									<tr style="background: #E6E6E6;">
										<th scope="col">번호</th>
										<th scope="col" colspan="2">제목</th>
										<th scope="col">활성화</th>
										<th scope="col">합계</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td colspan="2"><a href="lessionDetail"
											style="text-decoration: none; color: #5768AD;"> 예진쌤의 칼소폭 30일 완성 </a></td>
										<td>
<!-- 											<div id="container"> -->
											  <div class="toggle-switch">
											    <input type="checkbox" id="chkTog1">
											    <label for="chkTog1">
											      <span class="toggle-track"></span>
											    </label>
											  </div>
<!-- 											</div> -->
										</td>
										<td>300,000</td>
										
									</tr>
									<tr>
										<th scope="row">2</th>
										<td colspan="2"><a href="lessionDetail"
											style="text-decoration: none; color: #5768AD;"> 예진이의 핵매운맛! </a></td>
										<td>
											<div id="container">
											  <div class="toggle-switch">
											    <input type="checkbox" id="chkTog2">
											    <label for="chkTog2">
											      <span class="toggle-track"></span>
											    </label>
											  </div>
											</div>
										</td>
										<td>500,000,000</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td colspan="2"><a href="lessionDetail"
											style="text-decoration: none; color: #5768AD;"> 전신군살타파! 살들아 저리가~ </a></td>
										<td>
											<div id="container">
											  <div class="toggle-switch">
											    <input type="checkbox" id="chkTog3">
											    <label for="chkTog3">
											      <span class="toggle-track"></span>
											    </label>
											  </div>
											</div>
										</td>
										<td>1,400,340</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td colspan="2"><a href="lessionDetail"
											style="text-decoration: none; color: #5768AD;"> 마무리까지 확실히! 스트레칭 </a></td>
										<td>
											<div id="container">
											  <div class="toggle-switch">
											    <input type="checkbox" id="chkTog4">
											    <label for="chkTog4">
											      <span class="toggle-track"></span>
											    </label>
											  </div>
											</div>
										</td>
										<td>900,000</td>
									</tr>
								</tbody>
							</table>
                        
                         	<br/><br/>
							<div class="col-lg-12" style="text-align: right;">
	                             <button type="submit" class="site-btn" style="font-size: 1.1em;color: white; background-color: #5768AD;width: 180px;height: 48px;margin-right: 7px;">활성화 수정</button>
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
<!--     <script src="./resources/js/jquery-3.3.1.min.js"></script> -->
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</body>
</html>