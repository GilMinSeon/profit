<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	                                <li>이용권 보유 개수 ▶ 3회 </li>
	                                <li><a href="ticketBuyList.do">이용권 구매내역</a></li><br>
	                                <li><a href="ticketUseList.do">이용권 사용내역</a></li>
	                            </ul>
	                            <br>
	                            <a href="#" class="sidebar-btn">구매하기</a>
	                        </div>
                        </div>
                        
                        <br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>트레이너 신청</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li><span class="icon_calendar"></span><a href="trainerApplyList.do">나의 신청내역</a> </li>
	                                <li><span class="icon_id"></span><a href="trainerApply.do">신청하기</a></li>
	                            </ul>
	                        </div>
                        </div>
					</div>
				</div>
				<!-- 사이드바 끝 -->
                <!-- 여기부터 달라짐 -->
                <div class="col-lg-8 order-lg-2 order-1">
                    <div class="row" style="display: inline-block;width: 100%;" >
                        	<!-- Appoinment Section Begin -->
	<section class="appointment" style=" margin-bottom: 50px;">
		<div class="container">
			<div class="appointment__text" style="background-color: #9e9e9e0a; padding: 60px 10px;">
				<form action="#" class="appointment__form">
					<div class="text-center">
						<h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;">마이 클래스</h4>
						<br/>
						<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;">나의 구매 강좌를 확인하세요.</p>
						<br/><br/>
							
							
							<table class="table table-hover" style="text-align: center;">
								<thead>
									<tr style="background: #E6E6E6;">
										<th scope="col">번호</th>
										<th scope="col" colspan="2">제목</th>
										<th scope="col">기간<span style="font-size: 12px;">(개월)</span></th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="result" items="${buyListResult}" varStatus="status">
								<input type="hidden" name="lessonSeq" value="${result.lessonSeq}">
								<input type="hidden" name="buyLessonSeq" value="${result.buyLessonSeq}">
									<tr>
										<th scope="row">${status.index+1}</th>
										<td colspan="2"><a href="lessonDetail.do?buyLessonSeq=${result.buyLessonSeq}"
											style="text-decoration: none; color: #5768AD;"> ${result.lessonTitle} </a></td>
										<td>${result.lessonMonth}</td>
										<td><a href="myLessonPayDetail.do?buyLessonSeq=${result.buyLessonSeq}" style="text-decoration: none; color: #2FBC49;">결제완료</a></td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징처리 -->
		            	<div class="col-lg-12">
							<div class="classes__pagination">
							<c:if test="${pageMaker.prev}">
								<a href="myLessonList.do${pageMaker.makeQueryBuyLesson(pageMaker.startPage - 1)}">
									<span class="arrow_carrot-left"></span>
								</a>
							</c:if> 
							
							<c:set var="page" value="${pageMaker.cri.page}"/>
							<c:set var="idx" value="${idx}"/>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		            			<a href="myLessonList.do${pageMaker.makeQueryBuyLesson(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<a href="myLessonList.do${pageMaker.makeQueryBuyLesson(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
							</c:if>
							</div>
						</div>
                        
                         
						

					</div>
				</form>
			</div>
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