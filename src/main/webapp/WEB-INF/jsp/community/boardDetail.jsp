<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="./resources/js/board.js"></script>
<style>
.classes__item__text .class-btn:hover {
    background: #ffffff;
    border: 1px solid #5768AD;
    color: #5768AD;
}

.classes__item__text .class-btn {
    font-size: 17px;
    font-weight: 700;
    color: #ffffff;
    background:#5768AD;
    display: inline-block;
    border: 1px solid rgba(155, 158, 163, 0.2);
    padding: 10px 20px 7px;
    border-radius: 2px;
    -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    -ms-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    width:140px;
}

</style>
<body>


    <!-- Blog Hero Begin -->
    <section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__hero__text">
                        <h2>자유 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
    	
        <div class="container">
        
            <div class="row" style="justify-content: center">
                
                <div class="col-lg-8 order-lg-2 order-1" style="background-color: white;padding: 30px;border: 1px solid #ebecef;border-radius: 10px">
                	<div style="margin-bottom: 30px;">
                		<span style="font-size: 1.3em; font-weight: bold;color: #545454">${BoardDetail['commonTitle']}</span>
                	</div>
                	<div style="float: left;margin-left: 5px;padding-top:5px;">
                        	<p style="font-weight: bold; color: #8B94B5;padding-right: 30px;">카테고리 | <span>${BoardDetail['communityCategoryName']}</span></p>
                        </div>
                	<div  style="text-align: right;margin-bottom: 5px;padding-right: 8px;">
                        
                        <div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p style="margin:0;">${BoardDetail['commonHit']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/reply.png" style="width: 17px; height: 17px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardReply']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardGood']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardBook']}&nbsp;&nbsp;</p>
						</div> 
        			</div>
        			<hr style="color: #545454">
                    <div class="blog__details">
                    	<div style="width: auto;height: 800px;" >
						
						
						
						${BoardDetail['commonContent']}
						
						</div>
						<div style="text-align: right;">
                        	<div class="classes__item__text">
	                            <a href="boardList" class="class-btn" style="text-align: center;">목록</a>
		                        <a href="boardMod" class="class-btn" style="text-align: center;">수정</a>
		                        <a href="#" class="class-btn" style="text-align: center;">삭제</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Leave Comment Begin -->
    <div class="leave-comment spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="leave__comment__text">
                        <h2>자유롭게 댓글을 달아보세요😁</h2>
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
                        
                        <div class="blog__sidebar__comment" style="overflow:scroll; height: 500px;">
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