<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
<style type="text/css">
.class-btn {
	width: 50px;
	padding: 0;
	height: 30px;
	background-color: #ffc107c2;
	font-size: 14px;
	font-weight: 700;
	color: #ffffff;
	display: inline-block;
	border: 1px solid rgba(155, 158, 163, 0.2);
	border-radius: 2px;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.class-btn:hover {
	background: #ffffff;
	border: 1px solid #ffc107c2;
	color: #ffc107c2;
}

-ms-overflow-style
:
 
none
;
 
}
::-webkit-scrollbar {
	display: none;
}

.box {
	-ms-overflow-style: none;
}

.box::-webkit-scrollbar {
	display: none;
}

.kcalList tr td {
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #6c7ae05c;
}

.kcalList tr:hover {
	background-color: #f8f6ff;
}

.kcal_span{
font-weight: bold;
}
.kcal_img{
width: 15px; 
height: 15px;
}


</style>


<script type="text/javascript">
function fn_modalOpen(){
	
	
	$("#myModal").modal('show');
	
	
	//ajax
/* 	var formData = new FormData($('#frm'+ kcalNum)[0]);
	$.ajax({
		type:"POST",
		url:"kcalNumAjax.do",
		data:formData,
		processData : false,
		contentType : false,
		async:false,
		dataType:"text",
		success : function(data){
			
			
			
			var jsonInfo = JSON.parse(data);
			if(jsonInfo.msg=="ok"){
				$('#food_name').text(jsonInfo.descKor);
				$('#makerName').text(jsonInfo.makerName);
				$('#nutrCont1').text(jsonInfo.nutrCont1);
				$('#servingSize').text(jsonInfo.servingSize);
				$('#sp1').text("탄수화물( " + jsonInfo.nutrCont2 + " g )");
				$('#sp2').text("단백질( " + jsonInfo.nutrCont3 + " g )");
				$('#sp3').text("지방( " + jsonInfo.nutrCont4 + " g )");
				$('#sp4').text("당류( " + jsonInfo.nutrCont5 + " g )");
				$('#sp5').text("나트륨( " + jsonInfo.nutrCont6 + " g )");
				if(jsonInfo.cont2Rs>100){
					$("#carbo").css('width',"100%");
				}else{
					$("#carbo").css('width',jsonInfo.cont2Rs + "%");
				}
				if(jsonInfo.cont3Rs>100){
					$("#protein").css('width',"100%");
				}else{
					$("#protein").css('width',jsonInfo.cont3Rs + "%");
				}
				if(jsonInfo.cont4Rs>100){
					$("#fat").css('width',"100%");
				}else{
					$("#fat").css('width',jsonInfo.cont4Rs + "%");
				}
				if(jsonInfo.cont5Rs>100){
					$("#sugars").css('width',"100%");
				}else{
					$("#sugars").css('width',jsonInfo.cont5Rs + "%");
				}
				if(jsonInfo.cont6Rs>100){
					$("#salt").css('width',"100%");
				}else{
					$("#salt").css('width',jsonInfo.cont6Rs + "%");
				}
				
			}else if(jsonInfo.msg=="ng"){
				alert("데이터를 불러오는 데 실패했습니다. 다시 시도해 주세요.");
			}else{
				alert("데이터를 불러오는 데 실패했습니다. 다시 시도해 주세요.");
			}
		},
		error : function(error){
			alert("데이터를 불러오는 데 실패했습니다. 다시 시도해 주세요.");
			console.log(error);
			console.log(error.status);
		} 
	});*/
	
}





</script>
</head>
<style>
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}

.table tr:hover {
	background-color: #f8f6ff;
}

