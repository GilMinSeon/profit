<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<body>


	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>공지사항</h2>
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
				<div class="col-lg-8 order-lg-2 order-1">
					<div class="blog__details">
						<div style="margin-bottom: 30px; text-align: center;">
							<c:set var="data" value="${data}" />
							<span style="font-size: 1.3em; font-weight: bold;">${data.commonTitle}</span>
						</div>
						<div style="text-align: right; margin-bottom: 5px;">
							<span style="margin-left: 30px;">작성일&nbsp;&nbsp;&nbsp;<a>${data.inDate}</a></span>
						</div>
						<div class="blog__details__text">
							<p>${data.commonContent}</p>
						</div>
						<div class="classes__item__text" style="text-align: center;">
							<a href="noticeList.do" class="class-btn">목록</a>
							<c:set var="inUser" value="${sessionScope.memberId}" />
							<c:if test="${inUser eq '1'}">
								<a href="${path}noticeMod.do?communitySeq=${data.communitySeq}" class="class-btn">수정</a>
								<a href="${path}noticeDelete.do?communitySeq=${data.communitySeq}" class="class-btn">삭제</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

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