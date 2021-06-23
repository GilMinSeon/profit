<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_numberAlert(){
		 if(confirm("상담을 진행하면 이용권 하나가 차감됩니다. 계속 진행하시겠습니까?"))
		 {
		  	location.href="chatting";
		 }
	}
</script>
</head>

<body>
<!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>1:1 상담</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Breadcrumb End -->
<section class="about spad">
        <div class="container">
            <div class="about__services">
                
            </div>
            <div class="row">
                <div class="col-lg-7 p-0">
                    <div class="about__pic">
                        <img src="./resources/img/common/trainer-1.jpg" style="width: 500px;height: 500px;">
                    </div>
                </div>
                <div class="col-lg-5 p-0">
                    <div class="about__text">
                        <div class="section-title">
                            <h2>곽두팔 <span style="font-size: 0.6em;color:#5768AD">헬스 트레이너</span></h2>
                            <p>땡땡 소속 전문 헬스트레이너 곽두팔 입니다. 식단이 중요한 만큼 고객에 맞는 상담을 해드립니다. 연락...주십쇼..</p>
                        </div>
                        <div class="appointment__text" style="background-color: #9e9e9e0a;padding:10px;">
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
										<div class="row">
											<div class="col-lg-12"></div>
											<div class="col-lg-12 text-center" style="padding:0">
												<textarea readonly="readonly"
													style="background-color: #3f51b50d; color: black;padding:20px;margin:0;border-radius: 10px;resize: none;
													width: 460px;height: 300px;">
*공지사항*
- 예약을 원하시면 댓글을 달아주세요 합의 후 진행예정.
- 2021/06/18 상담 없는 날입니다.

*2021/06/17 예약현황*
15:00 ~ 15:20 김도민님 예약완료
15:30 ~ 15:50 옹나희님 예약완료
16:00 ~ 16:20 반석호님 예약완료
16:30 ~ 16:50 홍은기님 예약완료</textarea>

											</div>
										</div>
									</div>
                    </div>
                    </form>
                </div>
                <div class="classes__item__text"  style="text-align: center;padding-top: 10px;">
			         <a class="class-btn_w" style="font-size: 1.1em;" onclick="fn_numberAlert()">1:1 상담하기</a>
			    </div>
            </div>
        </div>
        </div>
        </div>
        
    </section>
    <!-- About Section End -->
	<!-- Leave Comment Begin -->
    <div class="leave-comment spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="leave__comment__text">
                        <h2>트레이너에게 문의해보세요👀</h2>
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-12">
                                </div>
                                <div class="col-lg-12 text-center">
                                    <textarea placeholder="댓글을 입력해 주세요."></textarea>
                                    <button type="submit" class="site-btn" style="font-size: 1.2em;">작성 완료</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-4 order-lg-1 order-2" style="width: 100%;flex: 0 0 100%;max-width: 100%;padding-right: 0px;margin-left: 23px;">
                
                    <div class="blog__sidebar">
                        
                        <div class="blog__sidebar__comment" style="overflow:scroll; height: 500px;overflow-x:hidden">
                            <h4>댓글</h4>
                            <div class="classes__sidebar__comment">
                                <div class="classes__sidebar__comment__pic">
                                    <img src="./resources/img/classes-details/comment-1.png" alt="">
                                    <div class="classes__sidebar__comment__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </div>
                                </div>
                                <div class="classes__sidebar__comment__text">
                                    <span>04 Mar 2018</span>
                                    <h6>Brandon Kelley</h6>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit,</p>
                                </div>
                            </div>
                            <div class="classes__sidebar__comment">
                                <div class="classes__sidebar__comment__pic">
                                    <img src="./resources/img/classes-details/comment-1.png" alt="">
                                    <div class="classes__sidebar__comment__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </div>
                                </div>
                                <div class="classes__sidebar__comment__text">
                                    <span>04 Mar 2018</span>
                                    <h6>Brandon Kelley</h6>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit,</p>
                                </div>
                            </div>
                            <div class="classes__sidebar__comment">
                                <div class="classes__sidebar__comment__pic">
                                    <img src="./resources/img/classes-details/comment-1.png" alt="">
                                    <div class="classes__sidebar__comment__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </div>
                                </div>
                                <div class="classes__sidebar__comment__text">
                                    <span>04 Mar 2018</span>
                                    <h6>Brandon Kelley</h6>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit,</p>
                                </div>
                            </div>
                            <div class="classes__sidebar__comment">
                                <div class="classes__sidebar__comment__pic">
                                    <img src="./resources/img/classes-details/comment-1.png" alt="">
                                    <div class="classes__sidebar__comment__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </div>
                                </div>
                                <div class="classes__sidebar__comment__text">
                                    <span>04 Mar 2018</span>
                                    <h6>Brandon Kelley</h6>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit,</p>
                                </div>
                            </div>
                            <div class="classes__sidebar__comment">
                                <div class="classes__sidebar__comment__pic">
                                    <img src="./resources/img/classes-details/comment-2.png" alt="">
                                    <div class="classes__sidebar__comment__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </div>
                                </div>
                                <div class="classes__sidebar__comment__text">
                                    <span>04 Mar 2018</span>
                                    <h6>Christina Kelley</h6>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
    </div>
    <!-- Leave Comment End -->
</body>
<!-- Js Plugins -->
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</html>