<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function fn_refund(){
	var buyLessonSeq = $("input:hidden[name=buyLessonSeq]").val();
	var buyer = $("input:hidden[name=buyer]").val();
	var lessonSeq = $("input:hidden[name=lessonSeq]").val();
	console.log("buyLessonSeq "+buyLessonSeq);
	console.log("lessonSeq "+lessonSeq);
	console.log("buyer "+ buyer);
	
	var param = "";
	param += "dummy=" + Math.random();
	param += "&buyLessonSeq=" + buyLessonSeq;
	param += "&lessonSeq=" + lessonSeq;
	param += "&buyer=" + buyer;
	console.log(param);
	
	$.ajax({
		type : 'post',
		url : 'checkRefundAjax.do',
		data : param,
		async:false,
		dataType:"text",
		success : function(data){
		if(data=="ok"){
			go_refund();
		}else if(data=="no"){
			alert("환불대상이 아닙니다. \n마이페이지에 마이클래스에서 내 강의상태를 확인해 주세요.");
		}else{
			alert("환불요청에 문제가 있습니다. \n다시 시도해주시거나 관리자에게 문의해주세요");
		}
	},
		error : function(error){
			alert("환불 실패하였습니다. 다시 시도해 주세요.");
			console.log(error);
			console.log(error.status);
		}
	});
}	

function go_refund(){	
	var msg = "ok";
	if(msg=="ok"){
		var save = confirm("정말 환불을 요청하시겠습니까?");
		if(save == true){
			alert("환불요청이 접수되었습니다. \n관리자 확인 후 결제하신 수단으로 환불이 진행됩니다. \n환불기간은 3~5일정도 소요됩니다.");
		}
		
	}
}


</script>
</head>
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
					<section class="appointment"">
						<div class="container">
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="breadcrumb__text">
				                    	<div style="background-color: #F6F6F9;padding: 40px 0px 40px 0px;">
				                        <h2 style="color:#404041; font-weight: bold;">결제 상세 내역</h2><br>
					                       <section class="content content_content" style="width: 70%; margin: auto;">
				                    <section class="invoice">
				                        <!-- title row -->
				                        <div class="row">
				                        </div>
				                        <!-- info row -->
				                        <div class="row invoice-info">
				                            <div class="col-sm-4 invoice-col">
				                                <address>
				                                    <strong>
				                                                                            </strong>
				                                </address>
				                            </div><!-- /.col -->
				                            <div class="col-sm-4 invoice-col">
				                                <address>
				                                    <strong>
				                                        #구매정보                                   </strong>
				                                    <br>
				                                      결제사이트 : PROFIT                                  <br>
									   대표자 : JAYPARK<br>
									                                      <br>
				                                                                  </address>
				                            </div><!-- /.col -->
				                            <div class="col-sm-4 invoice-col">
				                            </div><!-- /.col -->
				                        </div><!-- /.row -->
				
				                        <!-- Table row -->
				<!--                        <form id="payForm" method="POST" accept-charset="UTF-8"> -->
				                        <div class="row">
				                            <div class="col-xs-12 table-responsive">
				                            <input type="hidden" name="buyLessonSeq" value="${payDetailList.buyLessonSeq}">
				                            <input type="hidden" name="buyer" value="${payDetailList.buyer}">
				                            <input type="hidden" name="lessonSeq" value="${payDetailList.lessonSeq}">
				                                <table class="table" style="margin-bottom: 0px;">
				                                    <tr></tr>
				                                    
				                                    <tr>
				                                    	<th style="display:table-cell; vertical-align: middle;width:20%;background: #6d7ab0 ; color: white;font-size: 1.1em;">구매자</th>
				                                    	<td colspan="2" style="display:table-cell; vertical-align: middle;">${payDetailList.buyer}</td>
				                                    </tr>
				                                    
				                                    <tr>
				                                    	<th style="display:table-cell; vertical-align: middle;background-color:#6d7ab0; color: white;font-size: 1.1em;">상품명</th>
				                                    	<td colspan="2" style="display:table-cell; vertical-align: middle;">
															<img src="http://192.168.41.6:9999/upload/profit/${payDetailList.fileSaveName}" style="width:100px;height: 70px;object-fit: cover; ">&nbsp;&nbsp;&nbsp;
				                                            <br/><br/>	${payDetailList.lessonTitle}
														</td>
				                                    </tr>
				                                    
				                                    <tr>
				                                    	<th style="display:table-cell; vertical-align: middle;background-color:#6d7ab0; color: white;font-size: 1.1em;">가격</th>
				                                    	<td colspan="2" style="display:table-cell; vertical-align: middle;">${payDetailList.lessonPrice}원</td>
				                                    </tr>
				                                    
				                                    <tr>
				                                    	<th style="display:table-cell; vertical-align: middle;background-color:#6d7ab0; color: white;font-size: 1.1em;">결제일</th>
				                                    	<td colspan="2" style="display:table-cell; vertical-align: middle;">${fn:substring(payDetailList.paydate,0,10)}</td>
				                                    </tr>
				                                    
				                                </table>
				                            </div><!-- /.col -->
				                        </div><!-- /.row -->
				<!-- 						</form> -->
				                        <div class="row">
				                            <!-- accepted payments column -->
				                            <div class="col-md-12">
				                                <div class="table-responsive">
				                                    <table class="table">
				                                        <tbody>
				                                            
				                                            
				                                            <tr style="text-align: right;">
				                                                <td>총 합계 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: #FBEDB5;padding: 3px;">${payDetailList.lessonPrice}원(&#8361;)</span></td>
				                                            </tr>
				                                        </tbody>
				                                        
				                                    </table>
				                                    <br/><br/><br/><br/>
				                                    
		                                    		<div class="classes__item__text"  style="text-align: center;padding-top: 0px;margin-left: auto;margin-right: auto;">
												         <a class="class-btn_w" style="font-size: 1.1em;cursor:pointer;" onclick="fn_refund()">&nbsp;&nbsp;환불하기&nbsp;&nbsp;</a>
												         <a href="myLessonList.do" class="class-btn_w" style="font-size: 1.1em;">&nbsp;&nbsp;뒤로가기&nbsp;&nbsp;</a>
										   			 </div>
				                                    
				                                </div>
				                            </div><!-- /.col -->
				                        </div><!-- /.row -->
				
				                    </section>
				                </section>
				                        </div>
				                    </div>
				                </div>
				            
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
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</body>
</html>