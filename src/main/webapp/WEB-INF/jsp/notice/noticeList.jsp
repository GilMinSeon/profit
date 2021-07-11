<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<c:if test="{!empty message}" >
	alert("${message}");
</c:if>
</script>
</head>
<body>

	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg" style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>공지사항 목록</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<!-- Classes Section Begin -->
	<section class="classes spad">
		<div class="container">
			<h3>📢 공지사항</h3>
			<br>
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr style="background: #E6E6E6;">
						<th scope="col">번호</th>
						<th scope="col" colspan="2">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${data}" varStatus="status">
						<tr>
							<th scope="row">${status.count}</th>
							<td colspan="2">
								<form id="frm" action="commonHit.do">
									<a href="${path}noticeDetail.do?communitySeq=${data.communitySeq}" style="text-decoration: none; color: blue;" >
										${data.commonTitle}
									</a>
								</form>
							</td>
							<td>${data.inDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="classes__item__text" style="text-align: right;">
				<c:set var="inUser" value="${sessionScope.memberId}"/>
				<c:if test="${inUser eq '1'}">
					<a href="noticeAdd.do" class="class-btn">등록</a>
				</c:if>
			</div>
		</div>
	</section>

	<!-- Classes Section End -->
</body>
</html>