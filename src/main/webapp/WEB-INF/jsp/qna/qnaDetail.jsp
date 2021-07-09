<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	margin-top: -75px;
}
</style>
<script type="text/javascript">
// 댓글 추가
	function fn_qnaReplyAdd() {
		var formData = new FormData($('#replyfrm')[0]);
		$.ajax({
			type : 'post',
			url : 'qnaReplyInsert.do',
			data : formData,
			processData : false,
			contentType : false,
			async:false,
			dataType:"text",
			success : function(data){
				if(data == "ok"){
					alert("댓글이 정상적으로 등록되었습니다.");
					$("textarea[name=replyContent]").val('');
					$(".replyarea").load(location.href + " .replyarea");
				}else if(data == "ng"){
					alert("댓글을 다시 입력해주세요 .");
				}else{
					alert("댓글을 다시 입력해주세요 .");
				}
			}
		})
	}

// 댓글 삭제
	function fn_reply_del(replySeq) {
		var result = confirm("정말 댓글을 삭제하시겠습니까?"+replySeq);
		if(result){
			var replySeq = "replySeq="+ replySeq;
			$.ajax({
				type : 'POST',
				async:false,
				url : 'qnaReplyDelete.do',
				data : replySeq,
				success : function(data){
					if(data == "ok"){
						alert("댓글이 정상적으로 삭제되었습니다.");
						$("textarea[name=replyContent]").val('');
						$(".replyarea").load(location.href + " .replyarea");
					}else if(data == "ng"){
						alert("댓글을 다시 입력해주세요 .");
					}else{
						alert("댓글을 다시 입력해주세요 .");
					}
				}
			})
		}
	}

</script>

<body>
	<c:set var="data" value="${data}" />
	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>문의하기</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">

		<div class="container">

			<div class="row" style="justify-content: center">
				<div class="col-lg-8 order-lg-2 order-1">


					<div style="margin-bottom: 30px; text-align: center;">
						<span style="font-size: 1.3em; font-weight: bold;"><c:out value="${data.commonTitle}" /></span>
					</div>
					<div style="text-align: right; margin-bottom: 5px;">
						<span style="margin-left: 30px;"> ${data.inDate}&nbsp;&nbsp;&nbsp;<!--<c:out value="${data.inDate}" />-->
						</span>
					</div>
					<div class="blog__details">
						<div class="blog__details__text">${data.commonContent}</div>
						<div class="classes__item__text" style="text-align: center;">
							<a href="qnaList.do" class="class-btn">목록 </a>
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
	</section>

	<!-- Leave Comment Begin -->
	<div class="leave-comment spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="leave__comment__text">
						<h2>관리자 답변</h2>
					</div>
				</div>

				<div id="reply_area" class="col-lg-4 order-lg-1 order-2 replyarea" style="width: 100%; flex: 0 0 100%; max-width: 100%; padding-right: 0px; margin-left: 23px;">
					<div class="blog__sidebar">
						<div class="blog__sidebar__comment" style="overflow-x: hidden; height: 500px; padding: 10px;">
							<div class="classes__sidebar__comment" style="border-bottom: 0">
								<c:set var="qnaDetailMember" value="${qnaDetailMember}" />
								<c:set var="replyCheck" value="${qnaReply}" />
								<c:if test="${not empty replyCheck}">
									<c:forEach var="qnaReply" items="${qnaReply}">
										<form id="frm">
											<div class="classes__sidebar__comment__pic">
												<img src="${qnaReply.filePath}" alt="">
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
														<c:if test="${inUser eq '1'}">
															<img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;" onclick="fn_reply_del(${qnaReply.replySeq})">
														</c:if>
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
												<p>문의를 확인중입니다.</p>
											</div>
										</div>
										<br>
										<hr>
									</form>
								</c:if>
							</div>

							<c:set var="inUser" value="${sessionScope.memberId}" />
							<c:if test="${inUser eq '1'}">
								<form id="replyfrm">
									<input type="hidden" name="communitySeq" value="${data.communitySeq}">
									<div class="row">
										<div class="col-lg-12"></div>
										<div class="col-lg-12">
											<div class="classes__sidebar__comment__pic">
												<img src="${qnaDetailMember.FILE_PATH}" alt="">
											</div>
											<textarea id="reply" name="replyContent" placeholder="댓글을 입력해 주세요." style="width: 79%; float: left"></textarea>
											<input type="button" class="site-btn" style="font-size: 1.05em; width: 120px; height: 48px; padding: 0; float: right; margin-top: 15px;" onclick="fn_qnaReplyAdd()" value="답변 등록">
										</div>
									</div>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


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