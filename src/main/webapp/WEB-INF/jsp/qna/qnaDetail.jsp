<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
						<span style="margin-left: 30px;"> 작성일&nbsp;&nbsp;&nbsp;<c:out value="${data.inDate}" />
						</span>
					</div>
					<div class="blog__details">
						<div class="blog__details__large">

							<img src="./resources/img/blog/details/blog-large.jpg" alt=""> <span> <c:out value="${data.inUserId}" />
							</span>
						</div>
						<div class="blog__details__text">${data.commonContent}</div>
						<div class="classes__item__text" style="text-align: center;">
							<a href="qnaList.do" class="class-btn">목록 </a> <a href="${path}qnaMod.do?communitySeq=${data.communitySeq}" class="class-btn">수정</a> <a href="${path}qnaDelete.do?communitySeq=${data.communitySeq}" class="class-btn">삭제</a>
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
								<form id="frm">
									<input type="hidden" name="communitySeq" value="${result.communitySeq}"> <input type="hidden" name="replyParentSeq" value="${cnt}">
									<div class="classes__sidebar__comment__pic" style="<c:if test="${result.replyDepth == 2}">margin-left:100px;</c:if>">
										<img src="./resources/img/classes-details/comment-1.png" alt="">
									</div>
									<div class="classes__sidebar__comment__text">
										<h6>
											관리자&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 0.8em; color: gray; float: right; padding-right: 20px;">등록일입력</span>
										</h6>
										<div style="margin-top: 20px;">
											<p>
												답변 내 용ㅁㄴ ㅇㄻㄴasdacascasssssscasc ㄴ aaaaaaaaaaaaaaaaㅇㅎㄻㄶaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㄴㅇasdasdasdㄹ <img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;">
											</p>
										</div>
									</div>
									<br>
									<hr>
								</form>
							</div>
							<form id="replyfrm" method="POST" action="qnaReplyInsert.do">
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-12">
										<div class="classes__sidebar__comment__pic"></div>
										<input type="hidden" name="communitySeq" value="${data.communitySeq}">
										<textarea id="reply" name="replyContent" placeholder="댓글을 입력해 주세요." style="width: 100%; float: left;"></textarea>
										<button type="submit" class="site-btn" style="font-size: 1.05em; width: 120px; height: 48px; padding: 0; float: right; margin-top: 15px;">댓글 작성</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Leave Comment End -->
	<script type="text/javascript">

// 	function showReply(){

// 			var b_seq = '{{notice.b_seq}}';
// 			var param = "";
// 			param += "dummy=" + Math.random();
// 			param += "&b_seq=" + b_seq;

// 			$.ajax({
// 				url : "reply_list.ajax",
// 				data : param,
// 				dataType : "json",
// 				type : "post",
// 				async : false,
// 				statusCode : {
// 					404 : function() {
// 						alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
// 					}
// 				},
// 				success : function(data) {
// 					var user_id = '{{session.user_id}}';
// 					var list = data.list;

// 					var txt = "";

// 					for(var i=0;i<list.length;i++){
// 						txt += "<tr>"+"\n";
// 						txt += "	<td colspan='2'>"+"\n";
// 						txt += "		"+list[i].cmt+"\n";
// 						txt += "	</td>"+"\n";
// 						txt += "</tr>"+"\n";
// 						txt += "<tr>"+"\n";
// 						txt += "	<td>"+"\n";
// 						txt += "		"+list[i].in_date+"\n";
// 						txt += "	</td>"+"\n";
// 						txt += "	<td>"+"\n";
// 						if(user_id == list[i].in_user_id ){
// 							txt += "		<input type='button' value='삭제' onclick='fn_reply_del(\""+list[i].r_seq+"\")' >"+"\n";
// 						}
// 						txt += "		"+list[i].in_user_name+"\n";
// 						txt += "	<img src='image/good.png' onclick='fn_reply_good(\""+list[i].r_seq+"\")' /><span>"+list[i].good+"</span>"+"\n";
// 						txt += "	<img src='image/bad.png'  onclick='fn_reply_bad(\""+list[i].r_seq+"\")' /><span>"+list[i].bad+"</span>"+"\n";
// 						txt += "	</td>"+"\n";
// 						txt += "</tr>"+"\n";
// 					}

// 					$("#tbody_reply").html(txt);

// 				}
// 			});


// 		}

	</script>
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