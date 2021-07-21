<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="./resources/js/jquery-3.3.1.min.js"></script>

<style>
.classes__item__text .class-btn:hover {
	background: #ffffff;
	border: 1px solid #5768AD;
	color: #5768AD;
}

.classes__item__text .class-btn {
	font-size: 17px;
	font-weight: 700;
	color: #ffffff;
	background: #5768AD;
	display: inline-block;
	border: 1px solid rgba(155, 158, 163, 0.2);
	padding: 10px 20px 7px;
	border-radius: 2px;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	width: 140px;
}

#reply {
	width: 90%;
	font-size: 13px;
	color: #6E7580;
	padding-left: 30px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	background: #ffffff;
	border-radius: 2px;
	height: 50px;
	margin-bottom: 35px;
	resize: none;
	padding-top: 14px;
	margin-top: 15px;
}

.breadcrumb-option, .blog-hero {
	padding-top: 215px;
	padding-bottom: 170px;
	margin-top: -50px;
}
</style>
<script type="text/javascript">
	//댓글 등록
	function fn_reipeReplyAdd() {
		var formData = new FormData($('#replyfrm')[0]);
		$.ajax({
			type : 'post',
			url : 'qnaReplyInsert.do',
			data : formData,
			processData : false,
			contentType : false,
			async : false,
			dataType : "text",
			success : function(data) {
				if (data == "ok") {
					alert("답변이 정상적으로 등록되었습니다.");
					$("textarea[name=replyContent]").val('');
					$(".replyarea").load(location.href + " .replyarea");
				} else if (data == "ng") {
					alert("답변을 다시 입력해주세요 .");
				} else {
					alert("답변을 다시 입력해주세요 .");
				}
			}
		})

	}
	//대 댓글 등록 qnaReplyAdd
	function fn_reipeReplyAdd_Add(replySeq) {
		var formData = new FormData($('#replyfrmAdd'+replySeq)[0]);
		$.ajax({
			type : 'post',
			url : 'qnaReplyAdd.do',
			data : formData,
			processData : false,
			contentType : false,
			async : false,
			dataType : "text",
			success : function(data) {
				if (data == "ok") {
					alert("답변이 정상적으로 등록되었습니다.");
					$("textarea[name=replyContent]").val('');
					$(".replyarea").load(location.href + " .replyarea");
				} else if (data == "ng") {
					alert("답변을 다시 입력해주세요 .");
				} else {
					alert("답변을 다시 입력해주세요 .");
				}
			}
		})
	}

	//댓글 삭제
	function fn_reply_del(replySeq) {
		var result = confirm("정말 답변을 삭제하시겠습니까?" + replySeq);
		if (result) {
			var replySeq = "replySeq=" + replySeq;
			$.ajax({
				type : 'POST',
				async : false,
				url : 'qnaReplyDelete.do',
				data : replySeq,
				success : function(data) {
					if (data == "ok") {
						alert("답변이 정상적으로 삭제되었습니다.");
						$("textarea[name=replyContent]").val('');
						$(".replyarea").load(location.href + " .replyarea");
					} else if (data == "ng") {
						alert("답변 삭제중 문제 발생.");
					} else {
						alert("답변 삭제중 문제 발생.");
					}
				}
			})
		}
	}
	//대 댓글 창
	function qnaDetailReplyAddAdd(replySeq) {
		if($('.replyfrmAdd'+replySeq).css('display') == 'none'){
			$('.replyfrmAdd'+replySeq).css('display','block');
		} else {
			$('.replyfrmAdd'+replySeq).css('display','none')
		}
	};


