<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style type="text/css">
.classes__item__text .class-btn {
    font-size: 14px;
    font-weight: 700;
    color: #ffffff;
    background-color: #5768AD;
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

.classes__item__text .class-btn:hover {
    background: #ffffff;
    border: 1px solid #5768AD;
    color: #5768AD;
}
</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
var webSocket = null;
function connect(){
	var ws = new WebSocket("ws://localhost:9999/websocket/echo.do");
	webSocket = ws;
	
	ws.onopen = function () {
	    console.log('Info: connection opened.');
	    processOpen();
	};

	ws.onmessage = function (message) {
	    console.log(message);
		console.log("ReceiveMessage:", message.data+'\n');
	    processMessage(message);
	};

	ws.onclose = function (event) {
		console.log('Info: connection closed.'); 
	};
	
	ws.onerror = function (err) { 
		console.log('Error:', err); 
	};
}

//프로세스 오픈
function processOpen() {
	var command = "firstConnection";
	var memberId = "${sessionScope.memberId}";
	
	webSocket.send(JSON.stringify({ "command" : command, "memberId" : memberId}));
	console.log("processOpen");
	//여기서 보냈으니까 밑에서 받을것
}

//프로세스 중
function processMessage(message) {
	//var jsonData = JSON.parse("message.data");
	console.log("화면 두번째 메서드");
	var str = message.data;
	console.log(str)
	var arr = str.split(",");
	console.log("여기여기")
	
	console.log(arr)
	if(arr[0] == "first"){
		console.log(arr[2])
	}
	
	
	
	
/* 	console.log("프로세스중!!!")
	console.log(message.data)
	
	var str = message.data;
	var arr = str.split(",");
	
	console.log(arr[0])
	console.log(arr[1])
	
	if(arr[0] == "add"){
		$("#"+arr[1]+"").attr("src", "./resources/img/common/chat1.png")

	} */
	
	
/* 	if (jsonData.allUsers != null) {
		//다른 사용자 접속 시,
		displayUsers(jsonData.allUsers);
	}  */
	
/* 	if (jsonData.disconnectedUser != null) {
		//다른 사용자가 접속을 끊을 때,
		$("#"+jsonData.disconnectedUser).remove();
	} */
	
	//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
/* 	if (jsonData.enterChatId != null) {
		var roomId = jsonData.enterChatId;
		$("#roomId").val(roomId);
		$("#username").val(jsonData.username);
		openPopup(roomId);
	} */
}


$(function(){
	memberGubun = "${sessionScope.memberGubun}";
	trainerId = "${sessionScope.memberId}";

	connect();
	
	//트레이너가 "상담받기" 클릭했을때
	$('#btnAdd').on('click', function(evt) {
		
	  	evt.preventDefault();
		if (webSocket.readyState !== 1) return;
		  	
		//let msg = $('input#msg').val();
		webSocket.send("add," + trainerId);
	});

	
});

function fn_showTrainer(){
	memberId = "${sessionScope.memberId}";
	$("#"+memberId+"").attr("src", "./resources/img/common/chat1.png")
	
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
                        <h2>식단관리</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
<!-- Breadcrumb End -->
<!-- Trainer Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
        ${sessionScope.trainerChatFlag }
        ${sessionScope.memberId }
        <c:if test="${msg eq 'ok' && memberGubun eq 'U'}">
        
        
        <div class="classes__item__text"  style="text-align: center;padding-top: 0;">
	 		 <span class="blinking">이용권을 구매하여 전문가와 식단상담을 시작하세요 → </span>&nbsp;
	         <a href="buyTicket.do" class="class-btn_w" style="font-size: 1.1em;">이용권 구매</a>
	    </div>
	    </c:if>
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h5 style="font-weight: bold;">🟢 상담가능 / 🟣 상담중 / 🔴 상담불가</h5>
                    </div>
                </div>
            </div>
            
            
            <!-- 웹소켓 리스트 -->
            <div class="row">
            <div class="col-lg-4 col-md-6" style="margin-bottom: 100px;">
            <div class="single-trainer-item" style="position: relative">
            	<h3>        
            		<input type="button" value="상담받기" id="btnAdd">
            		<input type="button" value="상담그만">
            	</h3>
            	<br><br>
            	<input type="text" id="msg">
                <input type="button" id="btnSend" value="전송">
            	
            </div>
            </div>
            </div>
            <!-- 웹소켓 리스트 끝 -->
            
            
            
            
            
            
            <!-- 원래 리스트 -->   
            <div class="row">
            <c:forEach var="result" items="${chatList}" varStatus="status">
                <div class="col-lg-4 col-md-6" style="margin-bottom: 100px;">
                    <div class="single-trainer-item" style="position: relative">
                    	<div style="position: absolute;left: 10px;top: 10px;" >
                        	<img id="${result.memberId }" src="./resources/img/common/chat3.png" style="width: 35px; height: 35px;">
                        </div>
                        <img src="${result.filePath}" style="width: 360px;height: 360px" alt="">
                        <div class="trainer-text">
                            <h5>${result.memberName}</h5>
                            <span>헬스트레이너</span>
                            <div style="height: 110px;">
                            <p>${result.chatProfileIntro}</p>
                            </div>
                            <div class="classes__item__text" style="padding-left: 5px;padding-right: 5px;padding-top: 0">
                           		<a href="chatDetail.do?chatProfileSeq=${result.chatProfileSeq}" class="class-btn" style="width:100%; text-align: center;">상세보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                
                <!-- 페이징처리 -->
            	<div class="col-lg-12">
					<div class="classes__pagination">
					<c:if test="${pageMaker.prev}">
						<a href="chatList.do${pageMaker.makeQueryChatProfile(pageMaker.startPage - 1)}">
							<span class="arrow_carrot-left"></span>
						</a>
					</c:if> 
					
					<c:set var="page" value="${pageMaker.cri.page}"/>
					<c:set var="idx" value="${idx}"/>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            			<a href="chatList.do${pageMaker.makeQueryChatProfile(idx)}" <c:if test="${page == idx }">style="background: #5768AD;color:#FFFFFF;"</c:if>>${idx}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="chatList.do${pageMaker.makeQueryChatProfile(pageMaker.endPage + 1)}"><span class="arrow_carrot-right"></span></a>
					</c:if>
					</div>
				</div>
                <!-- 페이징 끝 -->
                
                
                </div>
                <!-- 원래리스트 끝 -->
                
                
                
                <div class="col-lg-4 col-md-6" style="margin-bottom: 100px;"></div>
                <div class="col-lg-4 col-md-6" style="margin-bottom: 100px;"></div>
                
             	<c:if test="${memberGubun eq 'T' && profileFlag eq 'ok'}">
                <div class="classes__item__text"  style="text-align: right;padding-top: 0;">
			         <a href="chatProfileAdd.do" class="class-btn_w" style="font-size: 1.1em;">프로필 등록</a>
			    </div>
                </c:if>
        </div>
    </section>
    <!-- Trainer Section End -->
</body>
<!-- Js Plugins -->
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</html>