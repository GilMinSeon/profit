<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg"
		style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
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
	<div class="faq spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-10">
					<div class="faq__accordion">
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
								<span>This is first question.</span>
							</div>
							<div class="anw">
								<span>This is first answer.</span>
							</div>
							<!--2아코디언 -->
							<div class="que">
								<span>This is second question.</span>
							</div>
							<div class="anw">
								<span>This is second answer.</span>
							</div>
							<!-- 3아코디언 -->
							<div class="que">
								<span>This is third question.</span>
							</div>
							<div class="anw">
								<span>This is third answer.</span>
							</div>
							<!-- 아코디언 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Faq End -->

	<!-- Classes Section Begin -->
	<section class="classes spad">
		<div class="container">
			<h3>문의하기</h3>
			<br>
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr style="background: #E6E6E6;">
						<th scope="col">번호</th>
						<th scope="col" colspan="3">제목</th>
						<th scope="col">답변확인</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${data}" varStatus="status">
						<tr>
							<th scope="row">${status.count}</th>
							<td colspan="3">
								<a href="qnaDetail.do"style="text-decoration: none; color: blue;">
									${data.commonTitle}
								</a>
							</td>
							<td>
								<c:set var="cnt" value="${data.cnt}" />
								<c:if test="${cnt == '0' }">
									<c:out value="X" />
								</c:if> <c:if test="${cnt > '0' }">
									<c:out value="O" />
								</c:if>
							</td>
							<td>${data.inDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="classes__item__text" style="text-align: right;">
				<a href="qnaAdd.do" class="class-btn">등록</a>
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