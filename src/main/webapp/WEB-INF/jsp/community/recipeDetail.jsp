<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/recipe.js"></script>
<script type="text/javascript">
	//댓글 추가
	function fn_reipeReplyAdd() {
		alert("시작");
		var formData = new FormData($('#replyfrm')[0]);
		$.ajax({
			type : 'post',
			url : 'recipeReplyInsert.do',
			data : formData,
			processData : false,
			contentType : false,
			async : false,
			dataType : "text",
			success : function(data) {
				if (data == "ok") {
					alert("댓글이 정상적으로 등록되었습니다.");
					$("textarea[name=replyContent]").val('');
					$(".replyarea").load(location.href + " .replyarea");
				} else if (data == "ng") {
					alert("댓글을 다시 입력해주세요 .");
				} else {
					alert("댓글을 다시 입력해주세요 .");
				}
			}
		})

	}

	//댓글 삭제
	function fn_reply_del(replySeq) {

		var result = confirm("정말 댓글을 삭제하시겠습니까?" + replySeq);
		if (result) {
			var replySeq = "replySeq=" + replySeq;

			$.ajax({
				type : 'POST',
				async : false,
				url : 'recipeReplyInsert.do',
				data : replySeq,
				success : function(data) {
					if (data == "ok") {
						alert("댓글이 정상적으로 삭제되었습니다.");
						$("textarea[name=replyContent]").val('');
						$(".replyarea").load(location.href + " .replyarea");
					} else if (data == "ng") {
						alert("댓글을 다시 입력해주세요 .");
					} else {
						alert("댓글을 다시 입력해주세요 .");
					}
				}
			})
		}

	}
</script>
</head>
<body>
	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>레시피</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<c:set var="data" value="${data}" />
		<div class="container">
			<div class="row" style="justify-content: center">
				<div class="col-lg-8 order-lg-2 order-1" style="background-color: white; padding: 30px; border: 1px solid #ebecef; border-radius: 10px; display: left;">
					<div style="margin-bottom: 30px;">
						<span style="font-size: 1.3em; font-weight: bold; color: #545454">${data.commonTitle}</span>
					</div>
					<div style="text-align: right; margin-bottom: 5px; padding-right: 8px;">
						<div style="display: inline-block; vertical-align: sub;">
							<p style="margin: 0;">${data.commonHit}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
						</div>
						<div style="display: inline-block; vertical-align: sub;">
							<p style="margin: 0;">${data.commonHit}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
						</div>
						<div style="display: inline-block; vertical-align: sub;">
							<p>${data.commonHit}&nbsp;&nbsp;</p>
						</div>

						<!-- 좋아요 이미지 찍히는 곳 -->
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
							<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
						</div>

						<!-- 좋아요수 -->
						<div style="display: inline-block; vertical-align: sub;">
							<p>${data.commonHit}&nbsp;&nbsp;</p>
						</div>

						<!-- 북마크 이미지 찍히는 곳 -->
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
							<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
						</div>

						<!-- 북마크수 -->
						<div style="display: inline-block; vertical-align: sub;">
							<p>${data.commonHit}&nbsp;&nbsp;</p>
						</div>
					</div>
					<hr style="color: #545454">
					<div class="blog__details">
						<div style="width: auto; height: auto; min-height: 100px;">${data.commonContent}</div>
						<div style="text-align: right;">
							<div class="classes__item__text" style="text-align: center;">
								<a href="recipeList.do" class="class-btn" style="text-align: center;">목 록</a>
								<c:set var="inUser" value="${sessionScope.memberId}" />
								<c:if test="${data.inUserId == inUser}">
									<a href="${path}recipeMod.do?communitySeq=${data.communitySeq}" class="class-btn">수정</a>
									<a href="${path}recipeDelete.do?communitySeq=${data.communitySeq}" class="class-btn">삭제</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

	<!-- Leave Comment Begin -->
	<div class="leave-comment spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="leave__comment__text">
						<h2>😁자유롭게 댓글을 달아보세요</h2>
					</div>
				</div>

				<div id="reply_area" class="col-lg-4 order-lg-1 order-2 replyarea" style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">
					<div class="blog__sidebar">
						<div class="blog__sidebar__comment" style="overflow-x: hidden; height: 500px; padding: 10px;">
							<h4>댓글</h4>
							<div class="classes__sidebar__comment" style="border-bottom: 0">

								<c:set var="replyCheck" value="${qnaReply}" />
								<c:if test="${not empty replyCheck}">
									<c:forEach var="qnaReply" items="${qnaReply}">
										<form id="frm">
											<div class="classes__sidebar__comment__pic">
												<img src="./resources/img/classes-details/comment-1.png" alt="">
											</div>
											<div class="classes__sidebar__comment__text">
												<h6>
													관리자&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 0.8em; color: gray; float: right; padding-right: 20px;">${qnaReply.inDate}</span>
												</h6>
												<div style="margin-top: 20px;">
													<input type="hidden" />
													<p>
														${qnaReply.replyContent}
														<c:set var="inUser" value="${sessionScope.memberId}" />
															<img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;" onclick="fn_reply_del(${qnaReply.replySeq})">
													</p>
												</div>
											</div>
											<br>
											<hr>
										</form>
									</c:forEach>
								</c:if>
								<c:if test="${empty replyCheck}">
									<form id="frm">
										<div class="classes__sidebar__comment__text">
											<div style="margin-top: 20px;">
												<input type="hidden" />
												<p>댓글이 없습니다.</p>
											</div>
										</div>
										<br>
										<hr>
									</form>
								</c:if>
							</div>

							<c:set var="inUser" value="${sessionScope.memberId}" />
							<form id="replyfrm">
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-12">
										<div class="classes__sidebar__comment__pic"></div>
										<input type="hidden" name="communitySeq" value="${data.communitySeq}">
										<input type="hidden" name="memberId" value="${sessionScope.memberId}">
										<textarea id="reply" name="replyContent" placeholder="댓글을 입력해 주세요." style="width: 100%; float: left;"></textarea>
										<input type="button" class="site-btn" style="font-size: 1.05em; width: 120px; height: 48px; padding: 0; float: right; margin-top: 15px;" onclick="fn_reipeReplyAdd()" value="답변 등록">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Js Plugins -->



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