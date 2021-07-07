<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
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
	background: #5768AD;
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
</style>

<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>레시피</h2>
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
					<div class="section-title" style="margin-top: 50px;">
						<h2 style="font-weight: bold;">🏆인기글 TOP 6</h2>
						<br>
						<p style="color: #535353; font-size: 1.2em;">지금 가장 조회수가 많은 레시피를 확인해 보세요!!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="team__slider owl-carousel">
					<c:forEach var="data" items="${data}" varStatus="status">
						<div class="col-lg-6">
							<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
								<div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${data.fileSeq}">
									<span>${data.inDate}</span>
								</div>
								<div class="classes__item__text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0; padding-right: 0;">
									<div style="text-align: right;">
										<div style="display: inline-block; vertical-align: middle;">
											<img src="./resources/img/common/hit.png" style="width: 30px; height: 20px; opacity: 0.5;">
										</div>
										<div style="display: inline-block; vertical-align: sub;">
											<p style="margin: 0;">${data.commonHit}&nbsp;&nbsp;</p>
										</div>
										<div style="display: inline-block; vertical-align: middle;">
											<img src="./resources/img/common/reply.PNG" style="width: 17px; height: 17px; opacity: 0.5;">
										</div>
										<div style="display: inline-block; vertical-align: sub;">
											<p>${data.lessonReply}댓글&nbsp;&nbsp;</p>
										</div>
										<div style="display: inline-block; vertical-align: middle;">
											<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
										</div>
										<div style="display: inline-block; vertical-align: sub;">
											<p>${data.lessonGood}좋아요&nbsp;&nbsp;</p>
										</div>
										<div style="display: inline-block; vertical-align: middle;">
											<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
										</div>
										<div style="display: inline-block; vertical-align: sub;">
											<p>${data.lessonBook}북마크&nbsp;&nbsp;</p>
										</div>
									</div>
									<h4 style="margin-bottom: 10px;">
										<a style="font-size: 0.8em; font-weight: bold;">${data.commonTitle}</a>
									</h4>
									<div>
										<div style="display: inline-block; vertical-align: middle;">
											<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;" />
										</div>
										&nbsp;
										<div style="display: inline-block;">
											<h6 style="margin-bottom: 25px; color: #535353">${data.inUserId}</h6>
										</div>
									</div>
									<a href="recipeDetail.do?communitySeq=${data.communitySeq}" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
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
						<form method="get" id="frm" action="lessonList.do#location123">
							<div class="class__filter__select">
								<p>Level:</p>
								<select name="selLev" id="selLev">
									<option value="">전체</option>
									<option value="조회순" <c:if test="${selLev == '조회순'}">selected</c:if>>조회순</option>
									<option value="좋아요순" <c:if test="${selLev == '좋아요순'}">selected</c:if>>좋아요순</option>
									<option value="댓글순" <c:if test="${selLev == '댓글순'}">selected</c:if>>댓글순</option>
								</select>
							</div>
							<div class="class__filter__input">
								<p>Search:</p>
								<input type="text" placeholder="검색" id="keyword" name="keyword" value="${keyword}">
							</div>
							<div class="class__filter__btn">
								<button type="submit" style="cursor: pointer;">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<span id="location123"></span>
						</form>
					</div>
				</div>
			</div>
			<div class="classes__item__text" style="text-align: right; padding-top: 0;">
				<span class="blinking">나만의 레시피 등록하러 가기 → </span>&nbsp;
				<a href="recipeAdd.do" class="class-btn_w">글쓰기</a>
			</div>
			<div class="row">

				<c:forEach var="data" items="${data}" varStatus="status">
					<div class="col-lg-4 col-md-6">
						<div class="classes__item classes__item__page">
							<div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${data.fileSeq}"></div>
							<div class="classes__item__text" style="padding-left: 5px; padding-right: 5px;">
								<div style="text-align: right;">
									<div style="display: inline-block; vertical-align: middle;">
										<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
									</div>
									<div style="display: inline-block; vertical-align: sub;">
										<p style="margin: 0;">${data.commonHit }&nbsp;&nbsp;</p>
									</div>
									<div style="display: inline-block; vertical-align: middle;">
										<img src="./resources/img/common/reply.PNG" style="width: 17px; height: 17px; opacity: 0.5;">
									</div>
									<div style="display: inline-block; vertical-align: sub;">
										<p>${data.commonHit}&nbsp;&nbsp;</p>
									</div>
									<div style="display: inline-block; vertical-align: middle;">
										<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</div>
									<div style="display: inline-block; vertical-align: sub;">
										<p>${data.commonHit}&nbsp;&nbsp;</p>
									</div>
									<div style="display: inline-block; vertical-align: middle;">
										<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</div>
									<div style="display: inline-block; vertical-align: sub;">
										<p>${data.commonHit}&nbsp;&nbsp;</p>
									</div>
								</div>
								<p style="color: #CE60FA;"></p>
								<h4 style="margin-bottom: 30px;">
									<a href="lessonDetail.do" style="font-size: 0.8em; font-weight: bold;">${data.commonTitle}</a>
								</h4>
								<div>
									<div style="display: inline-block; vertical-align: middle;">
										<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
									</div>
									&nbsp;
									<div style="display: inline-block;">
										<h6 style="margin-bottom: 25px;">${data.inUserId}</h6>
									</div>
								</div>
								<a href="recipeDetail.do?communitySeq=${data.communitySeq}" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
							</div>
						</div>
					</div>

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