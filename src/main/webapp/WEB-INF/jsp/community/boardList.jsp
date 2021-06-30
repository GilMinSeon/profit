<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
</style>
<body>


    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>자유 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
	 <!-- Team Section Begin -->
    <section class="team spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3>인기 게시판글 TOP 3</h3>
                        <p>지금 가장 인기있는 게시판글을 확인해 보세요!!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="team__slider owl-carousel">
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:10px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="./resources/img/classes-details/cd-item-3.jpg">
                            <span>20 Jun 2020</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/look.PNG" style="width:30px;height: 20px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>1000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/reply.PNG" style="width:24px;height: 19px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>2000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/good.PNG" style="width:22px;height: 20px;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>400</p>
	                            </div> 
                            </div>
                            <h4 style="margin-bottom: 30px;"><a href="#">명상을 합시다 여러부운운운!!</a></h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;">뽀미언니</h6>
                            	</div>
                            </div>
                            <a href="boardDetail" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:10px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="./resources/img/deit_2.jpg">
                            <span>20 Jun 2020</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/look.PNG" style="width:30px;height: 20px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>1000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/reply.PNG" style="width:24px;height: 19px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>2000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/good.PNG" style="width:22px;height: 20px;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>400</p>
	                            </div> 
                            </div>
                            <h4 style="margin-bottom: 30px;"><a href="#">가볍고 든든한 다이어트 한끼 식사</a></h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;">뽀미언니</h6>
                            	</div>
                            </div>
                            <a href="boardDetail" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:10px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="./resources/img/deit_2.jpg">
                            <span>20 Jun 2020</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/look.PNG" style="width:30px;height: 20px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>1000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/reply.PNG" style="width:24px;height: 19px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>2000</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/good.PNG" style="width:22px;height: 20px;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>400</p>
	                            </div> 
                            </div>
                            <h4 style="margin-bottom: 30px;"><a href="#">가볍고 든든한 다이어트 한끼 식사</a></h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;">뽀미언니</h6>
                            	</div>
                            </div>
                            <a href="boardDetail" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Team Section End -->
	

	
    <!-- Classes Section Begin -->
    <section class="classes spad">
        <div class="container">
            <div class="classes__filter">
                <div class="row">
                    <div class="col-lg-12">
                        <form action="#">
                            <div class="class__filter__select">
                                <p>Categories:</p>
                                <select>
                                    <option>카테고리</option>
                                    <option>운동</option>
                                    <option>식단</option>
                                    <option>동기부여</option>
                                    <option>생활습관</option>
                                </select>
                            </div>
                            <div class="class__filter__select">
                                <p>Level:</p>
                                <select>
                                    <option>전체</option>
                                    <option>조회순</option>
                                    <option>좋아요순</option>
                                    <option>댓글순</option>
                                </select>
                            </div>
                            <div class="class__filter__input">
                                <p>Search:</p>
                                	<input type="text" placeholder="검색" >
                            </div>
                            <div class="class__filter__btn">
                                <button><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="classes__item__text" style="text-align: right;padding-top: 0;">
                 <span class="blinking">당신의 특별한 Tip을 공유해보세요 → </span>&nbsp;
                 <a href="boardAdd.do" class="class-btn_w">글쓰기</a>
   		 	</div>
            
            <div class="row">
                <c:forEach var="result" items="${boardList}" varStatus="status">
            	<input type="hidden" name="boardSeq">
				<div class="col-lg-4 col-md-6">
					<div class="classes__item classes__item__page">
						<div class="classes__item__pic set-bg" style="overflow: hidden;"><img src="./resources/img/common/11.gif"></div>
						<div class="classes__item__text" style="padding-left: 10px; padding-right: 10px;">
							<div style="text-align: right;">
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.commonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/reply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardBook}&nbsp;&nbsp;</p>
								</div>
							</div>
							<p style="color:#00CE88;font-weight:800px">카테고리 | <span style="color:#00CE88">${result.communityCategoryName}</span></p>
							<h4 style="margin-bottom: 30px;">
								<a href="lessionDetail" style="font-size: 0.8em;font-weight: bold;">${result.commonTitle}</a>
							</h4>
							<div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
								</div>
								&nbsp;
								<div style="display: inline-block;">
									<h6 style="margin-bottom: 25px;">${result.inUserId}</h6>
								</div>
							</div>
							<a href="boardDetail.do?lessonSeq=${result.commonSeq}"  class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
						</div>
					</div>
				</div>
            	
            	</c:forEach>
            </div>
        </div>
    </section>
    <!-- Classes Section End -->


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