</style>
<body>

	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<!-- <h2>트레이너 승인</h2> -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
				
	<section class="classes spad">
		<div class="container">
			<h3 style="text-align: center; cursor: pointer;" onclick="location.href='adminMemberList.do'">회원조회</h3>
			<br>
			    <div class="classes__filter" style="margin-bottom: 0px;">
				<br>
                <div class="row">
                    <div class="col-lg-12">
                        <form action="adminChatList.do">
                            <div class="class__filter__select" style="width: 150px;">
                                <p>회원구분</p>
                                <select name="selStatus">
                                    <option <c:if test="${selStatus eq '전체'}">selected</c:if>>전체</option>
                                    <option <c:if test="${selStatus eq '결제'}">selected</c:if>>일반회원</option>
                                    <option <c:if test="${selStatus eq '환불'}">selected</c:if>>트레이너</option>
                                </select>
                                
                            </div>
                            <div class="class__filter__select" style="width: 150px;">
                                <p>회원상태</p>
                                <select name="selStatus">
                                    <option <c:if test="${selStatus eq 'X'}">selected</c:if>>전체</option>
                                    <option <c:if test="${selStatus eq 'X'}">selected</c:if>>정상회원</option>
                                    <option <c:if test="${selStatus eq 'O'}">selected</c:if>>블랙리스트</option>
                                </select>
                                
                            </div>
							<div class="class__filter__select" style="width: 150px;">
                                <p>검색조건</p>
                                <select name="selIdentity">
                                    <option <c:if test="${selIdentity eq '전체'}">selected</c:if>>전체</option>
                                    <option <c:if test="${selIdentity eq '이름'}">selected</c:if> >이름</option>
                                    <option <c:if test="${selIdentity eq '아이디'}">selected</c:if>>아이디</option>
                                </select>
                            </div>
							<div id="searchDiv" class="class__filter__input"  style="margin-right: 20px;width: 350px;">
								<p>검색어</p>
								<input type="text" name="searchKeyword" placeholder="검색" style="width: 100%;" value="${searchKeyword}">
								<div class="class__filter__btn">
                                <button><i class="fa fa-search"></i></button>
                            </div>
							</div>
                            
                        </form>
                    </div>
                </div>
            </div>
			<div class="classes__filter" style="padding-top: 20px;">
			
			
			<input class="site-btn" type="button" value="블랙리스트 해제" style="height: 40px; padding : 8px 30px; background-color: #17a2b8;opacity: 85%;float: right;"/>
			<input class="site-btn" type="button" value="블랙리스트 등록" style="height: 40px; padding : 8px 30px; background-color: #c82333;opacity: 88%;float: right; margin-right: 15px;"/>
			
			<br><br>
			<table class="table" style="text-align: center;">
				<thead>
					<tr style="background: #6d7ab0; color: white;font-size: 1.1em;"><!-- 8개 -->
						<th scope="col"></th>
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">성별</th>
						<th scope="col">회원구분</th>
						<th scope="col">가입일</th>
						<th scope="col">회원상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${chatList}" varStatus="status">
					<tr onclick="fn_modalOpen()">
						<td onclick="event.cancelBubble=true"><input type="checkbox" /></td>
						<td>1</td>
						<td>grac12313212</td>
						<td>길민선</td>
						<td>여</td>
						<td>트레이너</td>
						<td>2021-05-05</td>
						<td>정상회원</td>
					</tr>
					
					</c:forEach>
				</tbody>
			</table>
			
			
			<!-- 모달시작 -->
			<div class="modal" id="myModal" tabindex="-1" role="dialog">
			    <div class="modal-dialog" role="document" style="margin-left: 550px; margin-right: auto;">
			        <div class="modal-content" style="width : 800px;">
			            <div class="modal-header">
			                <h3 class="modal-title">📌회원 정보 상세보기</h3>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body">
			            	<!-- 테이블 시작 -->
			                <table style="border: 1px solid #d5d6d6;width: 600px;text-align: center;margin-left: auto;margin-right: auto;">
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="width: 30%;font-weight: bold;padding:10px;background-color: #fff1c6">식품이름</th>
			                		<td style="width: 60%;"><span id="food_name"></span></td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">판매 기업</th>
			                		<td><span id="makerName"></span></td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                	<tr style="border: 1px solid #d5d6d6;">
				                	<th style="font-weight: bold;padding:10px;background-color: #fff1c6">총내용량</th>
			                		<td><span id="nutrCont1"></span> Kcal ( <span id="servingSize"></span> g )</td>
			                	</tr>
			                </table>
			                <!-- 테이블 끝 -->
			        	</div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 모달 끝 -->
			
			
			<!-- 페이징처리 -->
            	<div class="col-lg-12">
					<div class="classes__pagination">
					<c:if test="${pageMaker.prev}">
						<a href="adminChatList.do${pageMaker.makeQueryAdminChat(pageMaker.startPage - 1)}">
							<span class="arrow_carrot-left"></span>
						</a>
					</c:if> 
					
					<c:set var="page" value="${pageMaker.cri.page}"/>
					<c:set var="idx" value="${idx}"/>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            			<a href="adminChatList.do${pageMaker.makeQueryAdminChat(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="adminChatList.do${pageMaker.makeQueryAdminChat(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
					</c:if>
					</div>
				</div>
			
			</div>
		</div>
	</section>
				

	<!-- Js Plugins -->
				
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>
</html>