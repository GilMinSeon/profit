.<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="./resources/js/board.js"></script>
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
    background:#5768AD;
    display: inline-block;
    border: 1px solid rgba(155, 158, 163, 0.2);
    padding: 10px 20px 7px;
    border-radius: 2px;
    -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    -ms-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    width:140px;
}

#reply{

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

</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".rereplyToggle").hide();
});

function fn_toggle(cnt){
	$("#rereply_div"+ cnt).toggle("fast");
}

function fn_replyAdd(){
	var formData = new FormData($('#replyfrm')[0]);
	$.ajax({
		type : 'post',
		url : 'replyAddAjax.do',
		data : formData,
		processData : false,
		contentType : false,
		async:false,
		dataType:"text",
		success : function(data){
			if(data=="ok"){
				alert("댓글이 정상적으로 등록되었습니다.");
				$("textarea[name=replyContent]").val('');
			}else if(data=="ng"){
				alert("댓글 등록이 실패하였습니다. 다시 시도해주세요");
			}else{
				alert("댓글 등록이 실패하였습니다. 다시 시도해주세요");
			}
		},
		error : function(error){
			alert("등록이 실패하였습니다. 다시 시도해 주세요.");
			console.log(error);
			console.log(error.status);
		}
		
		
	})
}
</script>
<body>


    <!-- Blog Hero Begin -->
    <section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__hero__text">
                        <h2>자유 게시판</h2>
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
                
                <div class="col-lg-8 order-lg-2 order-1" style="background-color: white;padding: 30px;border: 1px solid #ebecef;border-radius: 10px">
                	<div style="margin-bottom: 30px;">
                		<span style="font-size: 1.3em; font-weight: bold;color: #545454">${BoardDetail['commonTitle']}</span>
                	</div>
                	<div style="float: left;margin-left: 5px;padding-top:5px;">
                        	<p style="font-weight: bold; color: #8B94B5;padding-right: 30px;">카테고리 | <span>${BoardDetail['communityCategoryName']}</span></p>
                        </div>
                	<div  style="text-align: right;margin-bottom: 5px;padding-right: 8px;">
                        <div style="display: inline-block;vertical-align:sub;">
							<p style="margin:0;">${BoardDetail['inDate']}&nbsp;&nbsp;</p>
						</div>
                        <div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p style="margin:0;">${BoardDetail['commonHit']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/reply.png" style="width: 17px; height: 17px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardReply']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardGood']}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${BoardDetail['boardBook']}&nbsp;&nbsp;</p>
						</div> 
        			</div>
        			<hr style="color: #545454">
                    <div class="blog__details">
                    	<div style="width: auto;min-height: 800px;" >
						
						
						${BoardDetail['commonContent']}
						
						</div>
						<div style="text-align: right;">
                        	<div class="classes__item__text">
	                            <a href="boardList.do" class="class-btn" style="text-align: center;">목록</a>
		                        <a href="boardMod" class="class-btn" style="text-align: center;">수정</a>
		                        <a href="#" class="class-btn" style="text-align: center;">삭제</a>
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
                
                <div class="col-lg-4 order-lg-1 order-2" style="width: 100%;flex: 0 0 100%;max-width: 100%;padding-right: 0px;margin-left: 23px;">
                
                    <div class="blog__sidebar">
                        
                        <div class="blog__sidebar__comment" style="overflow-x:hidden;height: 500px;padding:10px;">
                            <h4>댓글</h4>
	                            <div class="classes__sidebar__comment" style="border-bottom: 0">
	                                   <c:forEach var="result" items="${BoardDetail['replyList']}" varStatus="status">
	                                
	                                <c:if test="${empty result.replyParentSeq}"><c:set var="cnt" value="${result.replySeq}" /></c:if>

	                                <div class="classes__sidebar__comment__pic" style="<c:if test="${result.replyDepth == 2}">margin-left:100px;</c:if>">
	                                    <img src="./resources/img/classes-details/comment-1.png" alt="">
	                                </div>
	                                <div class="classes__sidebar__comment__text">
	                                    <h6>
	                                     	${result.memberNickname}&nbsp;&nbsp;&nbsp;&nbsp;
	                                     	<c:if test="${result.replyDepth == 1}">
	                                     	<a style="font-size: 0.8em;color: gray;" onclick='fn_toggle(${result.replySeq})'>답글달기</a>
	                                     	</c:if>
	                                     	<span style="font-size: 0.8em;color: gray;float: right;padding-right: 20px;">2021-07-01</span>   
	                                    </h6>   
	                                    <div style="margin-top: 20px;">
		                                    <p>${result.replyContent}<img src="./resources/img/common/delete.png" style="width: 15px; height: 15x;margin-left: 20px;"></p>
	                                	</div>
	                                	${result.replySeq}
	                                	
	                                </div><br>
	                                <c:if test="${result.replyNextDepth == 1 || empty result.replyNextDepth}">
	                                	<div class="row" >
			                                <div id="rereply_div${cnt}" class="col-lg-12 rereplyToggle" style="margin-top: 15px;margin-left: 100px;">
				                                <div class="classes__sidebar__comment__pic">
				                                    <img src="${BoardDetail['MyProfileImage']}" alt="">
				                                </div>
			                                    <textarea id="reply" placeholder="답글을 입력해 주세요." style="width: 67%;float: left"></textarea>
			                                    <button type="button" class="site-btn" style="font-size: 1.05em; width: 120px;height: 48px;padding:0;float: left;margin-top: 15px;margin-left: 5px;">답글작성</button>
			                                </div>
			                            </div>
	                                	<hr>
	                                </c:if>
	                                </c:forEach>
	                            </div>
                            <form id="replyfrm">
                            <input type="hidden" name="communitySeq" value="${BoardDetail['communitySeq']}">
                            <div class="row">
                                <div class="col-lg-12">
                                </div>
                                <div class="col-lg-12">
	                                <div class="classes__sidebar__comment__pic">
	                                    <img src="${BoardDetail['MyProfileImage']}" alt="">
	                                </div>
                                    <textarea id="reply" name="replyContent" placeholder="댓글을 입력해 주세요." style="width: 79%;float: left"></textarea>
                                    <button type="button" class="site-btn" style="font-size: 1.05em; width: 120px;height: 48px;padding:0;float: right;margin-top: 15px;" onclick="fn_replyAdd()">댓글작성</button>
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