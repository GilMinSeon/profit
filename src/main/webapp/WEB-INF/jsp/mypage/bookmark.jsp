<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_param(seq){
	location.href="bookmark.do?commonSeq="+seq+"";
}
</script>
<style>
li a {
    font-size: 16px;
    color: #9B9EA3;
    line-height: 48px;
    -webkit-transition: all, 0.3s;
    -moz-transition: all, 0.3s;
    -ms-transition: all, 0.3s;
    -o-transition: all, 0.3s;
    transition: all, 0.3s;
}
li a:hover {
    color: #5768AD;
}
</style>
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
							<h4>🧡 카테고리 🧡</h4>
							<ul>
								<li><a href="myinfo.do">- 내정보</a></li>
								<li><a href="bookmark.do">- 북마크</a></li>
								<li><a href="myLessonList.do">- 마이클래스</a></li>
								<li><a href="myChatList.do">- 1:1채팅내역</a></li>
							</ul>
						</div>
						
						<br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>🧡 채팅이용권 🧡</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li><a href="ticketBuyList.do">- 이용권 구매내역</a></li><br>
	                                <li><a href="ticketUseList.do">- 이용권 사용내역</a></li>
	                            </ul>
	                        </div>
                        </div>
                        
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>🧡 트레이너 신청 🧡</h4>
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
                <div class="col-lg-8 order-lg-2 order-1" style="background-color: #9e9e9e0a;">
                	
                	<h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;padding-top: 60px; text-align: center;">북마크</h4>
                	<br>
                	<p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD; text-align: center;">나의 Pick! 스크랩 한 글을 확인해보세요.</p>
                	<br>
                	<!-- 카테고리 -->
                	<c:set var="commonSeq" value="${commonSeq}"/>
	                <div class="write-title" style="margin-bottom: 5px;">
						<div class="c_radio">
							<div style="display: inline-block;margin-left: 70px;">
								<input type="radio" name="cate_type" id="exercise" value="1" autocomplete="off" style="opacity: 0;"
									<c:if test="${commonSeq == null || commonSeq == '' }">checked</c:if> >
									<label for="exercise" style="width: 120px;border: 1px solid; padding: 11px;" onclick="location.href='bookmark.do'">전체</label>
								<input type="radio" name="cate_type" id="food" value="2" autocomplete="off" style="opacity: 0" 
									<c:if test="${commonSeq == '4' }">checked</c:if> >
									<label for="food" style="width: 120px;border: 1px solid;padding: 11px;" onclick="fn_param(4)">온라인클래스</label>
							</div>
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="motive" value="3" autocomplete="off" style="opacity: 0"
									<c:if test="${commonSeq == '6' }">checked</c:if> >
									<label for="motive" style="width: 120px;border: 1px solid;padding: 11px;" onclick="fn_param(6)">레시피</label>
								<input type="radio" name="cate_type" id="habit" value="4" autocomplete="off" style="opacity: 0"
									<c:if test="${commonSeq == '5' }">checked</c:if> >
									<label for="habit" style="width: 120px;border: 1px solid;padding: 11px;" onclick="fn_param(5)">자유게시판</label>
							</div>
						</div>
					</div>
                	<br>
                
                	<!-- 리스트 -->
                    <div class="row">
                    	<c:forEach var="list" items="${list}" varStatus="status">
                    	
                    	<c:set var="communitySeq" value="${list.communitySeq}"/>
                    	<c:set var="lessonSeq" value="${list.lessonSeq}"/>
                    	
                    	<c:if test="${lessonSeq != null }"><!-- 온라인클래스 출력 -->
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                            	<!-- 이미지 -->
                            	<div class="classes__item__pic set-bg" data-setbg="${list.lFilpath}" style="margin-bottom: 15px;"></div>
                                
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i>&nbsp;${fn:substring(list.lDate,0,10)}</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | <span>온라인클래스</span>&nbsp;
                                	</p>
                                    <h5><a style="font-size: 18px;font-weight: bold;" href="lessonDetail.do?lessonSeq=${list.lessonSeq}">${list.lessonTitle }</a></h5>
                                </div>
                            </div>
                        </div>
						</c:if>
						
						
						<c:if test="${communitySeq != null }"><!-- 커뮤니티 출력 -->
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog__item">
                            	<!-- 이미지 -->
                            	<div class="classes__item__pic set-bg" data-setbg="${list.cFilpath}" style="margin-bottom: 15px;"></div>
                                
                                <div class="blog__item__text">
                                    <ul style="margin-bottom: 10px;">
                                        <li>&nbsp;<i class="fa fa-calendar-o"></i>&nbsp;${fn:substring(list.cDate,0,10)}</li>
                                    </ul>
                                    <p style="font-weight: bold; color: #8B94B5; margin-bottom: 10px;">
                                		카테고리 | 
                                		<c:if test="${list.commonSeq eq '5' }">
                                		<span>자유게시판</span>&nbsp;
                                		</c:if>
                                		<c:if test="${list.commonSeq eq '6' }">
                                		<span>레시피</span>&nbsp;
                                		</c:if>
                                	</p>
                                	<c:if test="${list.commonSeq eq '5' }">
                                    <h5><a style="font-size: 18px;font-weight: bold;" href="boardDetail.do?communitySeq=${list.communitySeq}">${list.commonTitle }</a></h5>
                                    </c:if>
                                    <c:if test="${list.commonSeq eq '6' }">
                                    <h5><a style="font-size: 18px;font-weight: bold;" href="recipeDetail.do?communitySeq=${list.communitySeq}">${list.commonTitle }</a></h5>
                                    </c:if>
                                </div>
                            </div>
                        </div>
						</c:if>
						
						
						
						</c:forEach>
						
						<!-- 페이징처리 -->
		            	<div class="col-lg-12">
							<div class="classes__pagination">
							<c:if test="${pageMaker.prev}">
								<a href="bookmark.do${pageMaker.makeQuerySimple(pageMaker.startPage - 1)}">
									<span class="arrow_carrot-left"></span>
								</a>
							</c:if> 
							
							<c:set var="page" value="${pageMaker.cri.page}"/>
							<c:set var="idx" value="${idx}"/>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		            			<a href="bookmark.do${pageMaker.makeQuerySimple(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<a href="bookmark.do${pageMaker.makeQuerySimple(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
							</c:if>
							</div>
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