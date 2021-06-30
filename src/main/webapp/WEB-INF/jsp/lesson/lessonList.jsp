<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
                    <div class="section-title">
                        <h3>인기 강의 TOP 3</h3>
                        <p>지금 가장 인기있는 강의를 확인해 보세요!!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="team__slider owl-carousel">
				<c:forEach var="resultTop" items="${resultTopList}" varStatus="status">
				<c:if test="${resultTop.lessonPrivateFlag eq 'n'}">
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:10px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${resultTop.fileSaveName}">
                            <span>${resultTop.inDate}</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/hit.png" style="width:30px;height: 20px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>${resultTop.lessonHit}</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/reply.PNG" style="width:24px;height: 19px;opacity: 0.5;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>${resultTop.lessonReply}</p>
	                            </div> |&nbsp;
	                            <div style="display: inline-block;vertical-align: middle;">
	                            	<img src="./resources/img/common/good.PNG" style="width:22px;height: 20px;">
	                            </div>
	                            <div style="display: inline-block;">
	                            	<p>${resultTop.lessonGood}</p>
	                            </div> 
                            </div>
							<p>카테고리 | <span>${resultTop.lessonCategoryName}</span></p>
                            <h4 style="margin-bottom: 30px;">
								<a href="#" style="font-size: 0.8em;font-weight: bold;">${resultTop.lessonTitle}</a>
							</h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;">${resultTop.inUserId}</h6>
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
						<form action="#">
							<div class="class__filter__select">
								<p>Categories:</p>
								<select>
									<option>카테고리</option>
									<option>헬스</option>
									<option>필라테스</option>
									<option>요가</option>
									<option>맨몸운동</option>
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
								<input type="text" placeholder="검색">
							</div>
							<div class="class__filter__btn">
								<button>
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="classes__item__text" style="text-align: right;padding-top: 0;">
                 <span class="blinking">내 강의 등록하러 가기 → </span>&nbsp;
                 <a href="lessonAdd.do" class="class-btn_w">강의등록</a>
   		 	</div>
			<div class="row">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<c:if test="${result.lessonPrivateFlag eq 'n'}">
			<input type="hidden" name="lessonSeq">
				<div class="col-lg-4 col-md-6">
					<div class="classes__item classes__item__page">
						<div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${result.fileSaveName}"></div>
						<div class="classes__item__text" style="padding-left: 5px; padding-right: 5px;">
							<div style="text-align: right;">
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.lessonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/reply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonGood}&nbsp;&nbsp;</p>
								</div>
							</div>
							<p>카테고리 | <span>${result.lessonCategoryName}</span></p>
							<h4 style="margin-bottom: 30px;">
								<a href="lessonDetail.do" style="font-size: 0.8em;font-weight: bold;">${result.lessonTitle}</a>
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
							<a href="lessonDetail.do?lessonSeq=${result.lessonSeq}"  class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
				<div class="col-lg-12">
					<div class="classes__pagination">
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">
							<span class="arrow_carrot-right"></span>
						</a>
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