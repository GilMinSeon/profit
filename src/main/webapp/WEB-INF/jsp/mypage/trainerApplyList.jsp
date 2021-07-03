<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* body{
    background:#eee;
    margin-top:20px;
} */
.hori-timeline .events {
	border-top: 3px solid #e9ecef;
}

.hori-timeline .events .event-list {
	display: block;
	position: relative;
	text-align: center;
	padding-top: 70px;
	margin-right: 0;
}

.hori-timeline .events .event-list:before {
	content: "";
	position: absolute;
	height: 36px;
	border-right: 2px dashed #dee2e6;
	top: 0;
}

.hori-timeline .events .event-list .event-date {
	position: absolute;
	top: 38px;
	left: 0;
	right: 0;
	width: 75px;
	margin: 0 auto;
	border-radius: 4px;
	padding: 2px 4px;
}

@media ( min-width : 1140px) {
	.hori-timeline .events .event-list {
		display: inline-block;
		width: 24%;
		padding-top: 45px;
	}
	.hori-timeline .events .event-list .event-date {
		top: -12px;
	}
}

.bg-soft-primary {
	background-color: rgba(64, 144, 203, .3) !important;
}

.bg-soft-success {
	background-color: rgba(71, 189, 154, .3) !important;
}

.bg-soft-danger {
	background-color: rgba(231, 76, 94, .3) !important;
}

.bg-soft-warning {
	background-color: rgba(249, 213, 112, .3) !important;
}

.card {
	border: none;
	margin-bottom: 24px;
	-webkit-box-shadow: 0 0 13px 0 rgba(236, 236, 241, .44);
	box-shadow: 0 0 13px 0 rgba(236, 236, 241, .44);
}

/*  */
input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 30px #ecedf2 inset !important;
	-webkit-text-fill-color: black !important;
}

#trainerAward::-webkit-input-placeholder, #trainerCareer::-webkit-input-placeholder
	{
	color: gray;
}

.text-warning {
    color: black !important;
}
</style>

