<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<div class="col-lg-12">
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
			<div class="row">
				<div class="team__slider owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="transform: translate3d(-1440px, 0px, 0px); transition: all 1.2s ease 0s; width: 2520px;">
							<div class="owl-item cloned" style="width: 360px;">
								<div class="col-lg-6">
									<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
										<div class="classes__item__pic set-bg" data-setbg="./resources/img/classes/DwayneJohnson.jpg" style="background-image: url(&quot;./resources/img/deit_2.jpg&quot;);">
										</div>
										<div class="classes__item__text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0; padding-right: 0;">
											<div style="text-align: right;">
												<div style="display: inline-block;vertical-align:sub;float: left">
													<p style="margin:0;">2021-09-09&nbsp;&nbsp;</p>
												</div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;vertical-align:sub;">
													<p style="margin:0;">09&nbsp;&nbsp;</p>
												</div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/reply.PNG" style="width: 17px; height: 17px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;vertical-align:sub;">
													<p>19&nbsp;&nbsp;</p>
												</div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
												</div>
												<div style="display: inline-block;vertical-align:sub;">
													<p>111&nbsp;&nbsp;</p>
												</div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
												</div>
												<div style="display: inline-block;vertical-align:sub;">
													<p>43&nbsp;&nbsp;</p>
												</div>
											</div>
											<div>
											<p style="color:#CE60FA;">카테고리 | <span>운동</span>&nbsp;&nbsp; <span style="color:#FFB400;">맞춤형</span></p>
											<h4 style="margin-bottom: 10px; font-size: 18px; color:#123;">
												<strong>${result.lessonTitle}</strong>
											</h4>
											<div style="display: inline-block; vertical-align: middle;">
												<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
											</div>
											&nbsp;
											<div style="display: inline-block;">
												<h6 style="margin-bottom: 1px;">나나</h6>
											</div>
											<hr>
											<div id="price" style="display: inline-block;">
												<span style="color:#D25A5A;display: block;"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.lessonPrice}" /> 원</span>
												<span style="color: #444;display: block;">월  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.lessonPrice / 5}" />원 (5개월할부시) </span>
											</div>
											<div style="width: 60px;height: 60px; border-radius: 70%;overflow: hidden;display: inline-block; float:right;margin-right: 30px; ">
												<img src="./resources/img/common/writer.PNG" style=" width: 100%;height: 100%;object-fit: cover;">
											</div>
										</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item" style="width: 360px;">
								<div class="col-lg-6">
									<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
										<div class="classes__item__pic set-bg" data-setbg="./resources/img/diet.jpg" style="background-image: url(&quot;./resources/img/diet.jpg&quot;);">
											<span>20 Jun 2020</span>
										</div>
										<div class="classes__item__text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0; padding-right: 0;">
											<div style="text-align: right;">
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/look.PNG" style="width: 30px; height: 20px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>1000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/reply.PNG" style="width: 24px; height: 19px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>2000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/good.PNG" style="width: 22px; height: 20px;">
												</div>
												<div style="display: inline-block;">
													<p>400</p>
												</div>
											</div>
											<br>
											<h4 style="margin-bottom: 30px; font-weight: bold;">
												<a href="#">가볍고 든든한 다이어트 한끼 식사</a>
											</h4>
											<div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
												</div>
												&nbsp;
												<div style="display: inline-block;">
													<h6 style="margin-bottom: 25px;">뽀미언니</h6>
												</div>
											</div>
											<a href="lessionDetail" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item active" style="width: 360px;">
								<div class="col-lg-6">
									<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
										<div class="classes__item__pic set-bg" data-setbg="./resources/img/diet.jpg" style="background-image: url(&quot;./resources/img/diet.jpg&quot;);">
											<span>20 Jun 2020</span>
										</div>
										<div class="classes__item__text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0; padding-right: 0;">
											<div style="text-align: right;">
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/look.PNG" style="width: 30px; height: 20px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>1000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/reply.PNG" style="width: 24px; height: 19px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>2000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/good.PNG" style="width: 22px; height: 20px;">
												</div>
												<div style="display: inline-block;">
													<p>400</p>
												</div>
											</div>
											<br>
											<h4 style="margin-bottom: 30px; font-weight: bold;">
												<a href="#">가볍고 든든한 다이어트 한끼 식사</a>
											</h4>
											<div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
												</div>
												&nbsp;
												<div style="display: inline-block;">
													<h6 style="margin-bottom: 25px;">뽀미언니</h6>
												</div>
											</div>
											<a href="lessionDetail" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 360px;">
								<div class="col-lg-6">
									<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
										<div class="classes__item__pic set-bg" data-setbg="./resources/img/deit_2.jpg" style="background-image: url(&quot;./resources/img/deit_2.jpg&quot;);">
											<span>20 Jun 2020</span>
										</div>
										<div class="classes__item__text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0; padding-right: 0;">
											<div style="text-align: right;">
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/look.PNG" style="width: 30px; height: 20px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>1000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/reply.PNG" style="width: 24px; height: 19px; opacity: 0.5;">
												</div>
												<div style="display: inline-block;">
													<p>2000</p>
												</div>
												|&nbsp;
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/good.PNG" style="width: 22px; height: 20px;">
												</div>
												<div style="display: inline-block;">
													<p>400</p>
												</div>
											</div>
											<br>
											<h4 style="margin-bottom: 30px; font-weight: bold;">
												<a href="#">가볍고 든든한 다이어트 한끼 식사</a>
											</h4>
											<div>
												<div style="display: inline-block; vertical-align: middle;">
													<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
												</div>
												&nbsp;
												<div style="display: inline-block;">
													<h6 style="margin-bottom: 25px;">뽀미언니</h6>
												</div>
											</div>
											<a href="lessionDetail" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
										</div>
									</div>
								</div>
							</div>
<%-- 							</c:forEach> --%>
						</div>
					</div>
					<div class="owl-dots disabled"></div>
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