<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
function fn_delLesson(){
	var params = location.search.substr(location.search.indexOf("?") + 1);
    var lessonSeq = params.substr(params.indexOf("=")+1); 
    console.log(lessonSeq);
	var flag_ok = confirm("강의를 정말 비활성화 하시겠습니까?");
	if(flag_ok){
   		var param = "";
   		param += "dummy=" + Math.random();
   		param += "&lessonSeq=" + lessonSeq
   		console.log(param)

   		$.ajax({
   			url : "lesson_delAjax.do",
   			data : param,
   			dataType : "text",
   			statusCode : {
   				404 : function() {
   					alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
   				}
   			},
   			success : function(data) {
   				if(data == "ok"){
   					alert("해당 강의가 비활성화 되었습니다. \n 추후 활성화를 원하시면 마이페이지에서 수정해주세요.");	
   					location.reload();
   				} else{
   					alert("비활성화에 실패하였습니다. 다시 한 번 시도해주세요")
   				}
   				console.log(data)
   			}
   		});
		
		
	}
}


</script>
<style type="text/css">
.btn div {
	display: inline-block;
	padding-right: .75rem;
	padding-left: .75rem;
}

#t1, #t2, #t3, #t4 {
	display: none;
}

</style>
</head>
<body>
	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>온라인 강의</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Hero End -->
	<!-- 	main html 시작 -->
	<section class="about spad">
		<div class="container">
		<c:set var="resultList" value="${resultList}"/>
			<div class="row">
				<div class="col-lg-7 p-0" style="overflow: hidden; display: flex; align-items: center; justify-content: center;">
					<div class="about__pic" style="">
						<img src="http://192.168.41.6:9999/upload/profit/${resultList.fileSaveName}" alt="강의 이미지" style="width: 85%; height: 450px;">
					</div>
				</div>
				<div class="col-lg-5 p-0">
					<div class="about__text">
						<div class="section-title">
							<h2>${resultList.lessonTitle}</h2>
							<div>
								<div style="display: inline-block;"><p>※ 한줄 소개 : </p></div>&nbsp;
								<div style="display: inline-block;"><p style="color:#304060">${resultList.lessonTitleComment}</p></div>
							</div>
							<br/>
							<div>
								<div style="display: inline-block;"><p>※ 강의 가격 : </p></div>&nbsp;
								<div style="display: inline-block;"><p style="color:#304060">${resultList.lessonPrice} 원</p></div>
							</div>
						</div>
						<div class="about__bar">
							<div class="about__bar__item">
								<p>Breathing</p><br/>
								<div id="bar1" class="barfiller">
									<span class="tip" style="left: 562.603px; transition: left 1s ease-in-out 0s;">82%</span>
									<span class="fill" data-percentage="${resultList.lessonBalance}" style="background: rgb(87, 104, 173); width: 590.4px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Flexibility</p><br/>
								<div id="bar2" class="barfiller">
									<span class="tip" style="left: 497.803px; transition: left 1s ease-in-out 0s;">73%</span>
									<span class="fill" data-percentage="${resultList.lessonFlex}" style="background: rgb(87, 104, 173); width: 525.6px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Strongness</p><br/>
								<div id="bar3" class="barfiller">
									<span class="tip" style="left: 562.603px; transition: left 1s ease-in-out 0s;">82%</span>
									<span class="fill" data-percentage="${resultList.lessonStrong}" style="background: rgb(87, 104, 173); width: 590.4px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Core</p><br/>
								<div id="bar4" class="barfiller">
									<span class="tip" style="left: 591.403px; transition: left 1s ease-in-out 0s;">86%</span>
									<span class="fill" data-percentage="${resultList.lessonCore}" style="background: rgb(87, 104, 173); width: 619.2px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 	main html 시작 -->
	<!-- 	변경 DIV 시작 -->
	<script type="text/javascript">
		// 	style="border-bottom: 3px solid #7952B3;"
		$(function() {
			$('#tite1').click(function() {
				$('#li1').css('border-bottom', '3px solid #7952B3');
				$('#li2').css('border-bottom', '3px solid #ffffff');
				$('#li3').css('border-bottom', '3px solid #ffffff');
				$('#li4').css('border-bottom', '3px solid #ffffff');
				$('#t1').show().siblings('div').hide();
			})
		});
		$(function() {
			$('#tite2').click(function() {
				$('#li1').css('border-bottom', '3px solid #ffffff');
				$('#li2').css('border-bottom', '3px solid #7952B3');
				$('#li3').css('border-bottom', '3px solid #ffffff');
				$('#li4').css('border-bottom', '3px solid #ffffff');
				$('#t2').show().siblings('div').hide();
			})
		});
		$(function() {
			$('#tite3').click(function() {
				$('#li1').css('border-bottom', '3px solid #ffffff');
				$('#li2').css('border-bottom', '3px solid #ffffff');
				$('#li3').css('border-bottom', '3px solid #7952B3');
				$('#li4').css('border-bottom', '3px solid #ffffff');
				$('#t3').show().siblings('div').hide();
			})
		});
		$(function() {
			$('#tite4').click(function() {
				$('#li1').css('border-bottom', '3px solid #ffffff');
				$('#li2').css('border-bottom', '3px solid #ffffff');
				$('#li3').css('border-bottom', '3px solid #ffffff');
				$('#li4').css('border-bottom', '3px solid #7952B3');
				$('#t4').show().siblings('div').hide();
			})
		});
	</script>
	<section class="about spad">
		<div class="container">
			<main id="main" class="site-main" role="main">
				<!-- 				<div id="" class=""> -->
				<div class="classes__item__text" style="text-align: right;">
					<a href="lessonList.do" class="class-btn">목록</a>
					<a href="lessonMod.do?lessonSeq=${resultList.lessonSeq}" class="class-btn">수정</a>
					<a href="#" onclick="fn_delLesson()" class="class-btn">삭제</a>
					<a href="classAdd.do" class="class-btn">강의추가</a>
				</div>
				<div class="d-flex justify-content-between align-items-center has-border">
					<ul id="titeul" class="nav sub-nav sub-nav--has-border">
						<li class="nav-item" id="li1">
							<a id="tite1" class="nav-link sub-nav-link">클래스 소개</a>
						</li>
						<li class="nav-item" id="li2">
							<a id="tite2" class="nav-link sub-nav-link">커리큘럼</a>
						</li>
						<li class="nav-item" id="li3">
							<a id="tite3" class="nav-link sub-nav-link">리뷰</a>
						</li>
						<li class="nav-item" id="li4">
							<a id="tite4" class="nav-link sub-nav-link ">문의하기</a>
						</li>
					</ul>
				</div>
				<div class="tab-content" style="padding-bottom: 50px;">
					<div class="tab-pane fade mt-2 mt-lg-5 active show" id="description-tab" role="tabpanel" aria-expanded="false">
						<div id="t1" style="display: block;">
							<p>${resultList.lessonIntro}</p>
						</div>
						<div id="t2">
							<!-- Classes Section Begin -->
							<section class="classes spad">
								<div class="container">
									<h3>필라테스</h3>
									<br>
									<table class="table table-hover" style="text-align: center;">
										<tbody>
											<tr>
												<th style="vertical-align: middle;" scope="row"><h6>1</h6></th>
												<td style="vertical-align: middle;" colspan="3">
													<a href="classDetail"><img alt="" src="./resources/img/classes/kingbam.gif" width="100px"></a>
												</td>
												<td style="vertical-align: middle;">1강 필라테스</td>
												<td style="vertical-align: middle;">20:32</td>
											</tr>
											<tr>
												<th style="vertical-align: middle;" scope="row"><h6>2</h6></th>
												<td style="vertical-align: middle;" colspan="3">
													<a href="classDetail"><img alt="" src="./resources/img/classes/kingbam.gif" width="100px" ></a>
												</td>
												<td style="vertical-align: middle;">2강 필라테스</td>
												<td style="vertical-align: middle;">23:12</td>
											</tr>
										</tbody>
									</table>
								</div>
							</section>
							<!-- Classes Section End -->
						</div>
						<div id="t3">
							<div class="row">
								<div class="col-lg-12">
									<div class="leave__comment__text">
										<h2>자유롭게 리뷰를 달아보세요😁</h2>
										<form action="#">
											<div class="row">
												<div class="col-lg-12"></div>
												<div class="col-lg-12 text-center">
													<textarea placeholder="리뷰를 입력해 주세요."></textarea>
													<button type="submit" class="site-btn" style="font-size: 1.2em;">작성 완료</button>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="col-lg-4 order-lg-1 order-2" style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">
									<div class="blog__sidebar">
										<div class="blog__sidebar__comment" style="overflow: scroll; height: 500px;">
											<h4>리뷰</h4>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-2.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Christina Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="t4">
							<div class="row">
								<div class="col-lg-12">
									<div class="leave__comment__text">
										<h3>📝 문의를 남겨주세요</h3>
										<form action="#">
											<div class="row">
												<div class="col-lg-12"></div>
												<div class="col-lg-12 text-center">
													<textarea placeholder="리뷰를 입력해 주세요."></textarea>
													<button type="submit" class="site-btn" style="font-size: 1.2em;">작성 완료</button>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="col-lg-4 order-lg-1 order-2" style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">
									<div class="blog__sidebar">
										<div class="blog__sidebar__comment" style="overflow: scroll; height: 500px;">
											<h4>리뷰</h4>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-1.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Brandon Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
												</div>
											</div>
											<div class="classes__sidebar__comment">
												<div class="classes__sidebar__comment__pic">
													<img src="./resources/img/classes-details/comment-2.png" alt="">
													<div class="classes__sidebar__comment__rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
													</div>
												</div>
												<div class="classes__sidebar__comment__text">
													<span>04 Mar 2018</span>
													<h6>Christina Kelley</h6>
													<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</section>
	<!-- 	변경 DIV 시작 -->
</body>
<!-- Js Plugins -->
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/jquery.nice-select.min.js"></script>
<script src="./resources/js/jquery.barfiller.js"></script>
<script src="./resources/js/jquery.slicknav.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/main.js"></script>
<link rel="stylesheet" href="https://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/style.css?ver=1590611604">
</html>