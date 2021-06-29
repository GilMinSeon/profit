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
						<h2>강의 목록</h2>
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
				<div class="col-lg-12">
					<div class="section-title">
						<h3>인기 강의 TOP 3</h3>
						<p>지금 가장 인기있는 강의를 확인해 보세요!!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="team__slider owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="transform: translate3d(-1440px, 0px, 0px); transition: all 1.2s ease 0s; width: 2520px;">
<%-- 						<c:forEach var="result" items="${resultList}" varStatus="status"> --%>
							<div class="owl-item cloned" style="width: 360px;">
								<div class="col-lg-6">
									<div class="team__item" style="padding-top: 10px; padding-bottom: 10px;">
										<div class="classes__item__pic set-bg" data-setbg="./resources/img/classes/DwayneJohnson.jpg" style="background-image: url(&quot;./resources/img/deit_2.jpg&quot;);">
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
											<a href="lessonDetail.do?lessonSeq=${result.lessonSeq}" class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
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
			<input type="hidden" name="lessonSeq">
				<div class="col-lg-4 col-md-6">
					<div class="classes__item classes__item__page">
						<div class="classes__item__pic set-bg" data-setbg=${result.filePath} style="background-image: url(&quot;./resources/img/classes/classes-1.jpg&quot;);"></div>
						<div class="classes__item__text" style="padding-left: 5px; padding-right: 5px;">
							<div style="text-align: right;">
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/look.PNG" style="width: 30px; height: 20px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;">
									<p>${result.lessonHit }</p>
								</div>
								|&nbsp;
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/reply.PNG" style="width: 24px; height: 19px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;">
									<p>${result.lessonReply}</p>
								</div>
								|&nbsp;
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/good.PNG" style="width: 22px; height: 20px;">
								</div>
								<div style="display: inline-block;">
									<p>${result.lessonGood}</p>
								</div>
							</div>
							<p>카테고리 | <span>${result.lessonCategoryName}</span></p>
							<h4 style="margin-bottom: 30px;">
								<a href="lessionDetail">${result.lessonTitle}</a>
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
	

	<script>
// 	function fn_lessonDetail(lessonSeq){
// 		var params = location.search.substr(location.search.indexOf("?") + 1);
// 		var lessonSeq = params.substr(params.indexOf("=")+1);	
// 		console.log(lessonSeq);
// 		var param = "";
// 		param += "dummy=" + Math.random();
// 		param += "&lessonSeq="+lessonSeq;
		
// 		$.ajax({
// 			url : "lessonDetail_view",
// 			data : param,
// 			dataType : "text",
// 			statusCode : {
// 				404 : function() {
// 					alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
// 				}
// 			},
// // 			success : function(data) {
// // 				if(data.msg =="ok"){
// // 					alert("정상적으로 삭제되었습니다.");
// // 					location.href="home";
					
// // 				}else{
// // 					alert("삭제 도중 문제가 생겼습니다");
// // 				}
// // 			}
// 		});
// 	}
	
	
	</script>
	
</body>
</html>