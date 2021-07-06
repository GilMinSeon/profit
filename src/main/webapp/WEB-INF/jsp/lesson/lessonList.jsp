<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

// function fn_seljogun(){
// 	var selCategory = document.getElementById("selCate");
// 	var selLev = document.getElementById("selLev");
// 	var searchText = document.getElementById("searchText");
	
// 	var sel_cvalue = $("select[name=selCate] option:selected").text();
// 	var sel_lvalue = $("select[name=selLev] option:selected").text();
// 	var sel_tvalue = $("input:[name=searchText]").val();
	
// 	console.log("sel_cvalue "+sel_cvalue);
// 	console.log("sel_lvalue "+sel_lvalue);
// 	console.log("sel_tvalue "+sel_tvalue);
	
// 	var param = "";
// 	param += "dummy=" + Math.random();
// 	param += "&sel_cvalue=" + sel_cvalue;
// 	param += "&sel_lvalue=" + sel_lvalue;
// 	param += "&sel_tvalue=" + sel_tvalue;
	
// 	console.log("param "+ param);
	
// 	$.ajax({
// 		type : 'get',
// 		url : 'searchCateAjax.do',
// 		data : param,
// 		async:false,
// 		dataType:"json",
// 		success : function(data, textStatus){
// 			if(data != null){
// // 				var jsonInfo = JSON.parse(data);
// 				console.log(data)
// 				if(data.msg == "ok"){
// 					var txt = "";
					
// 				}
// 			}else{
// 				alert("뿡뿡이");
// 			}
// 	},
// 		error : function(error){
// 			alert("신청이 실패하였습니다. 다시 시도해 주세요.");
// 			console.log(error);
// 			console.log(error.status);
// 		}
		
		
// 	})
	
// }

// submit방식
// $(function(){
// 	$("#frm").submit(function(){
// 		var sel_cvalue = $("select[name=selCate] option:selected").text();
// 	 	var sel_lvalue = $("select[name=selLev] option:selected").text();
// 	 	var keyword = $("input[name=keyword]").text();
	 	
// 		console.log("sel_cvalue "+sel_cvalue);
// 	 	console.log("sel_lvalue "+sel_lvalue);
// 	 	console.log("keyword"+keyword);
	 	
// 	 	var offset = $('#row_sel').offset();
// 	 	console.log(offset);
// 	 	$('html').animate({scrollTop : offset.top}, 1672);

	 	
	 	
	 	
// 	})
	
	
	
	
	
// })



</script>
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
}

.team__slider.owl-carousel .owl-stage-outer {
    padding-top: 10px; 
    padding-bottom: 40px;
}
</style>

