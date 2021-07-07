<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	
	//좋아요북마크 취소
	$(document).on("click",".remove",function(){
		var memberId = $("#sessionId").val(); 
		var lessonSeq = $("#lessonSeq").val(); 
		var bookgoodGubun = $(this).attr('alt');
		
		$.ajax({
			type : "get",
			data : {memberId:memberId, bookgoodGubun:bookgoodGubun, lessonSeq:lessonSeq},
			url : "removeLessonBookgoodAjax.do",
			success : function(result) {
				if (result == "no") {
					alert("문제가 발생하였습니다. 잠시후 다시 시도해주세요")
				} else {
					if(bookgoodGubun == 'G'){
						var txt = "";
						txt += "<img src='./resources/img/common/like.png' style='width: 17px; height: 15px;' class='full' alt='G' />"
						$("#div_good_img").html(txt);
						var txt2 = "";
						txt2 += "<p>"+result+"&nbsp;&nbsp;</p>"
						$("#div_good_cnt").html(txt2);
					}else{
						var txt = "";
						txt += "<img src='./resources/img/common/bookmark.png' style='width: 12px; height: 16px;' class='full' alt='B' />"
						$("#div_book_img").html(txt);
						var txt2 = "";
						txt2 += "<p>"+result+"&nbsp;&nbsp;</p>"
						$("#div_book_cnt").html(txt2);
					}
				}
			},
			error : function() {
				alert("오류발생");
			}
		});
	}); //.remove 클릭 이벤트 끝
	
	
	//좋아요북마크 추가
	$(document).on("click",".full",function(){
		var memberId = $("#sessionId").val(); 
		console.log("memberId"+memberId);
		var lessonSeq = $("#lessonSeq").val(); 
		var bookgoodGubun = $(this).attr('alt');
		
		$.ajax({
			type : "get",
			data : {memberId:memberId, bookgoodGubun:bookgoodGubun, lessonSeq:lessonSeq},
			url : "addLessonBookgoodAjax.do",
			success : function(result) {
				if (result == "no") {
					alert("문제가 발생하였습니다. 잠시후 다시 시도해주세요")
				} else {
					if(bookgoodGubun == 'G'){
						var txt = "";
						txt += "<img src='./resources/img/common/red_like.png' style='width: 17px; height: 15px;' class='remove' alt='G' />"
						$("#div_good_img").html(txt);
						var txt2 = "";
						txt2 += "<p>"+result+"&nbsp;&nbsp;</p>"
						$("#div_good_cnt").html(txt2);
					}else{
						var txt = "";
						txt += "<img src='./resources/img/common/yellow_bookmark.png' style='width: 12px; height: 16px;' class='remove' alt='B' />"
						$("#div_book_img").html(txt);
						var txt2 = "";
						txt2 += "<p>"+result+"&nbsp;&nbsp;</p>"
						$("#div_book_cnt").html(txt2);
					}
				}
			},
			error : function() {
				alert("오류발생");
			}
		});
	}); //.full 이벤트 끝
	
	
});





function fn_delLesson(){
	var params = location.search.substr(location.search.indexOf("?") + 1);
    var lessonSeq = params.substr(params.indexOf("=")+1); 
    console.log(lessonSeq);
	var flag_ok = confirm("강의를 정말 비활성화 하시겠습니까?");
	if(flag_ok){
   		var param = "";
   		param += "dummy=" + Math.random();
   		param += "&lessonSeq=" + lessonSeq
   		console.log(param)

   		$.ajax({
   			url : "lesson_delAjax.do",
   			data : param,
   			dataType : "text",
   			async:false,
   			success : function(data) {
   				if(data == "ok"){
   					alert("해당 강의가 비활성화 되었습니다. \n 추후 활성화를 원하시면 마이페이지에서 수정해주세요.");	
   					location.href="lessonList.do"
   				} else{
   					alert("비활성화에 실패하였습니다. 다시 한 번 시도해주세요")
   				}
   				console.log(data)
   			}
   		});
		
		
	}
}


function fn_toggle(cnt){
	$("#rereply_div"+ cnt).toggle("fast");
}



