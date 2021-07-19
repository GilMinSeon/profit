<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="./resources/js/jquery-3.3.1.min.js"></script>

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
                        <h2>온라인 클래스</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
    
	<!-- Breadcrumb Begin -->
	<section class="team spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="height:60px;">
                    <div class="section-title" style="text-align: left">
                        <h3 style="font-weight: bold;">
                        	<span style="display: block;color:#444;font-size: 32px;">프로핏</span>
                        	<span style="display: block;color:#444;font-size: 32px;">추천프로그램👍🏻</span>
                        </h3>
                        <p class="slogan" style="margin-top: 0;display: block;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;">
                        마음에 드는 운동프로그램을 선택하세요<br/>
                        <span class="blinking" style="color:red;">↓ AI의 추천 Pick</span>도 함께 둘러보세요
                     </div>
                </div>
            </div>
            <br/><br/><br/><br/>
            <div class="row">
                <div class="team__slider owl-carousel" >
				<c:forEach var="resultTop" items="${resultTopList}" varStatus="status">
				<c:if test="${resultTop.lessonPrivateFlag eq 'N'}">
                     <div class="col-lg-6">
                        <div class="team__item" style="padding-top:0px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${resultTop.fileSaveName}" style="padding-top: 0px;">
                            <span>${fn:substring(resultTop.inDate,0,10)}</span>
                           
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${resultTop.lessonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="goodFlag" value="${resultTop.goodFlag}"/>
                    				<c:if test="${goodFlag == '1' }">
									<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
									</c:if>
									<c:if test="${goodFlag == '0' }">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="bookFlag" value="${resultTop.bookFlag}"/>
                    				<c:if test="${bookFlag == '1' }">
									<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									<c:if test="${bookFlag == '0' }">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonBook}&nbsp;&nbsp;</p>
								</div>  
                            </div>
							<p style="font-weight: bold; color: #8B94B5;">카테고리 | <span>${resultTop.lessonCategoryName}</span></p>
                            <h4 style="margin-bottom: 10px;">
								<a style="font-size: 0.8em;font-weight: bold;">${resultTop.lessonTitle}</a>
							</h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;color:#535353">${resultTop.inUserId}</h6>
                            	</div>
                            </div>
                            <a href="lessonDetail.do?lessonSeq=${resultTop.lessonSeq}" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                   </c:if>
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
						<form method="get" id="frm" action="lessonList.do#location123">
							<div class="class__filter__select">
								<p>Categories:</p>
								<select name="selCate" id="selCate">
									<option value="">카테고리</option>
									<option value="헬스" 
										<c:if test="${selCate eq '헬스'}">selected</c:if>>헬스</option>
									<option value="필라테스"
										<c:if test="${selCate eq '필라테스'}">selected</c:if>>필라테스</option>
									<option value="요가"
										<c:if test="${selCate eq '요가'}">selected</c:if>>요가</option>
									<option value="맨몸운동"
										<c:if test="${selCate eq '맨몸운동'}">selected</c:if>>맨몸운동</option>
								</select>
							</div>
							<div class="class__filter__select">
								<p>Level:</p>
								<select name="selLev" id="selLev"> 
									<option value="">전체</option>
									<option value="조회순"
										<c:if test="${selLev eq '조회순'}">selected</c:if>>조회순</option>
									<option value="좋아요순"
										<c:if test="${selLev eq '좋아요순'}">selected</c:if>>좋아요순</option>
									<option value="댓글순"
										<c:if test="${selLev eq '댓글순'}">selected</c:if>>댓글순</option>
								</select>
							</div>
							<div class="class__filter__input">
								<p>Search:</p>
								<input type="text" placeholder="검색" id="keyword" name="keyword" value="${option.keyword}">
							</div>
							<div class="class__filter__btn">
								<button type="submit" style="cursor:pointer;">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<span id="location123"></span>
						</form>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${rightTrainer eq '1'}">
					<div class="classes__item__text" style="text-align: right;padding-top: 0;">
		                 <span class="blinking">내 강의 등록하러 가기 → </span>&nbsp;
		                 <a href="lessonAdd.do" class="class-btn_w">강의등록</a>
	   		 		</div>
				</c:when>
				<c:when test="${rightTrainer eq '0'}">
					<br/>
					<br/>			
				</c:when>
			</c:choose>
			
			<div class="row">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<c:if test="${result.lessonPrivateFlag eq 'N'}">
			<input type="hidden" name="lessonSeq">
				