<body>

	 <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>온라인 클래스</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
	<!-- Breadcrumb Begin -->
	<section class="team spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="height:60px;">
                    <div class="section-title" style="text-align: left">
                        <h3 style="font-weight: bold;">🏆조회수 TOP 5</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="team__slider owl-carousel">
				<c:forEach var="resultTop" items="${resultTopList}" varStatus="status">
				<c:if test="${resultTop.lessonPrivateFlag eq 'n'}">
                    <div class="col-lg-6">
                        <div class="team__item" style="padding-top:0px;padding-bottom: 10px;">
                        <div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${resultTop.fileSaveName}" style="padding-top: 0px;">
                            <span>${resultTop.inDate}</span>
                        </div>
                        <div class="classes__item__text" style="padding-top: 10px;padding-bottom: 10px; padding-left: 0;padding-right: 0;">
                            <div style="text-align: right;">
	                            <div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${resultTop.lessonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/newreply.png" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="goodFlag" value="${resultTop.goodFlag}"/>
                    				<c:if test="${goodFlag == '1' }">
									<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
									</c:if>
									<c:if test="${goodFlag == '0' }">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
								
									<c:set var="bookFlag" value="${resultTop.bookFlag}"/>
                    				<c:if test="${bookFlag == '1' }">
									<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									<c:if test="${bookFlag == '0' }">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${resultTop.lessonBook}&nbsp;&nbsp;</p>
								</div>  
                            </div>
							<p style="font-weight: bold; color: #8B94B5;">카테고리 | <span>${resultTop.lessonCategoryName}</span></p>
                            <h4 style="margin-bottom: 10px;">
								<a style="font-size: 0.8em;font-weight: bold;">${resultTop.lessonTitle}</a>
							</h4>
                            <div>
                            	<div style="display: inline-block;vertical-align: middle;">
                            		<img src="./resources/img/common/writer.PNG" style="width:24px;height: 26px;opacity: 0.5;" />
                            	</div>&nbsp;
                            	<div style="display: inline-block;">
                            		<h6 style="margin-bottom: 25px;color:#535353">${resultTop.inUserId}</h6>
                            	</div>
                            </div>
                            <a href="lessonDetail.do?lessonSeq=${resultTop.lessonSeq}" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                        </div>
                        </div>
                    </div>
                   </c:if>
				</c:forEach>
                </div>
            </div>
        </div>
    </section>
	<!-- Team Section End -->
	<!-- Classes Section Begin -->
	<section class="classes spad">
		<div class="container">
			<div class="classes__filter">
				<div class="row">
					<div class="col-lg-12">
						<form method="get" id="frm" action="lessonList.do#location123">
							<div class="class__filter__select">
								<p>Categories:</p>
								<select name="selCate" id="selCate">
									<option value="">카테고리</option>
									<option value="헬스" 
										<c:if test="${option.selCate == '헬스'}">selected</c:if>>헬스</option>
									<option value="필라테스"
										<c:if test="${option.selCate == '필라테스'}">selected</c:if>>필라테스</option>
									<option value="요가"
										<c:if test="${option.selCate == '요가'}">selected</c:if>>요가</option>
									<option value="맨몸운동"
										<c:if test="${option.selCate == '맨몸운동'}">selected</c:if>>맨몸운동</option>
								</select>
							</div>
							<div class="class__filter__select">
								<p>Level:</p>
								<select name="selLev" id="selLev"> 
									<option value="">전체</option>
									<option value="조회순"
										<c:if test="${option.selLev == '조회순'}">selected</c:if>>조회순</option>
									<option value="좋아요순"
										<c:if test="${option.selLev == '좋아요순'}">selected</c:if>>좋아요순</option>
									<option value="댓글순"
										<c:if test="${option.selLev == '댓글순'}">selected</c:if>>댓글순</option>
								</select>
							</div>
							<div class="class__filter__input">
								<p>Search:</p>
								<input type="text" placeholder="검색" id="keyword" name="keyword" value="${option.keyword}">
							</div>
							<div class="class__filter__btn">
								<button type="submit" style="cursor:pointer;">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<span id="location123"></span>
						</form>
					</div>
				</div>
			</div>
			<div class="classes__item__text" style="text-align: right;padding-top: 0;">
                 <span class="blinking">내 강의 등록하러 가기 → </span>&nbsp;
                 <a href="lessonAdd.do" class="class-btn_w">강의등록</a>
   		 	</div>
			<div class="row">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<c:if test="${result.lessonPrivateFlag eq 'n'}">
			<input type="hidden" name="lessonSeq">
				<div class="col-lg-4 col-md-6">
					<div class="classes__item classes__item__page">
						<div class="classes__item__pic set-bg" data-setbg="http://192.168.41.6:9999/upload/profit/${result.fileSaveName}"></div>
						<div class="classes__item__text" style="padding-left: 5px; padding-right: 5px;">
							<div style="text-align: right;">
								<div style="display: inline-block;vertical-align:sub;float: left">
									<p style="margin:0;">${result.inDate}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/hit.png" style="width: 19px; height: 12px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p style="margin:0;">${result.lessonHit }&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/reply.PNG" style="width: 17px; height: 17px; opacity: 0.5;">
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonReply}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<c:set var="goodFlag" value="${result.goodFlag}"/>
                    				<c:if test="${goodFlag == '1' }">
									<img src="./resources/img/common/red_like.png" style="width: 17px; height: 15px;">
									</c:if>
									<c:if test="${goodFlag == '0' }">
									<img src="./resources/img/common/like.png" style="width: 17px; height: 15px;">
									</c:if>
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonGood}&nbsp;&nbsp;</p>
								</div>
								<div style="display: inline-block; vertical-align: middle;">
									<c:set var="bookFlag" value="${result.bookFlag}"/>
                    				<c:if test="${bookFlag == '1' }">
									<img src="./resources/img/common/yellow_bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
									<c:if test="${bookFlag == '0' }">
									<img src="./resources/img/common/bookmark.png" style="width: 12px; height: 16px;">
									</c:if>
								</div>
								<div style="display: inline-block;vertical-align:sub;">
									<p>${result.lessonBook}&nbsp;&nbsp;</p>
								</div>
							</div>
							<p style="color:#CE60FA;">카테고리 | <span>${result.lessonCategoryName}</span></p>
							<h4 style="margin-bottom: 30px;">
								<a href="lessonDetail.do" style="font-size: 0.8em;font-weight: bold;">${result.lessonTitle}</a>
							</h4>
							<div>
								<div style="display: inline-block; vertical-align: middle;">
									<img src="./resources/img/common/writer.PNG" style="width: 24px; height: 26px; opacity: 0.5;">
								</div>
								&nbsp;
								<div style="display: inline-block;">
									<h6 style="margin-bottom: 25px;">${result.inUserId}</h6>
								</div>
							</div>
							<a href="lessonDetail.do?lessonSeq=${result.lessonSeq}"  class="class-btn" style="width: 100%; text-align: center;">상세보기</a>
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
				<div class="col-lg-12">
					<div class="classes__pagination">
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">
							<span class="arrow_carrot-right"></span>
						</a>
					</div>
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