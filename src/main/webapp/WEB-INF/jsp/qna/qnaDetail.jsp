<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<body>
<c:set var="data" value="${data}" />
	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg"
		data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>문의하기</h2>
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


					<div style="margin-bottom: 30px; text-align: center;">
						<span style="font-size: 1.3em; font-weight: bold;"><c:out
								value="${data.commonTitle}" /></span>
					</div>
					<div style="text-align: right; margin-bottom: 5px;">
						<span style="margin-left: 30px;">
							작성일&nbsp;&nbsp;&nbsp;<c:out value="${data.inDate}" />
						</span>
					</div>
					<div class="blog__details">
						<div class="blog__details__large">

							<img src="./resources/img/blog/details/blog-large.jpg" alt="">
							<span>
								<c:out value="${data.inUserId}" />
							</span>
						</div>
						<div class="blog__details__text">
							<p id="text">썸머노트로 변경할부분</p>
						</div>
						<div class="classes__item__text" style="text-align: center;">
							<a href="qnaList.do" class="class-btn">목록 </a>
							<a href="${path}qnaMod.do?communitySeq=${data.communitySeq}" class="class-btn">수정</a>
							<a href="${path}qnaDelete.do?communitySeq=${data.communitySeq}" class="class-btn">삭제</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 order-lg-1 order-2"
				style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">

				<div class="blog__sidebar">

					<div class="blog__sidebar__comment"
						style="overflow: scroll; height: 500px;">
						<h4>댓글</h4>
						<div class="classes__sidebar__comment">
							<div class="classes__sidebar__comment__pic">
								<img src="./resources/img/classes-details/comment-1.png" alt="">
								<div class="classes__sidebar__comment__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-half-o"></i>
								</div>
							</div>
							<div class="classes__sidebar__comment__text">
								<span>04 Mar 2018</span>
								<h6>Brandon Kelley</h6>
								<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit,</p>
							</div>
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