function fn_replyAdd(){
	var formData = new FormData($('#replyfrm')[0]);
	formData.append("secret", $('input:checkbox[name="secret"]:checked').val());
	
	$.ajax({
		type : 'post',
		url : 'replyLessonAddAjax.do',
		data : formData,
		processData : false,
		contentType : false,
		async:false,
		dataType:"text",
		success : function(data){
			if(data=="ok"){
				alert("댓글이 정상적으로 등록되었습니다.");
				$("textarea[name=replyContent]").val('');
				$(".replyarea").load(location.href + " .replyarea");
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


function fn_rereply(cnt){
	var formData = new FormData($('#frm'+ cnt)[0]);
	formData.append("reSecret", $('input:checkbox[name="reSecret"]:checked').val());
	
	$.ajax({
		type : 'post',
		url : 'rereplyLessonAddAjax.do',
		data : formData,
		processData : false,
		contentType : false,
		async:false,
		dataType:"text",
		success : function(data){
			if(data=="ok"){
				alert("댓글이 정상적으로 등록되었습니다.");
				$("textarea[name=replyContent]").val('');
				$(".replyarea").load(location.href + " .replyarea");
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

function fn_reply_del(seq){
	var result = confirm("정말 댓글을 삭제하시겠습니까?");
	if(result){
		var params = "replySeq="+ seq;
		$.ajax({
			type:"POST",
			async:false,
			url:"replyLessonDelAjax.do",
			data:params,
			success : function(data){
				if(data=="ok"){
					alert("댓글이 정상적으로 삭제되었습니다.");
					$("textarea[name=replyContent]").val('');
					$(".replyarea").load(location.href + " .replyarea");
				}else if(data=="ng"){
					alert("댓글 삭제가 실패하였습니다. 다시 시도해주세요");
				}else{
					alert("댓글 삭제가 실패하였습니다. 다시 시도해주세요");
				}
			},
			error : function(error){
				alert("삭제가 실패하였습니다. 다시 시도해 주세요.");
				console.log(error);
				console.log(error.status);
			}
		});
	
	}
	
}

</script>
<style type="text/css">
.btn div {
	display: inline-block;
	padding-right: .75rem;
	padding-left: .75rem;
}

#t1, #t2, #t3, #t4 {
	display: none;
}
.classes__item__text .class-btn:hover {
    background: #ffffff;
    border: 1px solid #5768AD;
    color: #5768AD;
}

.classes__item__text .class-btn {
    font-size: 14px;
    font-weight: 700;
    color: #ffffff;
    background:#5768AD;
    display: inline-block;
    border: 1px solid rgba(155, 158, 163, 0.2);
    padding: 10px 15px 7px;
    border-radius: 2px;
    -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    -ms-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
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
</head>
<body>
	<!-- Blog Hero Begin -->
	<section class="breadcrumb-option blog-hero set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__hero__text">
						<h2>온라인 강의</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Hero End -->
	<!-- 	main html 시작 -->
	
	<section class="about spad">
		<div class="container">
		<c:set var="resultList" value="${resultList}"/>
		<input type="hidden" name="lessonSeq" value="${resultList.lessonSeq}">
		<div style="background-color: white;border: 1px solid #ebecef;border-radius: 10px;">
			<div class="row" style="padding-top: 30px;padding-bottom: 30px;">
				<div class="col-lg-6 p-0">
					<div style="float: left;margin-left: 40px;">
	                  	<p style="font-weight: bold; color: #8B94B5;">카테고리&nbsp;&nbsp;|&nbsp; <span>${resultList.lessonCategoryName}</span></p>
	                </div><br/>
	                <div  style="float: right;margin-bottom: 7px;margin-right: 40px;margin-left: 40px;">
                        <div style="display: inline-block;vertical-align:sub;">
							<p style="margin:0;">${resultList.inDate}&nbsp;&nbsp;</p>
						</div>
                        <div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p style="margin:0;">${resultList.lessonHit}&nbsp;&nbsp;</p>
						</div>
						<div style="display: inline-block; vertical-align: middle;">
							<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
						</div>
						<div style="display: inline-block;vertical-align:sub;">
							<p>${resultList.lessonReply}&nbsp;&nbsp;</p>
						</div>
						
						<input type="hidden" value="${sessionScope.memberId }" id="sessionId">
						<input type="hidden" value="${resultList.lessonSeq}" id="lessonSeq">
						
						<!-- 좋아요 이미지 찍히는 곳 -->
						<div style="display: inline-block; vertical-align: middle;" id="div_good_img">
							<c:set var="goodFlag" value="${resultList.goodFlag}"/>
                  			<c:if test="${goodFlag == '1' }">
								<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;" class="remove" alt="G">
							</c:if>
							<c:if test="${goodFlag == '0' }">
								<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;" class="full" alt="G">
							</c:if>
						</div>
						
						<!-- 좋아요수 -->
						<div style="display: inline-block;vertical-align:sub;" id="div_good_cnt">
							<p>${resultList.lessonGood}&nbsp;&nbsp;</p>
						</div>
						
						<!-- 북마크 이미지 찍히는 곳 -->
						<div style="display: inline-block; vertical-align: middle;" id="div_book_img">
							<c:set var="bookFlag" value="${resultList.bookFlag}"/>
                  			<c:if test="${bookFlag == '1' }">
								<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;" class="remove" alt="B">
							</c:if>
							<c:if test="${bookFlag == '0' }">
								<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;" class="full" alt="B">
							</c:if>
						</div>
						
						<!-- 북마크수 -->
						<div style="display: inline-block;vertical-align:sub;" id="div_book_cnt">
							<p>${resultList.lessonBook}&nbsp;&nbsp;</p>
						</div> 
        			</div>
        			
        			
					<div style="text-align: center;">
						<img src="http://192.168.41.6:9999/upload/profit/${resultList.fileSaveName}" alt="강의 이미지" style="width: 85%; height: 450px;object-fit: cover;">
					</div>
				</div>
				<div class="col-lg-5 p-0">
					<div class="about__text" style="padding-left:20px;">
						<div class="section-title">
							<span style="font-size: 1.4em; font-weight: bold;color: #545454">◾ ${resultList.lessonTitle}</span><br/><br/>
							<div>
								<div style="display: inline-block; float:left;"><p># 한줄 소개 : </p></div>&nbsp;
								<div style="display: inline-block;"><p style="color:#304060">${resultList.lessonTitleComment}</p></div>
							</div>
							<div>
								<div style="display: inline-block;"><p># 강의 가격 : </p></div>&nbsp;
								<div style="display: inline-block;"><p style="color:#304060">${resultList.lessonPrice} 원</p></div>
							</div>
							<div>
								<div style="display: inline-block;"><p># 강의 기간 : </p></div>&nbsp;
								<div style="display: inline-block;"><p style="color:#304060">${resultList.lessonMonth} 개월</p></div>
							</div>
						</div>
						<div class="about__bar">
							<div class="about__bar__item">
								<p>Breathing</p><br/>
								<div id="bar1" class="barfiller">
									<span class="tip" style="left: 562.603px; transition: left 1s ease-in-out 0s;">82%</span>
									<span class="fill" data-percentage="${resultList.lessonBalance}" style="background: rgb(87, 104, 173); width: 590.4px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Flexibility</p><br/>
								<div id="bar2" class="barfiller">
									<span class="tip" style="left: 497.803px; transition: left 1s ease-in-out 0s;">73%</span>
									<span class="fill" data-percentage="${resultList.lessonFlex}" style="background: rgb(87, 104, 173); width: 525.6px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Strongness</p><br/>
								<div id="bar3" class="barfiller">
									<span class="tip" style="left: 562.603px; transition: left 1s ease-in-out 0s;">82%</span>
									<span class="fill" data-percentage="${resultList.lessonStrong}" style="background: rgb(87, 104, 173); width: 590.4px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
							<div class="about__bar__item">
								<p>Core</p><br/>
								<div id="bar4" class="barfiller">
									<span class="tip" style="left: 591.403px; transition: left 1s ease-in-out 0s;">86%</span>
									<span class="fill" data-percentage="${resultList.lessonCore}" style="background: rgb(87, 104, 173); width: 619.2px; transition: width 1s ease-in-out 0s;"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			</div>
		</div>
	</section>
	<!-- 	main html 시작 -->
	<!-- 	변경 DIV 시작 -->
	<script type="text/javascript">
		// 	style="border-bottom: 3px solid #7952B3;"
		$(function() {
			$('#tite1').click(function() {
				$('#li1').css({'border-bottom':'3px solid #7952B3', 'text-shadow' :'3px 3px 10px #7952B3', 'font-weight' : 'bold'});
				$('#li2').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#li3').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#t1').show().siblings('div').hide();
			})
		});
		$(function() {
			$('#tite2').click(function() {
				$('#li1').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#li2').css({'border-bottom': '3px solid #7952B3', 'text-shadow' :'3px 3px 10px #7952B3', 'font-weight' : 'bold'});
				$('#li3').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#t2').show().siblings('div').hide();
			})
		});
		$(function() {
			$('#tite3').click(function() {
				$('#li1').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#li2').css({'border-bottom': '3px solid #ffffff', 'text-shadow' :'none', 'font-weight' : 'normal'});
				$('#li3').css({'border-bottom': '3px solid #7952B3', 'text-shadow' :'3px 3px 10px #7952B3', 'font-weight' : 'bold'});
				$('#t3').show().siblings('div').hide();
			})
		});
		
	</script>
	<section class="about spad" style="padding-top:20px;">
	<div class="container">
		<main id="main" class="site-main" role="main">
			<div class="classes__item__text" style="text-align: right;">
			<c:choose>
				<c:when test="${buyer eq '1'}">
					<a href="javascript:alert('이미 강의를 구매하셨습니다. \n하단의 커리큘럼에서 강의 영상을 봐주시거나 마이페이지에서 확인해주세요');" class="class-btn">강의구매</a>
				</c:when>
				<c:when test="${buyer eq '0'}">
                	<span class="blinking" style="color:#ED2348;">강의를 구매하시면 커리큘럼 내에서 영상을 볼 수 있어요! → </span>&nbsp;
					<a href="buyLesson.do?lessonSeq=${resultList.lessonSeq}" class="class-btn">강의구매</a>
				</c:when>
			</c:choose>
				<a href="lessonList.do" class="class-btn">목록</a>
				<c:if test="${resultList.inUserId eq memberId}">
					<a href="lessonMod.do?lessonSeq=${resultList.lessonSeq}" class="class-btn">수정</a>
					<a href="#" onclick="fn_delLesson()" class="class-btn">비활성화</a>
					<a href="classAdd.do?lessonSeq=${resultList.lessonSeq}" class="class-btn">강의추가</a>
				</c:if>
			</div>
			
			<div class="d-flex justify-content-between align-items-center has-border">
				<ul id="titeul" class="nav sub-nav sub-nav--has-border">
					<li class="nav-item" id="li1">
						<a id="tite1" class="nav-link sub-nav-link" style="font-size:17px;">클래스 소개</a>
					</li>
					<li class="nav-item" id="li2">
						<a id="tite2" class="nav-link sub-nav-link" style="font-size:17px;">커리큘럼</a>
					</li>
					<li class="nav-item" id="li3">
						<a id="tite3" class="nav-link sub-nav-link" style="font-size:17px;">댓글</a>
					</li>
				</ul>
			</div>
			
			<div class="tab-content" style="padding-bottom: 50px;">
				<div class="tab-pane fade mt-2 mt-lg-5 active show" id="description-tab" role="tabpanel" aria-expanded="false">
				
				<div id="t1" style="display: block;">
					<p>${resultList.lessonIntro}</p>
				</div>
				
				<div id="t2">
					<!-- Classes Section Begin -->
					<section class="classes spad" style="padding-top:10px;">
						<div class="container">
							<span style="font-weight: bold; color: #8B94B5; font-size:17px;">Category &nbsp;|&nbsp; </span>
							<span style="font-weight: bold; color: #8B94B5; font-size:17px;">${resultClassList[0].lessonCategoryName}</span>
							<br/><br/>
							<table class="table table-hover" style="text-align: center;">
								<tbody>
									<tr style="background-color:rgb(211,197,245,0.5);">
										<th style="color:#4D4D4D;font-size:15px;font-family: 'DM Sans', sans-serif;font-weight: bold;">번호</th>
										<th style="color:#4D4D4D;font-size:15px;font-family: 'DM Sans', sans-serif;font-weight: bold;">썸네일</th>
										<th style="color:#4D4D4D;font-size:15px;font-family: 'DM Sans', sans-serif;font-weight: bold;">상세 강의 명</th>
										<th style="color:#4D4D4D;font-size:15px;font-family: 'DM Sans', sans-serif;font-weight: bold;">재생시간</th>
										<th style="color:#4D4D4D;font-size:15px;font-family: 'DM Sans', sans-serif;font-weight: bold;">등록일</th>
									</tr>
								<c:forEach var="rclassList" items="${resultClassList}" varStatus="status">
									<c:choose>
										<c:when test="${rclassList.inUserId eq memberId || buyer eq '1'}">
											<tr onclick="location.href='classDetail.do?lessonDetailSeq='+ ${rclassList.lessonDetailSeq}" style="cursor:pointer;">
												<th style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;" scope="row">${status.index+1}</th>
												<td style="vertical-align: middle;width:20%;">
													<img alt="" src="http://192.168.41.6:9999/upload/profit/${rclassList.fileSaveName}" style="width:100px;height: 90px;object-fit:cover;">
												</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">${rclassList.lessonDetailTitle}</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">20:32</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">${rclassList.inDate}</td>
											</tr>
										</c:when>
										<c:when test="${buyer eq '0'}">
											<tr>
												<th style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;" scope="row">${status.index+1}</th>
												<td style="vertical-align: middle;width:20%;">
													<img alt="" src="http://192.168.41.6:9999/upload/profit/${rclassList.fileSaveName}" style="width:100px;height: 90px;object-fit:cover;">
												</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">${rclassList.lessonDetailTitle}</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">20:32</td>
												<td style="vertical-align: middle;font-size:15px;font-family: 'DM Sans', sans-serif;">${rclassList.inDate}</td>
											</tr>
										</c:when>
									
									</c:choose>
								</c:forEach>
								</tbody>
							</table>
							
							<!-- 페이징처리 -->
<!-- 			            	<div class="col-lg-12"> -->
<!-- 								<div class="classes__pagination"> -->
<%-- 								<c:if test="${pageMaker.prev}"> --%>
<%-- 									<a href="lessonDetail.do${pageMaker.makeQuery(pageMaker.startPage - 1)}"> --%>
<!-- 										<span class="arrow_carrot-left"></span> -->
<!-- 									</a> -->
<%-- 								</c:if>  --%>
								
<%-- 								<c:set var="page" value="${pageMaker.cri.page}"/> --%>
<%-- 								<c:set var="idx" value="${idx}"/> --%>
<%-- 								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx"> --%>
<%-- 			            			<a href="lessonDetail.do${pageMaker.makeQuery(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a> --%>
<%-- 								</c:forEach> --%>
								
<%-- 								<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<%-- 									<a href="lessonDetail.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a> --%>
<%-- 								</c:if> --%>
<!-- 								</div> -->
<!-- 							</div> -->
							
						</div>
					</section>
				</div>
				
				<div id="t3">
					<div class="row">
						<div class="col-lg-12">
							<div class="leave__comment__text">
								<h2>😁자유롭게 댓글을 달아보세요</h2>
							</div>
						</div>
						
						<div id="reply_area" class="col-lg-4 order-lg-1 order-2 replyarea" style="width: 100%;flex: 0 0 100%;max-width: 100%;padding-right: 0px;margin-left: 23px;">
                
                    <div class="blog__sidebar">
                        
                        <div class="blog__sidebar__comment" style="overflow-x:hidden;height: 500px;padding:10px;">
                            <h4>댓글</h4>
                            
	                            <div class="classes__sidebar__comment" style="border-bottom: 0">
	                                   <c:forEach var="result" items="${resultList['replyList']}" varStatus="status">
	                                <form id="frm${status.count}">
	                                <input type="hidden" name="lessonSeq" value="${result.lessonSeq}">
	                               <c:if test="${empty result.replyParentSeq}"><c:set var="cnt" value="${result.replySeq}" /></c:if>
									<input type="hidden" name="replyParentSeq" value="${cnt}">
	                                <div class="classes__sidebar__comment__pic" style="<c:if test="${result.replyDepth == 2}">margin-left:100px;</c:if>">
	                                    <img src="${result.filePath}" alt="">
	                                </div>
	                                <div class="classes__sidebar__comment__text">
	                                    <h6>
	                                    	<c:choose>
	                                    		<c:when test="${result.replySecretFlag == 'N'}">
	                                    			${result.memberNickname}&nbsp;&nbsp;&nbsp;&nbsp;
	                                     			<c:if test="${result.replyDepth == 1}">
	                                     				<a style="font-size: 0.8em;color: gray;" onclick='fn_toggle(${result.replySeq})'>답글달기</a>
	                                     			</c:if>
	                                    		<span style="font-size: 0.9em;color: gray;float: right;padding-right: 20px;font-family: 'DM Sans', sans-serif;">${fn:substring(result.inDate,0,10)}</span>
	                                    		</c:when>
	                                    		
	                                    		<c:when test="${(result.replySecretFlag == 'Y' && result.inUserId eq memberId) || (result.replySecretFlag == 'Y' && resultList.inUserId eq memberId)}">
	                                    			${result.memberNickname}&nbsp;&nbsp;&nbsp;&nbsp;
	                                    			<img src="./resources/img/common/lock.png" alt="secretIcon" style="width: 25px; height: 23px;vertical-align: middle;">
	                                     			<c:if test="${result.replyDepth == 1}">
	                                     				<a style="font-size: 0.8em;color: gray;" onclick='fn_toggle(${result.replySeq})'>답글달기</a>
	                                     			</c:if>
	                                    		<span style="font-size: 0.9em;color: gray;float: right;padding-right: 20px;font-family: 'DM Sans', sans-serif;">${fn:substring(result.inDate,0,10)}</span>
	                                    		</c:when>
	                                    		
	                                    		<c:when test="${result.replySecretFlag == 'Y'}">
	                                    			${result.memberNickname}&nbsp;&nbsp;&nbsp;&nbsp;
	                                     		<img src="./resources/img/common/lock.png" alt="secretIcon" style="width: 25px; height: 23px;vertical-align: middle;">
	                                    		<span style="font-size: 0.9em;color: gray;float: right;padding-right: 20px;font-family: 'DM Sans', sans-serif;">${fn:substring(result.inDate,0,10)}</span>
	                                    		</c:when>
	                                    	</c:choose>
	                                    </h6>   
	                                    <div style="margin-top: 20px;">
	                                    	<c:choose>
	                                    		<c:when test="${result.replySecretFlag == 'N'}">
				                                    <p>${result.replyContent}
				                                    <c:if test="${result.inUserId eq memberId}">
				                                    <img src="./resources/img/common/delete.png" style="width:15px; height: 15x;margin-left : 20px;"onclick="fn_reply_del(${result.replySeq})">
													</c:if>
				                                    </p>
			                                    </c:when>
			                                    
			                                    <c:when test="${(result.replySecretFlag == 'Y' && result.inUserId eq memberId) || (result.replySecretFlag == 'Y' && resultList.inUserId eq memberId)}">
				                                    <p>${result.replyContent}
				                                    <c:if test="${result.inUserId eq memberId}">
				                                    <img src="./resources/img/common/delete.png" style="width:15px; height: 15x;margin-left: 20px;"onclick="fn_reply_del(${result.replySeq})">
													</c:if>
				                                    </p>
			                                    </c:when>
			                                    
			                                    
			                                   <c:when test="${result.replySecretFlag == 'Y'}">
			                                    	<p>비밀댓글입니다</p>
			                                    
			                                   </c:when>
			                                </c:choose>
		                                    
	                                	</div>
	                                </div><br>
	                                <c:if test="${result.replyNextDepth == 1 || empty result.replyNextDepth}">
	                                	<div class="row" >
			                                <div id="rereply_div${cnt}" class="col-lg-12" style="margin-top: 15px;margin-left: 100px;display: none;">
				                                <div class="classes__sidebar__comment__pic">
				                                    <img src="${MyProfileImage}" alt="" >
				                                </div>
				                                <input type="checkbox" name="reSecret" value="비밀댓글">&nbsp;비밀댓글<br>
			                                    <textarea id="reply" name="replyContent" placeholder="답글을 입력해 주세요." style="width: 67%;float: left"></textarea>
			                                    <button type="button" class="site-btn" style="font-size: 1.05em; width: 120px;height: 48px;padding:0;float:left;margin-top: 15px;margin-left: 5px;" onclick="fn_rereply(${status.count})">답글작성</button>
			                                </div>
			                            </div>
	                                	<hr>
	                                </c:if>
	                                </form>
	                                </c:forEach>
	                            </div>
                            <form id="replyfrm">
                            <input type="hidden" name="lessonSeq" value="${resultList.lessonSeq}">
                            <div class="row">
                                <div class="col-lg-12">
                                </div>
                                <div class="col-lg-12">
	                                <div class="classes__sidebar__comment__pic">
	                                    <img src="${MyProfileImage}" alt="">
	                                </div>
                                    <input type="checkbox" name="secret" value="비밀댓글">&nbsp;비밀댓글<br>
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
			</div>
				
		</main>
	</div>
</section>
	<!-- 	변경 DIV 시작 -->
</body>
<!-- Js Plugins -->
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/jquery.nice-select.min.js"></script>
<script src="./resources/js/jquery.barfiller.js"></script>
<script src="./resources/js/jquery.slicknav.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/main.js"></script>
<link rel="stylesheet" href="https://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/style.css?ver=1590611604">
</html>