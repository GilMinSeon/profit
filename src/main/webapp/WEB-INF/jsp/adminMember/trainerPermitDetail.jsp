<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>

<style type="text/css">
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}

.table tr:hover {
	background-color: #f8f6ff;
}
</style>
<script type="text/javascript">
var arr = [];

function fn_del(fileDetailSeq){
	if (confirm("파일을 삭제하시겠습니까?") == true){
		arr.push(fileDetailSeq);
		console.log(arr)
		$("div").remove("#"+fileDetailSeq+"");
		$("#del_file").append("<br>" + "<input type='text' name='delFile' value=" + fileDetailSeq + ">");
		
	}else{  
	    return;
	}

}


var cnt = 1;
function fn_addFile(){
    $("#d_file").append("<br>" + "<input type='file' id='file"+cnt+"' class='file_choice' name='file" + cnt + "'/>");
    
    cnt++;
}

function fn_delFile(){
   cnt -= 1;
   $("#file"+cnt).remove();
   
}



function fn_submit(){
   var msg = "ok";
   
   for(var i=1; i<cnt; i++){
      var file_val = $("#file"+i).val();
      if(!file_val){
         msg = "ng";
      }
   }
   
   if(msg=="ok"){
      var apply = confirm("신청서를 제출하시겠습니까?");
      if(apply == true){
         send_file();
         
      }
      else{
         alert("신청이 취소되었습니다.")
      }
   }else{
      alert("첨부하지 않은 파일은 삭제해주세요");
      
   }
}

//수정하기 눌렀을때 나타나는 효과들
function fn_update() {
	$('#file').css({'display' : 'block'});
	$('#submit').css({'display' : 'block'});
	$('#update').css({'display' : 'none'});
	$('#last_div').css({'display' : 'none'});
	
	$('#div_upload').css({'display' : 'block'});
	$('.div_img').css({'display' : 'inline'});
	
	$('.orange').css({'background-color' : '#fee9b8'});
	
	$('#trainerGym').prop('readonly', false); 
	$('#trainerAward').prop('readonly', false); 
	$('#trainerCareer').prop('readonly', false); 

}





function send_file(){
	var formData = new FormData($('#frm')[0]);
	
	console.log(formData)
	
	$.ajax({
		
	   	type : 'post',
	   	url : 'updateAdminPermitDetailAjax.do',
	   	data : formData,
	   	processData : false,
	   	contentType : false,
	   	async:false,
	   	dataType:"text",
	   	success : function(data){
		   if(data=="ok"){
		      alert("신청이 정상적으로 완료되었습니다.");
		      location.href="trainerApplyList.do";
		   }else if(data=="no"){
		      alert("신청이 실패하였습니다. 다시 시도해주세요");
		   }else{
		      alert("신청이 실패하였습니다. 다시 시도해주세요");
		   }
		},
	   	error : function(error){
	      alert("신청이 실패하였습니다. 다시 시도해 주세요.");
	      console.log(error);
	      console.log(error.status);
	   	}
	   
	   
	})
	
	$('#file').css({'display' : 'none'});
	$('#submit').css({'display' : 'none'});
	$('#update').css({'display' : 'block'});
	$('#last_div').css({'display' : 'block'});
	
	$('#trainerGym').prop('readonly', true); 
	$('#trainerAward').prop('readonly', true); 
	$('#trainerCareer').prop('readonly', true); 
	
	$('#div_upload').css({'display' : 'none'});
	$('.div_img').css({'display' : 'none'});
	
	$('.orange').css({'background-color' : 'none'});
	
	
	
 }




</script>


