<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* body { */
/*     margin: 0; */
/*     font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; */
/*     font-size: .88rem; */
/*     font-weight: 400; */
/*     line-height: 1.5; */
/*     color: #495057; */
/*     text-align: left; */
/*     background-color: #eef1f3 */
/* } */
.mt-100 {
	margin-top: 80px
}

.card {
	box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem
		1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem
		rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
	border-width: 0;
	transition: all .2s
}

.card-header:first-child {
	border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}

.card-header {
	display: flex;
	align-items: center;
	border-bottom-width: 1px;
	padding-top: 0;
	padding-bottom: 0;
	padding-right: .625rem;
	height: 3.5rem;
	background-color: #fff;
	border-bottom: 1px solid rgba(26, 54, 126, 0.125)
}

.btn-primary.btn-shadow {
	box-shadow: 0 0.125rem 0.625rem rgba(63, 106, 216, 0.4), 0 0.0625rem
		0.125rem rgba(63, 106, 216, 0.5)
}

.btn.btn-wide {
	padding: .375rem 1.5rem;
	font-size: .8rem;
	line-height: 1.5;
	border-radius: .25rem
}

.btn-primary {
	color: #fff;
	background-color: #3f6ad8;
	border-color: #3f6ad8
}

.form-control {
	display: block;
	width: 100%;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out
}

.card-body {
	flex: 1 1 auto;
	padding: 1.25rem
}

.flex-truncate {
	min-width: 0 !important
}

.d-block {
	display: block !important
}

a {
	color: #E91E63;
	text-decoration: none !important;
	background-color: transparent
}

.media img {
	width: 40px;
	height: auto
}
</style>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg">
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
				<div class="col-lg-4 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>카테고리</h4>
							<ul>
								<li><a href="myinfo">내정보</a></li>
								<li><a href="bookmark">북마크</a></li>
								<li><a href="trainerApply">트레이너신청(전)</a></li>
								<li><a href="trainerInfo">트레이너정보(후)</a></li>
								<li><a href="listenList">마이클래스(일반)</a></li>
								<li><a href="teachList">마이클래스(트레이너)</a></li>
								<li><a href="myChatList">상담내역</a></li>
								<li><a href="ticketPayList">이용권 구매내역</a></li>
							</ul>
						</div>
						<div class="blog__sidebar__recent">
							<h4>최신글</h4>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-1.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>09 Kinds Of Vegetables Protect The Liver</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-2.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>Tips You To Balance Nutrition Meal Day</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
							<div class="blog__recent__item">
								<div class="blog__recent__item__pic">
									<img src="./resources/img/blog/br-3.jpg" alt="">
								</div>
								<div class="blog__recent__item__text">
									<h6>4 Principles Help You Lose Weight With Vegetables</h6>
									<span>MAR 05, 2019</span>
								</div>
							</div>
						</div>
						<div class="blog__sidebar__tags">
							<h4>인기 검색어</h4>
							<a href="#">Weight</a> <a href="#">Beauty</a> <a href="#">Yoga
								Ball</a> <a href="#">Fruit</a> <a href="#">Healthy Food</a> <a
								href="#">Lifestyle</a>
						</div>
					</div>
				</div>
				<!-- 여기부터 달라짐 -->
				<div class="col-lg-8 order-lg-2 order-1">
					<div class="row">

						<div class="container-fluid mt-100" style="margin: 0">
							<div class="d-flex flex-wrap justify-content-between">
								<div class="col-12 col-md-3 p-0 mb-3">
									<input type="text" class="form-control" placeholder="Search...">
								</div>
							</div>
							<div class="card mb-3">
								<div class="card-header pl-0 pr-0">
									<div class="row no-gutters w-100 align-items-center">
										<div class="col ml-3">Topics</div>
										<div class="col-4 text-muted">
											<div class="row no-gutters align-items-center">
												<div class="col-4">Replies</div>
												<div class="col-8">Last update</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="myChatDetail" class="text-big" data-abc="true">How
												can i change the username?</a>
											<div class="text-muted small mt-1">
												Started 25 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Neon Mandela</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">12</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583246/AAA/2.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">1 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Tim cook</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="m-0">
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="javascript:void(0)" class="text-big" data-abc="true">How
												to change the theme to dark mode?</a> <span
												class="badge badge-success align-text-bottom ml-1">Solved</span>
											<div class="text-muted small mt-1">
												Started 5 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Allize Rome</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">43</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583319/AAA/3.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">1 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Steve smith</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="m-0">
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="javascript:void(0)" class="text-big" data-abc="true">Is
												it possible to get the refund of the product i purhcased
												today?</a> <span
												class="badge badge-default align-text-bottom ml-1">Locked</span>
											<div class="text-muted small mt-1">
												Started 21 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Kane William</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">42</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">2 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Brethwett sonm</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="m-0">
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="javascript:void(0)" class="text-big" data-abc="true">Do
												you have android application for this tool?</a>
											<div class="text-muted small mt-1">
												Started 56 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Glen Maxwell</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">632</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583246/AAA/2.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">11 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Neil patels</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="m-0">
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="javascript:void(0)" class="text-big" data-abc="true">How
												can i transfer my fund to my friend</a> <span
												class="badge badge-secondary align-text-bottom ml-1">Closed</span>
											<div class="text-muted small mt-1">
												Started 25 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Marry Tom</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">53</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">1 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Tibok tom</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="m-0">
								<div class="card-body py-3">
									<div class="row no-gutters align-items-center">
										<div class="col">
											<a href="javascript:void(0)" class="text-big" data-abc="true">How
												can i delete my account?</a> <span
												class="badge badge-danger align-text-bottom ml-1">Hot!</span>
											<div class="text-muted small mt-1">
												Started 25 days ago &nbsp;·&nbsp; <a
													href="javascript:void(0)" class="text-muted"
													data-abc="true">Bob bulmer</a>
											</div>
										</div>
										<div class="d-none d-md-block col-4">
											<div class="row no-gutters align-items-center">
												<div class="col-4">12</div>
												<div class="media col-8 align-items-center">
													<img
														src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583246/AAA/2.jpg"
														alt="" class="d-block ui-w-30 rounded-circle">
													<div class="media-body flex-truncate ml-2">
														<div class="line-height-1 text-truncate">1 day ago</div>
														<a href="javascript:void(0)"
															class="text-muted small text-truncate" data-abc="true">by
															Ross taylor</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<nav>
								<ul class="pagination mb-5">
									<li class="page-item disabled"><a class="page-link"
										href="javascript:void(0)" data-abc="true">«</a></li>
									<li class="page-item active"><a class="page-link"
										href="javascript:void(0)" data-abc="true">1</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)" data-abc="true">2</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)" data-abc="true">3</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)" data-abc="true">»</a></li>
								</ul>
							</nav>
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