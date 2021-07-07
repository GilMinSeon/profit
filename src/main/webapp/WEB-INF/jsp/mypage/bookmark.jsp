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
            
            
				<!-- 사이드바 시작 -->
				<div class="col-lg-4 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>카테고리</h4>
							<ul>
								<li><a href="myinfo.do">내정보</a></li>
								<li><a href="bookmark.do">북마크</a></li>
								<li><a href="myLessonList.do">마이클래스</a></li>
								<li><a href="myChatList.do">1:1채팅내역</a></li>
							</ul>
						</div>
						
						<br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>채팅이용권</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li>이용권 보유 개수 ▶ 3회 </li>
	                                <li><a href="ticketBuyList.do">이용권 구매내역</a></li><br>
	                                <li><a href="ticketUseList.do">이용권 사용내역</a></li>
	                            </ul>
	                            <br>
	                            <a href="#" class="sidebar-btn">구매하기</a>
	                        </div>
                        </div>
                        
                        <br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>트레이너 신청</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li><span class="icon_calendar"></span><a href="trainerApplyList.do">나의 신청내역</a> </li>
	                                <li><span class="icon_id"></span><a href="trainerApply.do">신청하기</a></li>
	                            </ul>
	                        </div>
                        </div>
					</div>
				</div>
				<!-- 사이드바 끝 -->
                
                
                <!-- 여기부터 달라짐 -->
                <div class="col-lg-8 order-lg-2 order-1" style="background-color: #9e9e9e0a;">
                	
                	<h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;padding-top: 60px; text-align: center;">북마크</h4>
                	<br>
	                <div class="write-title" style="margin-bottom: 5px;">
						<div class="c_radio">
							<div style="display: inline-block;margin-left: 70px;">
								<input type="radio" name="cate_type" id="exercise" value="1" autocomplete="off" style="opacity: 0;" checked>
								<label for="exercise" style="width: 120px;border: 1px solid; padding: 11px;" >전체</label>
								<input type="radio" name="cate_type" id="food" value="2" autocomplete="off" style="opacity: 0">
								<label for="food" style="width: 120px;border: 1px solid;padding: 11px;">온라인클래스</label>
							</div>
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="motive" value="3" autocomplete="off" style="opacity: 0">
								<label for="motive" style="width: 120px;border: 1px solid;padding: 11px;">레시피</label>
								<input type="radio" name="cate_type" id="habit" value="4" autocomplete="off" style="opacity: 0">
								<label for="habit" style="width: 120px;border: 1px solid;padding: 11px;">자유게시판</label>
							</div>
						</div>
					</div>
                	<br>
                	
                
                
                
                
                
                
                
                    <div class="row">
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i> May 4, 2019</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i> May 4, 2019</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>
                        
                                                <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i> May 4, 2019</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i> May 4, 2019</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>
                        
                                                <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i> May 4, 2019</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="margin-bottom: 15px;">
                                    <img src="./resources/img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i>2021-07-07</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a href="#">You can keep fit at university</a></h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="classes__pagination blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#"><span class="arrow_carrot-right"></span></a>
                            </div>
                        </div>
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