</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/hero/hero-11.jpg"
		style="padding-bottom: 0px; padding-top: 70px;"></section>
	<!-- Breadcrumb End -->


	<!-- 본문 시작 -->
	<section class="blog-details spad">

		<div class="container">
			<h3 style="text-align: center; cursor: pointer; margin-bottom: 30px;" onclick="location.href='trainerPermitList.do'">트레이너 승인</h3>
			<br>
			<div class="row" style="justify-content: center">
				
				
				<!-- 1번 div -->
				<div style="display: left; margin-right: 20px; width: 30%; background-color: white; padding: 0px; border: 1px solid #ebecef; border-radius: 10px; height: auto;">
					
					<div style="text-align: center;">
						<p style="font-size: 1.2em; font-weight: bold; margin-top: 20px; margin-bottom: 30px;">
							<span style="background-color: #3f51b50d;">&nbsp;관리자 메모&nbsp;</span>
						</p>
					</div>
					<div>
						<div class="box" style="height: 370px; padding-left: 30px; padding-right: 15px;">
							<textarea class="ta" style="border:none;background-color: #3f51b50d; color: black; margin-bottom: 20px; padding:10px 5px;
							resize: none; width:290px; height: 350px;">${detailVO.adminMemo }
                            </textarea>
                            <input type="button" value="메모저장" class="site-btn" style="width : 290px;"/>
						</div>
						<br><br><br>
						<hr>
					</div>
					

					<div style="text-align: center;">
						<p style="font-size: 1.2em; font-weight: bold; margin-top: 20px; margin-bottom: 30px;">
							<span style="background-color: #3f51b50d;">&nbsp;문자전송&nbsp;</span>
						</p>
					</div>
					<div>
						<div class="box" style="height: 370px; padding-left: 30px; padding-right: 15px;">
							<textarea class="ta" style="border:none;background-color: #3f51b50d; color: black; margin-bottom: 20px; resize: none; width:290px; height: 350px;">