<!-- 				<ul class="row prmPList"  id="firstRow"> -->
<!--                     <li class="col-sm-6 col-lg-4"> -->
<!--                         <a class="aa" href="/class/296"> -->
<%--                             <div class="imgHolder" style="background-image: url('http://192.168.41.6:9999/upload/profit/${result.fileSaveName}')"> --%>
<!--                                 <strong class="title">요요 그만! 문도경 코치의 인생 마지막 다이어트</strong> -->
<!--                                 <img class="coachPic" src="https://storage.googleapis.com/workout-72a55.appspot.com//workout/1100/20210310/문도경_사진_7.jpeg_1615360121936_22.286711345795517" alt="문도경"> -->
<!--                             </div> -->
<!--                             <div class="textHolder">
<!--                                 <em class="category">홈 트레이닝</em> -->
<!--                                 <strong class="title">요요 그만! 문도경 코치의 인생 마지막 다이어트</strong> -->
<!--                                 <b class="author">문도경</b> -->
<!--                                 <div class="price"> -->
<!--                                     <small>월</small> ₩<span class="commify">20000</span> -->
<!--                                 </div> -->
<!--                                 <div class="meta"> -->
<!--                                     <span>참여 <span class="commify"></span></span> -->
<!--                                 </div> 
<!--                             </div> --> 
<!--                             <div class="txtHolder"> -->
<%--                                 <small class="category">${result.lessonCategoryName}</small> --%>
<!--                                 <small class="period">4주 / 주3회 / 20분</small> -->
                                
<!--                                 <small class="custom">맞춤형</small> -->
                                
<%--                                 <strong class="title">${result.lessonTitle}</strong> --%>
<!--                                 <div class="meta"> -->
<%--                                     <span><b class="author">${result.inUserId}</b></span> --%>
                                    
                                    
<!--                                     <span class="remaining">남은 자리 <i class="commify">12</i></span> -->
<!--                                 </div> -->
<!--                                 <div class="price"> -->
<!--                                     <del><i class="commify">200,000</i>원</del> -->
<!--                                     <b>50% 할인</b> -->
<!--                                     <strong>월 <i class="commify">20,000</i>원 <small>(5개월 무이자 할부시)</small></strong> -->
<!--                                 </div> -->
<!--                             </div>/.txtHolder -->
<!--                         </a> -->
<!--                     </li> -->
<!--                  </ul> -->
			
			
			
				<div class="col-lg-4 col-md-6">
					<div class="classes__item classes__item__page" style="border-radius: 20px;">
					<a href="lessonDetail.do?lessonSeq=${result.lessonSeq}">
						<div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${result.fileSaveName}" style="border-top-left-radius:20px;border-top-right-radius:20px;">
						</div>
						<div class="classes__item__text" style=" padding: 5px 3px 5px 8px;">
							<div style="text-align: right;">
								<div style="display: inline-block;vertical-align:sub;float: left">
									<p style="margin:0;">${fn:substring(result.inDate,0,10)}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.lessonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/reply.PNG" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonReply}&nbsp;&nbsp;</p>
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
									<p>${result.lessonGood}&nbsp;&nbsp;</p>
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
									<p>${result.lessonBook}&nbsp;&nbsp;</p>
								</div>
							</div>
							<p style="color:#CE60FA;">카테고리 | <span>${result.lessonCategoryName}</span>&nbsp;&nbsp; <span style="color:#FFB400;">맞춤형</span></p>
							<h4 style="margin-bottom: 10px; font-size: 18px; color:#123;">
								<strong>${result.lessonTitle}</strong>
							</h4>
							<div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
								</div>
								&nbsp;
								<div style="display: inline-block;">
									<h6 style="margin-bottom: 1px;">${result.memberName}</h6>
								</div>
							</div>
							<hr>
							<div id="price" style="display: inline-block;">
								<span style="color:#D25A5A;display: block;"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.lessonPrice}" /> 원</span>
								<span style="color: #444;display: block;">월  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.lessonPrice / 5}" />원 (5개월할부시) </span>
							</div>
							<div style="width: 60px;height: 60px; border-radius: 70%;overflow: hidden;display: inline-block; float:right;margin-right: 30px; ">
								<img src="${result.profilePath}" style=" width: 100%;height: 100%;object-fit: cover;">
							</div>
						</div>
						<br/>
						</a>
					</div>
				</div>
				</c:if>
				</c:forEach>
				
				<!-- 페이징처리 -->
				<div class="col-lg-12">
					<div class="classes__pagination">
					<c:if test="${pageMaker.prev}">
						<a href="lessonList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">
							<span class="arrow_carrot-left"></span>
						</a>
					</c:if> 
					
					<c:set var="page" value="${pageMaker.cri.page}"/>
					<c:set var="idx" value="${idx}"/>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            			<a href="lessonList.do${pageMaker.makeQuery(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="lessonList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
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