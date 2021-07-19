<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

.que:first-child {
	border-top: 1px solid black;
}

.que {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 20px;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
	content: 'Q';
	font-size: 16px;
	font-family: "DM Sans";
	color: #006633;
	margin-right: 5px;
}

.que.on>span {
	font-weight: bold;
	color: #006633;
}

.anw {
	display: none;
	overflow: hidden;
	font-family: "DM Sans";
	font-size: 16px;
	background-color: #f4f4f2;
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	font-size: 16px;
	font-weight: bold;
	color: #666;
	margin-right: 5px;
}

.table tr:hover {
	background-color: #f8f6ff;
}
</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function fn_detail(communitySeq) {
		// 	alert("wjdtkd")
		location.href = "qnaDetail.do?communitySeq=" + communitySeq;
	}
</script>
</head>
<body>
	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg" style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>문의하기 목록</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->


	<!-- Faq Begin -->
	<section class="classes spad">
		<div class="container">
			<div class="classes__filter">
				<div class="faq spad">
					<div class="classes__filter">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-10">
								<h3>FAQ</h3>
								<br>
								<script type="text/javascript">
									$(document).ready(function() {
										$(".que").click(function() {
											$(this).next(".anw").stop().slideToggle(300);
										});
									});
								</script>
								<div id="Accordion_wrap">
									<!-- 아코디언 시작 -->
									<!-- 1아코디언 -->
									<div class="que">
										<span>가입하려면 어떻게 해야 하나요?</span>
									</div>
									<div class="anw">
										<span>회원가입 방법 : 오른쪽 상단에 회원가입을 클릭 후 회원가입을 진행한다.</span>
									</div>
									<!--2아코디언 -->
									<div class="que">
										<span>카카오 로그인은 어떻게하나요?</span>
									</div>
									<div class="anw">
										<p>
											<span>1.오른쪽 상단에 로그인 화면에서 카카오 로그인은 클릭한다</span>
										</p>
										<p>-카카오 아이디,이메일,전화번호 입력한다.</p>
										<p>-카카오 비밀번호를 입력한다.</p>
										<p>-로그인 버튼을 클릭한다.</p>
										<p>
											<span>2.QR코드 로그인을 클릭후 QR코드를 인식한다.</span>
										</p>
									</div>
									<!-- 3아코디언 -->
									<div class="que">
										<span>준비중</span>
									</div>
									<div class="anw">
										<span>준비중</span>
									</div>
									<!-- 아코디언 끝 -->
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Faq End -->

				<!-- Classes Section Begin -->
				<div class="container">
					<h3>문의하기</h3>
					<br>
					<table class="table" style="text-align: center;">
						<thead>
							<tr style="background: #6d7ab0; color: white; font-size: 1.1em;">
								<th scope="col">번호</th>
								<th scope="col" colspan="3">제목</th>
								<th scope="col">답변확인</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${data}" varStatus="status">
								<c:if test="${data.inUserId eq sessionScope.memberId || '1' eq sessionScope.memberId}">
									<tr>
										<th scope="row">${data.rm}</th>
										<td colspan="3">
											<a href="${path}qnaDetail.do?communitySeq=${data.communitySeq}" style="text-decoration: none; color: blue;"> ${data.commonTitle} </a>
										</td>
										<td>
											<c:set var="cnt" value="${data.boardReply}" />
											<c:if test="${cnt == '0' }">
												<c:out value="X" />
											</c:if>
											<c:if test="${cnt > '0' }">
												<c:out value="O" />
											</c:if>
										</td>
										<td>${data.inDate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<div class="classes__item__text" style="text-align: right;">
						<a href="qnaAdd.do" class="class-btn">등록</a>
					</div>
				</div>
				<!-- 페이징처리 -->
				<div class="col-lg-12">
					<div class="classes__pagination">
						<c:if test="${pageMaker.prev}">
							<a href="boardList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">
								<span class="arrow_carrot-left"></span>
							</a>
						</c:if>

						<c:set var="page" value="${pageMaker.cri.page}" />
						<c:set var="idx" value="${idx}" />
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="qnaList.do${pageMaker.makeQuery(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="qnaList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">
								<span class="arrow_carrot-right"></span>
							</a>
						</c:if>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- Classes Section End -->

	<!-- Js Plugins -->


	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>