안녕하세요. 프로핏입니다.

                            </textarea>
                            <input type="button" value="문자전송" class="site-btn" style="width : 290px;"/>
						</div>
						<br><br>
						
					</div>
				</div>
				<!-- 1번 div 끝 -->
				
				
				
				<!-- 2번 div -->
				<div class="col-lg-8 order-lg-2 order-1" style="background-color: white; padding: 30px; border: 1px solid #ebecef; border-radius: 10px; display: left; height: auto;">
					<!-- 수정 form 시작 -->
					<form class="appointment__form" id="frm" method="post" enctype="multipart/form-data">
						<div class="text-center">
							
							<!-- 1.이름 -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;">이름</h5>
									&nbsp;
								</div>
								<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;" 
									value="${detailVO.memberName }" name="memberName" id="memberName">
							</div>
							
							<!-- 2.핸드폰번호 -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;">핸드폰번호</h5>
									&nbsp;
								</div>
								<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;" 
									value="${detailVO.memberMobile }" name="memberMobile" id="memberMobile">
							</div>
	
							<!-- 3.이메일 -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;">이메일</h5>
									&nbsp;
								</div>
								<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;" 
									value="${detailVO.memberEmail }" name="memberEmail" id="memberEmail">
							</div>
							
							<!-- 4.성별 -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;">성별</h5>
									&nbsp;
								</div>
								<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;" 
									<c:if test="${ detailVO.memberGender eq 'F'}">
									value="여성"
									</c:if>
									<c:if test="${ detailVO.memberGender eq 'M'}">
									value="남성"
									</c:if>
									name="memberGender" id="memberGender">
							</div>
							
							
							<!-- 여기부터 데이터 수정 가능 -->
							<!-- 5.소속헬스장 -->
							<div class="col-lg-6 text-center mypage_myinfo"
								style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;"><span class="orange" style="background-color: none;">소속헬스장</span></h5>
									&nbsp;
								</div>
								<input type="text" readonly="readonly" style="background-color: #3f51b50d; color: black;"
									value="${detailVO.trainerGym }" name="trainerGym" id="trainerGym">
							</div>
							
							<!-- 6.수상이력 -->							
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;"><span class="orange" style="background-color: none;">수상이력</span></h5>
									&nbsp;
								</div>
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-12 text-center">
										<textarea class="ta" readonly="readonly" style="background-color: #3f51b50d; color: black; margin-bottom: 20px; resize: none;"
											name="trainerAward" id="trainerAward">${detailVO.trainerAward }
	
	                                    </textarea>
										</div>
									</div>
								</div>
	
							<!-- 7.경력 -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;"><span class="orange" style="background-color: none;">경력</span></h5>
									&nbsp;
								</div>
								<div class="row">
									<div class="col-lg-12"></div>
									<div class="col-lg-12 text-center">
										<textarea class="ta" readonly="readonly" style="background-color: #3f51b50d; color: black; margin-bottom: 20px; resize: none;"
											name="trainerCareer" id="trainerCareer">${detailVO.trainerCareer }
	                                    </textarea>
	
										</div>
									</div>
								</div>
							
							
							<!-- 첨부파일[기존파일들 보여주는 부분] -->
							<div class="col-lg-6 text-center mypage_myinfo" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
								<div style="margin-bottom: 2px;">
									<h5 style="display: inline; float: left; color: black;"><span class="orange" style="background-color: none;">첨부파일</span></h5>
									&nbsp;
									
									<div class="col-lg-12" style="text-align: left; float: left; padding: 20px; margin:0px; background-color: #3f51b50d;">
										<c:forEach var="fileVO" items="${fileVO}" varStatus="status">
										<div style="margin-bottom: 10px;" id="${fileVO.fileDetailSeq}">
										${fileVO.fileRealName }
										<a href="${fileVO.filePath }">파일 열기</a>
										<img src="./resources/img/common/delete.png" class="div_img" style="display:none; width: 15px; height: 15x;margin-left: 5px; margin-bottom: 3px;"
										onclick="fn_del(${fileVO.fileDetailSeq})">
										</div>
										
										</c:forEach>
									</div>
								</div>

								<div class="input-group" style="margin-bottom: 30px;"></div>
							</div>
							
							
							<!-- 파일삭제리스트 hidden -->
							<div id="del_file" style="display: none;">
							
							</div>
							
							<!-- 파일시퀀스 큰거 hidden -->
							<input type="hidden" name="fileSeq" value="${fileVO[0].fileSeq}">
							
							
							<!-- 파일추가하는 부분[파일업로드] -->
							<div class="col-lg-6 text-center mypage_myinfo" id="div_upload"
                              	style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto; display: none;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;"><span class="orange" style="background-color: none;">파일업로드</span></h5>
                                 &nbsp;
                                 <div class="col-lg-12" style="text-align: right; float: left; padding: 0; margin: 0;">
                                      <input type="button" class="file_add" value="파일 추가" onClick="fn_addFile()">
                                      <input type="button" class="file_add" value="파일 삭제" onClick="fn_delFile()">
                                      <div id="d_file" style="text-align: left;">
                                      
                                      </div>
                                 </div>
                              </div>
                                 
                              <div class="input-group" style="margin-bottom: 5px;">
                              </div>
                           </div>
							
							
									
							<!-- 수정하기 버튼 -->	
							<div class="col-lg-12" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
		                         <input id="update" type="button" class="file_add" value="수정하기" style="width: 470px; display: block;" onclick="fn_update()">
		                         <input id="submit" type="button" class="file_add" value="수정완료" style="background:orange; width: 470px; display: none;" onclick="fn_submit()">
		                    </div>
							<br>
							
							
							<!-- 승인/보완/반려 -->
							<div class="col-lg-12" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;display: blcok" id="last_div">
								<input type="button" value="승인" class="site-btn"
									style="display: inline-block; padding: 1px 6px; font-size: 1.1em; color: white; background-color: #5768AD; width: 31.5%; height: 48px; margin-right: 7px;">
								<input type="button" value="보완" class="site-btn"
									style="display: inline-block; padding: 1px 6px; font-size: 1.1em; color: white; background-color: #5768AD; width: 31.5%; height: 48px; margin-right: 7px;">
								<input type="button" value="반려" class="site-btn"
									style="display: inline-block; padding: 1px 6px; font-size: 1.1em; color: white; background-color: #5768AD; width: 31.5%; height: 48px; margin-right: 0px;">
							</div>
								
								
						</div>
					</form>
				</div><!-- 2번 div 끝 -->
				
				
			</div><!-- row div 끝 -->
		</div><!-- container div 끝 -->
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