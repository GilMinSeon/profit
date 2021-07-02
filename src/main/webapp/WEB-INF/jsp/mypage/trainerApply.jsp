<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input:-webkit-autofill {
  -webkit-box-shadow: 0 0 0px 30px #ecedf2 inset !important;
  -webkit-text-fill-color: black !important;
  
}
#trainerAward::-webkit-input-placeholder, #trainerCareer::-webkit-input-placeholder{
        color:gray;
}

</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>

    
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

    function send_file(){
       var formData = new FormData($('#frm')[0]);
          $.ajax({
             type : 'post',
             url : 'uploadAjax.do',
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
    }
    
    $(function(){
       
       if(${memberGender.equals('F')}){
          $("input:radio[id='female']").prop("checked", true);  
          $("input:radio[id='male']").prop("checked", false); 

       }else{
          $("input:radio[id='female']").prop("checked", false);  
          $("input:radio[id='male']").prop("checked", true); 
       }
       
    })
</script>
<body>

    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>마이페이지</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            
				<!-- 사이드바 시작 -->
				<div class="col-lg-4 order-lg-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__categories">
							<h4>카테고리</h4>
							<ul>
								<li><a href="myinfo.do">내정보</a></li>
								<li><a href="bookmark.do">북마크</a></li>
								<li><a href="myLessonList.do">마이클래스</a></li>
								<li><a href="myChatList.do">1:1채팅내역</a></li>
							</ul>
						</div>
						
						<br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>채팅이용권</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li>이용권 보유 개수 ▶ 3회 </li>
	                                <li><a href="ticketBuyList.do">이용권 구매내역</a></li><br>
	                                <li><a href="ticketUseList.do">이용권 사용내역</a></li>
	                            </ul>
	                            <br>
	                            <a href="#" class="sidebar-btn">구매하기</a>
	                        </div>
                        </div>
                        
                        <br>
						<div class="classes__sidebar">
	                        <div class="classes__sidebar__item classes__sidebar__item--info">
	                            <h4>트레이너 신청</h4>
	                            <ul class="classes__sidebar__item__widget">
	                                <li><span class="icon_calendar"></span><a href="trainerApplyList.do">나의 신청내역</a> </li>
	                                <li><span class="icon_id"></span><a href="trainerApply.do">신청하기</a></li>
	                            </ul>
	                        </div>
                        </div>
					</div>
				</div>
				<!-- 사이드바 끝 -->
                
                
                <!-- 여기부터 달라짐 -->
                <div class="col-lg-8 order-lg-2 order-1">
                    <div class="row" style="display: inline-block;width: 100%;" >
                           <!-- Appoinment Section Begin -->
   <section class="appointment" style=" margin-bottom: 50px;">
      <div class="container">
         <div class="appointment__text" style="background-color: #9e9e9e0a">
<!--             <form class="appointment__form"  action="fileUpload" id="frm" method="post" enctype="multipart/form-data"> -->
               <div class="text-center">
                  <h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;">트레이너 신청</h4>
                  <br/>
                  <p style="font-family: DM Sans, sans-serif;font-size: 1.2em;color:#5768AD;">본인의 정보를 정확히 입력하여 신청해주세요. </p>
                  <p style="color:#5768AD;">▶ 보완처리시 휴대폰번호로 연락드립니다.</p>
                  <p style="color:#5768AD;">▶ 첨부서류는 <span style="color:#FC7F65;">pdf</span> 파일로 첨부해주세요.</p>
                  <p style="color:#5768AD;">▶ 경력과 수상이력은 해당양식에 맞춰 작성해주세요.</p>
                  <br/><br/>
                  <form id="frm" class="appointment__form" method="post" 
                                            enctype="multipart/form-data">
                  <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; ;">이름</h5>
                                 &nbsp;
                              </div>
                              <input id="trainerName" type="text"
                                 style="background-color: #3f51b50d; color: black;"
                                 value="${memberName}" readonly="readonly">
                           </div>

                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">성별</h5>
                                 &nbsp;
                              </div>
                              <div class="r_gender">
                                 <input type="radio" name="gendType" id="male" value="M" autocomplete="off" style="opacity: 0;" onclick="return(false);">
                                 <label for="male" style="border:1px solid;float:left;">남자</label>
                                 <input type="radio" name="gendType" id="female" value="F" autocomplete="off" style="opacity: 0;" onclick="return(false);">
                                 <label for="female" style="border:1px solid;" >여자</label>
                              </div>
                           </div>
                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">핸드폰번호</h5>
                                 &nbsp;
                              </div>
                              <input id="mobile" type="text" placeholder="Mobile" 
                                 style="background-color: #3f51b50d; color: black;"
                                 value="${fn:substring(memberMobile,0,3)}-${fn:substring(memberMobile,3,7)}-${fn:substring(memberMobile,7,11)}"
                                 readonly="readonly">
                           </div>
                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">소속헬스장</h5>
                                 &nbsp;
                              </div>
                              <input id="trainerGym" name="trainerGym" type="text" placeholder="소속 헬스장을 입력하세요" name="trainerGym"
                                 style="background-color: #3f51b50d; color: black;"
                                 value="">
                           </div>
                           
                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">수상이력</h5>
                                 &nbsp;
                              </div>
                              <div class="row">
                                 <div class="col-lg-12"></div>
                                 <div class="col-lg-12 text-center">
                                    <textarea  
                                       id="trainerAward" name="trainerAward" style="background-color: #3f51b50d; color: black; margin-bottom: 20px;resize: none;" placeholder="수상 이력을 입력하세요"></textarea>

                                 </div>
                              </div>
                           </div>
                           
                           
                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">경력</h5>
                                 &nbsp;
                              </div>
                              <div class="row">
                                 <div class="col-lg-12"></div>
                                 <div class="col-lg-12 text-center">
                                    <textarea id="trainerCareer" name="trainerCareer"
                                       style="background-color: #3f51b50d; color: black; margin-bottom: 20px;resize: none;" placeholder="경력을 입력하세요"></textarea>

                                 </div>
                              </div>
                           </div>
                           
                           
                           
                           <div class="col-lg-6 text-center mypage_myinfo"
                              style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
                              <div style="margin-bottom: 2px;">
                                 <h5 style="display: inline; float: left; color: black;">첨부파일</h5>
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

                           <br>
                           <div class="col-lg-12" style="text-align: right;">
                                      <input type="button" class="file_add" value="신청" style="width: 100%;" onclick="fn_submit()">
                                 </div>
                  
                  </form>

               </div>
<!--             </form> -->
         </div>
      </div>
   </section>
   <!-- Appoinment Section End -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Js Plugins -->
    
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</body>
</html>