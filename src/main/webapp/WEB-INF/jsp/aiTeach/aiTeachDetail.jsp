<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<body>


	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>AI 자세교정</h2>
						<div class="breadcrumb__widget">
							<span>나의 운동자세를 AI가 평가합니다</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->

	<!-- Classes Section Begin -->
	<section class="classes spad">
		<div class="container">
			<div class="classes__filter">
				<div class="row">
					<form method="post"
							action=${pageContext.request.contextPath}/upload
							enctype="multipart/form-data">
						<div class="col-lg-12">
							<div class="leave__comment__text" style="text-align: center;">
								<br>
								<h3>📸 자신의 자세가 담긴 사진을 첨부해주세요</h3>
							</div>
							
								<div class="classes__item__text"
									style="text-align: center; padding-top: 30px;">
									<label class="file_btn">파일첨부<input type='file' name="ai_attach_file" style="display: none;"/></label> 
									<label class="file_btn" style="width: 98px;">제출<input type='submit' name="ai_attach_file" style="display: none;"/></label>	
<!-- 									<a href="aiTeachDetail" -->
<!-- 										class="class-btn_w" style="width: 100px;" -->
<!-- 										>제출</a> -->
								</div>
								<div id="ai_ori_file" class="classes__item__text"
									style="text-align: center; padding-top: 30px;">자세 첨부파일.jpg
								</div>
								<div class="classes__item__text"
									style="text-align: center; padding-top: 30px; border: 2px solid black; height: 500px;">
									<input type="text" name="ai_result" readonly="readonly">
								</div>
								<div class="classes__item__text"
									style="text-align: center; padding-top: 30px;">
									<a href="aiTeachDetail" class="class-btn_w"
										style="width: 158px;">파일 다운로드</a> <a href="aiTeachAdd"
										class="class-btn_w" style="width: 158px;">게시판에 공유하기</a>
								</div>
						</div>
					</form>
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
</body>

</html>