<script type="text/javascript">
</script>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
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


				<!-- 사이드바 시작 -->
				<div class="col-lg-4 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>카테고리</h4>
							<ul>
								<li><a href="myinfo.do">내정보</a></li>
								<li><a href="bookmark.do">북마크</a></li>
								<li><a href="myLessonList.do">마이클래스</a></li>
								<li><a href="myChatList.do">1:1채팅내역</a></li>
							</ul>
						</div>

						<br>
						<div class="classes__sidebar">
							<div class="classes__sidebar__item classes__sidebar__item--info">
								<h4>채팅이용권</h4>
								<ul class="classes__sidebar__item__widget">
									<li>이용권 보유 개수 ▶ 3회</li>
									<li><a href="ticketBuyList.do">이용권 구매내역</a></li>
									<br>
									<li><a href="ticketUseList.do">이용권 사용내역</a></li>
								</ul>
								<br> <a href="#" class="sidebar-btn">구매하기</a>
							</div>
						</div>

						<br>
						<div class="classes__sidebar">
							<div class="classes__sidebar__item classes__sidebar__item--info">
								<h4>트레이너 신청</h4>
								<ul class="classes__sidebar__item__widget">
									<li><span class="icon_calendar"></span><a href="trainerApplyList.do">나의 신청내역</a></li>
									<li><span class="icon_id"></span><a href="trainerApply.do">신청하기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 여기부터 달라짐 -->
				<div class="col-lg-8 order-lg-2 order-1">
					<div class="row" style="display: inline-block; width: 100%;">
						<!-- Appoinment Section Begin -->
						<section class="appointment" style="margin-bottom: 50px;">
							<div class="container">
							<div class="appointment__text" style="background-color: #9e9e9e0a; padding: 20px 10px;">
							<c:set var="msg" value="${msg}" />
							<c:if test="${msg == 'no' }">
							<br><br><br><br>
							<p style="font-family: DM Sans, sans-serif;font-size: 1.4em;color:#5768AD;text-align: center;"><b>신청내역이 없습니다</b></p>
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							</c:if>
							
							
							
							
							
							<c:if test="${msg == 'yes' }">
							<!-- 여기부터가 신청 정보 있으면 보이는 곳 -->
								

							<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;text-align: center;"><b>신청 진행상황 </b></p>
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<div class="card">
													<div class="card-body">
														<div class="hori-timeline" dir="ltr">
															<ul class="list-inline events">
																<li class="list-inline-item event-list">
																		<!-- <h5 class="font-size-16">2021-07-02</h5> -->
																	<div class="px-4">
																		<div class="event-date bg-soft-primary text-primary" style="font-size: 16px;font-weight: 900">신청완료</div>
																		<p class="text-muted"></p>
																		<c:set var="status" value="${vo.processStatus}" />
																		<c:if test="${status == 'A' }">
																		<div>
																			<a href="#" class="btn btn-primary btn-sm">NOW</a>
																		</div>
																		</c:if>
																		
																		
																	</div>
																</li>
																<li class="list-inline-item event-list">
																	<div class="px-4">
																		<div class="event-date bg-soft-success text-success" style="font-size: 16px;font-weight: 900">검토중</div>
																		<h5 class="font-size-16"> </h5>
																		<p class="text-muted"></p>
																		<c:if test="${status == 'B' }">
																		<div>
																			<a href="#" class="btn btn-primary btn-sm">NOW</a>
																		</div>
																		</c:if>
																	</div>
																</li>
																<li class="list-inline-item event-list">
																	<div class="px-4">
																		<div class="event-date bg-soft-danger text-danger" style="font-size: 16px;font-weight: 900">보완요청</div>
																		<!-- <h5 class="font-size-16">Event Three</h5> -->
																		<p class="text-muted"></p>
																		<c:if test="${status == 'C' }">
																		<div>
																			<a href="#" class="btn btn-primary btn-sm">NOW</a>
																		</div>
																		</c:if>
																	</div>
																</li>
																<li class="list-inline-item event-list">
																	<div class="px-4">
																		<div class="event-date bg-soft-warning text-warning" style="font-size: 16px;font-weight: 900;">승인완료</div>
																		<!-- <h5 class="font-size-16">Event Four</h5> -->
																		<p class="text-muted"></p>
																		<c:if test="${status == 'E' }">
																		<div>
																			<a href="#" class="btn btn-primary btn-sm">NOW</a>
																		</div>
																		</c:if>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<!-- end card -->
											</div>
										</div>
									</div>
									
									
									<div class="text-center">
										<h4 style="font-family: DM Sans, sans-serif; color: #111111; font-weight: 400;"></h4>
										<br />
										<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;"><b>나의 신청정보 </b></p>
										<form id="frm" class="appointment__form" method="post" enctype="multipart/form-data">
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left;">이름</h5>
													&nbsp;
												</div>
												<input id="trainerName" type="text" style="background-color: #3f51b50d; color: black;" value="${vo.memberName}"
													readonly="readonly">
											</div>
											
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left;">신청일</h5>
													&nbsp;
												</div>
												<input id="trainerName" type="text" style="background-color: #3f51b50d; color: black;" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${vo.inDate}'/>"
													readonly="readonly">
											</div>
											

											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">성별</h5>
													&nbsp;
												</div>
												<div class="r_gender">
													<input type="radio" name="gendType" id="male" value="M" autocomplete="off" style="opacity: 0;"
														onclick="return(false);"> <label for="male" style="border: 1px solid; float: left;">남자</label> 
														<input type="radio" name="gendType" id="female" checked value="F" autocomplete="off" style="opacity: 0;"
														onclick="return(false);"> <label for="female" style="border: 1px solid;">여자</label>
												</div>
											</div>
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">핸드폰번호</h5>
													&nbsp;
												</div>
												<input id="mobile" type="text" placeholder="Mobile" style="background-color: #3f51b50d; color: black;"
													value="${fn:substring(vo.memberMobile,0,3)}-${fn:substring(vo.memberMobile,3,7)}-${fn:substring(vo.memberMobile,7,11)}"
													readonly="readonly">
											</div>
											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">소속헬스장</h5>
													&nbsp;
												</div>
												<input id="trainerGym" name="trainerGym" type="text" placeholder="소속 헬스장을 입력하세요" name="trainerGym"
													style="background-color: #3f51b50d; color: black;" value="${vo.trainerGym }">
											</div>

											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">수상이력</h5>
													&nbsp;
												</div>
												<div class="row">
													<div class="col-lg-12"></div>
													<div class="col-lg-12 text-center">
														<textarea id="trainerAward" name="trainerAward"
															style="background-color: #3f51b50d; color: black; margin-bottom: 20px; resize: none;"
															placeholder="수상 이력을 입력하세요">${vo.trainerAward }</textarea>

													</div>
												</div>
											</div>


											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">경력</h5>
													&nbsp;
												</div>
												<div class="row">
													<div class="col-lg-12"></div>
													<div class="col-lg-12 text-center">
													
														<textarea id="trainerCareer" name="trainerCareer"
															style="background-color: #3f51b50d; color: black; margin-bottom: 20px; resize: none;"
															placeholder="경력을 입력하세요">${vo.trainerCareer }
															
															</textarea>
														
													</div>
												</div>
											</div>



											<div class="col-lg-6 text-center mypage_myinfo"
												style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
												<div style="margin-bottom: 2px;">
													<h5 style="display: inline; float: left; color: black;">첨부파일</h5>
													&nbsp;
													<div class="col-lg-12" style="text-align: left; float: left; padding: 20px; margin:0px; background-color: #3f51b50d;">
															<c:forEach var="fileVO" items="${fileVO}" varStatus="status">
															${fileVO.fileRealName }
															<a href="${fileVO.filePath }">파일 열기</a><br>
															</c:forEach>
															
															
															
													</div>
												</div>


												<div class="input-group" style="margin-bottom: 5px;"></div>
											</div>

										</form>

									</div>
								</div>
								<!-- 여기부터가 신청 정보 있으면 보이는 곳  끝-->
								</c:if>
								
								
							</div>
						</section>
						<!-- Appoinment Section End -->
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