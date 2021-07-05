<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
}
.team__slider.owl-carousel .owl-stage-outer {
    padding-top: 10px; 
    padding-bottom: 40px;
}

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
                <div class="col-lg-12" style="height:60px;">
                    <div class="section-title" style="text-align: left">
                        <h3 style="font-weight: bold;">🏆조회수 TOP 5</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="team__slider owl-carousel" >
	                <c:forEach var="result" items="${boardTopList}" varStatus="status">
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:0px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="${result.filePath}" style="padding-top: 0px;">
                            <span>${result.inDate}</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.commonHit}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="goodFlag" value="${result.goodFlag}"/>
                    				<c:if test="${goodFlag == '1' }">
									<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
									</c:if>
									<c:if test="${goodFlag == '0' }">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="bookFlag" value="${result.bookFlag}"/>
                    				<c:if test="${bookFlag == '1' }">
									<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									<c:if test="${bookFlag == '0' }">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardBook}&nbsp;&nbsp;</p>
								</div> 
                            </div>
                            <p style="font-weight: bold; color: #8B94B5;">카테고리 | <span>${result.communityCategoryName}</span></p>
							<h4 style="margin-bottom: 10px;">
								<a style="font-size: 0.8em;font-weight: bold;">${result.commonTitle}</a>
							</h4>
                            <div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;">
									<h6 style="margin-bottom: 25px;color:#535353">${result.inUserId}</h6>
								</div>
							</div>
							<a href="boardDetail.do?communitySeq=${result.communitySeq}"  class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                    </c:forEach>
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
						<div class="classes__item__pic set-bg" data-setbg="${result.filePath}">
                        </div>
						<div class="classes__item__text" style="padding-left: 10px; padding-right: 10px;">
							<div style="text-align: right;">
								
								<div style="display: inline-block;vertical-align:sub;float: left">
									<p style="margin:0;">${fn:substring(result.inDate,0,10)}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.commonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<c:set var="goodFlag" value="${result.goodFlag}"/>
                    				<c:if test="${goodFlag == '1' }">
									<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
									</c:if>
									<c:if test="${goodFlag == '0' }">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</c:if>
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<c:set var="bookFlag" value="${result.bookFlag}"/>
                    				<c:if test="${bookFlag == '1' }">
									<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									<c:if test="${bookFlag == '0' }">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.boardBook}&nbsp;&nbsp;</p>
								</div>
							</div>
							<p style="font-weight: bold; color: #8B94B5;">카테고리 | <span>${result.communityCategoryName}</span></p>
							<h4 style="margin-bottom: 10px;">
								<a style="font-size: 0.8em;font-weight: bold;">${result.commonTitle}</a>
							</h4>
							<div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;">
									<h6 style="margin-bottom: 25px;color:#535353">${result.inUserId}</h6>
								</div>
							</div>
							<a href="boardDetail.do?communitySeq=${result.communitySeq}"  class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
						</div>
					</div>
				</div>
            	
            	</c:forEach>
            	
            	
            	<!-- 페이징처리 -->
            	<div class="col-lg-12">
					<div class="classes__pagination">
					<c:if test="${pageMaker.prev}">
						<a href="boardList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">
							<span class="arrow_carrot-left"></span>
						</a>
					</c:if> 
					
					<c:set var="page" value="${pageMaker.cri.page}"/>
					<c:set var="idx" value="${idx}"/>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            			<a href="boardList.do${pageMaker.makeQuery(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="boardList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
					</c:if>
					</div>
				</div>
            	
            	
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