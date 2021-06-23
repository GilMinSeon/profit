<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<th scope="col">조횟수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td colspan="2">
							<a href="noticeDetail" style="text-decoration: none; color: blue;"> 회원정지 </a>
						</td>
						<td>7</td>
						<td>2021/01/02</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td colspan="2">
							<a href="noticeDetail" style="text-decoration: none; color: blue;"> 이벤트 문의 </a>
						</td>
						<td>0</td>
						<td>2021/01/02</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td colspan="2">
							<a href="noticeDetail" style="text-decoration: none; color: blue;"> 신고 트레이너 </a>
						</td>
						<td>387</td>
						<td>2021/01/02</td>
					</tr>
				</tbody>
			</table>
			<div class="classes__item__text" style="text-align: right;">
				<a href="noticeAdd" class="class-btn">등록</a>
			</div>
		</div>
	</section>
	<!-- Classes Section End -->
</body>
</html>