</script>

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
							<p style="margin: 0;"></p>
							<p style="margin: 0;">작성자&nbsp;&nbsp; ${data.inUserId}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;입력일 &nbsp;&nbsp;${data.inDate}&nbsp;&nbsp;</p>
						</div>
					</div>
					<hr style="color: #545454">
					<div class="blog__details">
						<div style="width: auto; height: auto; min-height: 100px;">${data.commonContent}</div>
						<div style="text-align: right;">
							<div class="classes__item__text" style="text-align: center;">
								<a href="qnaList.do" class="class-btn" style="text-align: center;">목 록</a>
								<c:set var="inUser" value="${sessionScope.memberId}" />
								<c:if test="${data.inUserId == inUser}">
									<a href="${path}qnaMod.do?communitySeq=${data.communitySeq}" class="class-btn">수정</a>
									<a href="${path}qnaDelete.do?communitySeq=${data.communitySeq}" class="class-btn">삭제</a>
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
	<!-- 	댓글 부분 -->
	<div class="leave-comment spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="leave__comment__text">
						<h2>🕵️‍♀관리자의 답변입니다.</h2>
					</div>

				</div>
				<div id="reply_area" class="col-lg-4 order-lg-1 order-2 replyarea" style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">
					<div class="blog__sidebar">
						<div class="blog__sidebar__comment" style="overflow-x: hidden; height: 500px; padding: 10px;">
							<h4>답변</h4>
							<div class="classes__sidebar__comment" style="border-bottom: 0">

								<c:set var="qnaDetailReply" value="${qnaDetailReply}" />
								<c:set var="qnaDetailReplyList" value="${qnaDetailReplyList}" />
								<c:set var="qnaDetailMember" value="${qnaDetailMember}" />
								<c:if test="${not empty qnaDetailReply}">
									<c:forEach var="qnaDetailReply" items="${qnaDetailReply}">
										<!-- 댓글 달기 -->
										<!-- 댓글 목록 -->
										<form id="frm">
											<div class="classes__sidebar__comment__pic">
												<img src="${qnaDetailReply.filePath }" alt="">
											</div>
											<div class="classes__sidebar__comment__text">
												<h6>
													${qnaDetailReply.inUserId}&nbsp;&nbsp;&nbsp;&nbsp;
													<a style="cursor: pointer;" onclick="qnaDetailReplyAddAdd(${qnaDetailReply.replySeq})"> 답변작성 </a>
													<span style="font-size: 0.8em; color: gray; float: right; padding-right: 20px;">${qnaDetailReply.inDate}</span>
												</h6>
												<div style="margin-top: 20px;">
													<p>
														${qnaDetailReply.replyContent}
														<c:if test="${qnaDetailReply.inUserId eq sessionScope.memberId}">
															<img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;" onclick="fn_reply_del(${qnaDetailReply.replySeq})">
														</c:if>
													</p>
												</div>
											</div>
											<br>
										</form>
										<!--대 댓글 목록 -->
										<c:forEach var="qnaDetailReplyList" items="${qnaDetailReplyList}">
											<c:if test="${qnaDetailReply.replySeq eq qnaDetailReplyList.REPLY_PARENT_SEQ}">
												<form id="frm" style="margin-left: 100px;">
													<div class="classes__sidebar__comment__pic">
														<img src="${qnaDetailReplyList.FILE_PATH}" alt="">
													</div>
													<div class="classes__sidebar__comment__text">
														<h6>
															${qnaDetailReplyList.IN_USER_ID}&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 0.8em; color: gray; float: right; padding-right: 20px;">${qnaDetailReplyList.IN_DATE}</span>
														</h6>
														<div style="margin-top: 20px;">
															${qnaDetailReplyList.REPLY_CONTENT}
															<c:if test="${qnaDetailReplyList.IN_USER_ID eq sessionScope.memberId}">
																<img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;" onclick="fn_reply_del(${qnaDetailReplyList.REPLY_SEQ})">
															</c:if>
														</div>
													</div>
													<br>
												</form>
											</c:if>
										</c:forEach>
										<!-- 대 댓글 달기 -->
										<form class="replyfrmAdd${qnaDetailReply.replySeq}" id="replyfrmAdd${qnaDetailReply.replySeq}" style="display: none;">
											<input type="hidden" name="replySeq" value="${qnaDetailReply.replySeq}">
											<input type="hidden" name="communitySeq" value="${data.communitySeq}">
											<input type="hidden" name="memberId" value="${sessionScope.memberId}">
											<div class="row">
												<div class="col-lg-12"></div>
												<div class="col-lg-12" style="margin-top: 15px; margin-left: 100px;">
													<div class="classes__sidebar__comment__pic">
														<img src="${qnaDetailMember.FILE_PATH}" alt="" style="max-width: 70px; float: left;">
													</div>
													<textarea id="reply" name="replyContent" placeholder="답변을 입력해 주세요." style="width: 67%; float: left"></textarea>
													<input type="button" class="site-btn" style="font-size: 1.05em; width: 120px; height: 48px; padding: 0; float: left; margin-top: 15px; margin-left: 5px;" onclick="fn_reipeReplyAdd_Add(${qnaDetailReply.replySeq})" value="답변작성">
												</div>
											</div>
										</form>
										<hr>
									</c:forEach>
								</c:if>
								<c:if test="${empty qnaDetailReply}">
									<form id="frm">
										<div class="classes__sidebar__comment__text">
											<div style="margin-top: 20px;">
												<input type="hidden" />
												<p>답변이 없습니다.</p>
											</div>
										</div>
										<br>
										<hr>
									</form>
								</c:if>
							</div>
							<!-- 답변 등록 -->
							<form id="replyfrm">
								<input type="hidden" name="communitySeq" value="${data.communitySeq}">
								<input type="hidden" name="memberId" value="${sessionScope.memberId}">
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-12">
										<div class="classes__sidebar__comment__pic">
											<img src="${qnaDetailMember.FILE_PATH}" alt="">
										</div>
										<textarea id="reply" name="replyContent" placeholder="답변을 입력해 주세요." style="width: 79%; float: left"></textarea>
										<input type="button" class="site-btn" style="font-size: 1.05em; width: 120px; height: 48px; padding: 0; float: right; margin-top: 15px;" onclick="fn_reipeReplyAdd()" value="답변등록">
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

	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>

</html>