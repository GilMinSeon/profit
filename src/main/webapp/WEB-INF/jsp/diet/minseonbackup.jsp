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
$(function(){
	memberGubun = "${sessionScope.memberGubun}";
	trainerId = "${sessionScope.memberId}";
	
	//최초연결
 	connect();
//	<c:if test="${sessionScope.trainerChatFlag eq 'Y'}">
//		$("#${sessionScope.memberId}").attr("src", "./resources/img/common/chat1.png")
//	</c:if>
	
	
	//트레이너가 "상담받기" 클릭했을때
	$('#btnAdd').on('click', function(evt) {
		
	  	evt.preventDefault();
		if (webSocket.readyState !== 1) return;
		  	
		//let msg = $('input#msg').val();
		webSocket.send("add," + trainerId);
	});
	
	//인풋박스 메세지 보내기
/* 	$('#btnSend').on('click', function(evt) {
		
	  	evt.preventDefault();
		if (webSocket.readyState !== 1) return;
		  	
		let msg = $('input#msg').val();
		webSocket.send(msg);
	}); */
	
});

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
	//connectionType = "firstConnection";
	var command = "firstConnection";
	var memberId = "${sessionScope.memberId}";
// 	var trainerChatFlag = "${sessionScope.trainerChatFlag}";

	fn_changeSessionY();
	
	webSocket.send(JSON.stringify({ "command" : command, "memberId" : memberId, "trainerChatFlag" : "Y" }));
	console.log("processOpen");
}

//프로세스 중
function processMessage(message) {
	//var jsonData = JSON.parse("message.data");
	console.log("화면 두번째 메서드");
	var str = message.data;
	var arr = str.split(",");
	
	
	console.log(arr)
	if(arr[0] == "first" && arr[2] == "Y"){
		$("#"+arr[1]+"").attr("src", "./resources/img/common/chat1.png")
	}
	location.reload();
	
	
	
	
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


function displayUsers(userList) {
	var username;
	$("#users tr:not(:first)").remove();
	for (var i=0; i<userList.length; i++) {
		if("${loginVO.name}"==userList[i]) {
			username = userList[i]+"(me!)";
		} else{
			username = userList[i];
		}
		$.newTr = $("<tr id="+userList[i]+" onclick='trClick(this)'><td>"+username+"</td></tr>");
		//append
		$("#users").last().append($.newTr);
		
	}
}








function fn_showTrainer(){
	//var memberId = "${sessionScope.memberId}";
	//$('#trainers > tbody:last').append('<tr><td>HELLO world</td><td>' + memberId + '</td></tr>');
	memberId = "${sessionScope.memberId}";
	connect();
	$("#"+memberId+"").attr("src", "./resources/img/common/chat1.png")
	
}


function fn_changeSessionY(){
	var memberId = "${sessionScope.memberId}";
	$.ajax({
		type : "POST",
		data : "memberId=" + memberId,
		url : "changeSessionYAjax.do",
		dataType : "text", 
		success : function(result) {
			if (result == "no") {
				console.log("세션 값 바꾸기 문제 발생");
			}
// 			location.reload();
		},
		error : function() {
			alert("오류발생");
		}

	})
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
            		<input type="button" value="상담받기" id="btnAdd" onclick="connect()">
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

















						<div class="page-content page-container" id="page-content">
      <div style="margin-top: 30px; margin-bottom: 30px;">
         <div class="row container d-flex justify-content-center"
            style="margin-right: auto; margin-left: auto;">
            <div class="col-md-6">
               <div class="card card-bordered" style="width: 450px;">
                  <div class="card-header">
                     <h4 class="card-title">
                        <strong>곽두팔 트레이너</strong>
                     </h4>
                     <a class="btn btn-xs btn-secondary" href="#" data-abc="true">Let's
                        Chat App</a>
                  </div>
                  <div class="ps-container ps-theme-default ps-active-y"
                     id="chat-content"
                     style="overflow-y: scroll !important; height: 600px !important;">
                     <div class="media media-chat">
                        <img class="avatar"
                           src="https://img.icons8.com/color/36/000000/administrator-male.png"
                           alt="...">
                        <div class="media-body">
                           <p>Hi</p>
                           <p>How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???How are you ...???</p>
                           <p>
                              What are you doing tomorrow?<br> Can we come up a bar?
                           </p>
                           <p class="meta">
                              <time datetime="2018">23:58</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-meta-day">Today</div>
                     <div class="media media-chat media-chat-reverse">
                        <div class="media-body">
                           <p>Hiii, I'm good.</p>
                           <p>How are you doing?</p>
                           <p>Long time no see! Tomorrow office. will be free on
                              sunday.</p>
                           <p class="meta">
                              <time datetime="2018">00:06</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat">
                        <img class="avatar"
                           src="https://img.icons8.com/color/36/000000/administrator-male.png"
                           alt="...">
                        <div class="media-body">
                           <p>Okay</p>
                           <p>We will go on sunday?</p>
                           <p class="meta">
                              <time datetime="2018">00:07</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat media-chat-reverse">
                        <div class="media-body">
                           <p>That's awesome!</p>
                           <p>I will meet you Sandon Square sharp at 10 AM</p>
                           <p>Is that okay?</p>
                           <p class="meta">
                              <time datetime="2018">00:09</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat">
                        <img class="avatar"
                           src="https://img.icons8.com/color/36/000000/administrator-male.png"
                           alt="...">
                        <div class="media-body">
                           <p>Okay i will meet you on Sandon Square</p>
                           <p class="meta">
                              <time datetime="2018">00:10</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat media-chat-reverse">
                        <div class="media-body">
                           <p>Do you have pictures of Matley Marriage?</p>
                           <p class="meta">
                              <time datetime="2018">00:10</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat">
                        <img class="avatar"
                           src="https://img.icons8.com/color/36/000000/administrator-male.png"
                           alt="...">
                        <div class="media-body">
                           <p>Sorry I don't have. i changed my phone.</p>
                           <p class="meta">
                              <time datetime="2018">00:12</time>
                           </p>
                        </div>
                     </div>
                     <div class="media media-chat media-chat-reverse">
                        <div class="media-body">
                           <p>Okay then see you on sunday!!</p>
                           <p class="meta">
                              <time datetime="2018">00:12</time>
                           </p>
                        </div>
                     </div>
                     <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
                        <div class="ps-scrollbar-x" tabindex="0"
                           style="left: 0px; width: 0px;"></div>
                     </div>
                     <div class="ps-scrollbar-y-rail"
                        style="top: 0px; height: 0px; right: 2px;">
                        <div class="ps-scrollbar-y" tabindex="0"
                           style="top: 0px; height: 2px;"></div>
                     </div>
                  </div>

                  <div class="publisher bt-1 border-light">
                     <img class="avatar avatar-xs"
                        src="https://img.icons8.com/color/36/000000/administrator-male.png"
                        alt="..."> <input class="publisher-input" type="text"
                        placeholder="Write something"> <span
                        class="publisher-btn file-group"> <i
                        class="fa fa-paperclip file-browser"></i> <input type="file">
                     </span> <a class="publisher-btn" href="#" data-abc="true"><i
                        class="fa fa-smile"></i></a> <a class="publisher-btn text-info"
                        href="#" data-abc="true"><i class="fa fa-paper-plane"></i></a>
                  </div>
                  <div class="publisher bt-1" style="background-color: #f9fafb; border: none;" >
                     <div class="classes__item__text"
                        style="text-align: center; padding-top: 10px; padding-left: 0; padding-right: 0">
                        <a href="chatDetail" class="class-btn_w"
                           style="font-size: 1.1em; width: 410px; height: 50px;">상담종료</a>
                     </div>
                  </div>
               </div>
               
            </div>

         </div>
      </div>
   </div>










//////////////////////////////////////////////////////////
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var webSocket = null;
	var first = "true";
	$('#sendBtn').attr("disabled", true);

	//DOCUMENT READY FUNCTION START
	$(document).ready(function() {
		//memberGubun = "${sessionScope.memberGubun}";
		//trainerId = "${sessionScope.memberId}";
		connect();

		$('#sendBtn').click(function() {
			send(textMessage.value); //send function 
			textMessage.value = "";
		});

		$('#textMessage').keypress(function(e) {
			if (e.which == 13) {
				send(textMessage.value);
				textMessage.value = "";
			}
		});

		$('#leaveBtn').click(function() {
			websocket.close();
			window.close();
		});

	});
	//DOCUMENT READY FUNCTION END

	function connect() {
		var url = 'ws://' + window.location.host
				+ '${pageContext.request.contextPath}/chat/'
				+ '<c:out value="${roomId}"/>';
		console.log(url)
		var ws = new WebSocket(url);
		webSocket = ws;

		ws.onopen = function() {
			console.log('Info: connection opened.');
			send('<c:out value="${username}"/>');
			$('#sendBtn').attr("disabled", false);
		};

		ws.onmessage = function(message) {
			console.log(message);
			console.log("ReceiveMessage:", message.data + '\n');
			processMessage(message);
		};

		ws.onclose = function(event) {
			console.log('Info: connection closed.');
		};

		ws.onerror = function(err) {
			console.log('Error:', err);
		};
	}

	//오픈 메세지 보내는 부분!!!
	function send(message) {
		webSocket.send(JSON.stringify({
			'message' : message,
			'room' : "<c:out value='${roomId}'/>"
		}));
	}

	//프로세스 중
	function processMessage(message) {
		
		var jsonData = JSON.parse(message.data);

		console.log("프로세스중")
		if (jsonData.messageType == "ChatMessage") {
			console.log("ChatMessage 받음");
			message = jsonData.name + " : " + jsonData.message + '\n';
			//display(message);

			displaybubble(jsonData);

			//첫번째 턴일때 메세지 받으면 이곳으로 온다!	
		} else if (jsonData.messageType == "UsersMessage") {
			console.log("UsersMessage받음");
			var other = "";
			for (var i = 0; i < jsonData.users.length; i++) {
				if ("${sessionScope.memberId}" != jsonData.users[i]) {
					$('#users').append(jsonData.users[i] + "님과 대화중입니다");
					other = jsonData.users[i];
					first = "false";
				}
			}
			if (first == "false" && other == "") {
				$('#users').empty();
				$('#users').append("");//대화상대가 아무도 없습니다.
			}
		}
		
		$('#chat-content').scrollTop($('#chat-content')[0].scrollHeight);
	}
	
	
	
	function displaybubble(data) {
		//data.name => 아이디 
		//보낸사람이 나일때
		if (data.name == "${sessionScope.memberId}") {
			if($('#chat-content div').last().hasClass("reverse")){
				$('#chat-content div').last().append("<p>"+ data.message + "</p>");
			}else {
				$('#chat-content').append("<div class='media media-chat media-chat-reverse'><div class='media-body reverse'><p>"
							+ data.message + "</p></div></div>");
			}
			
			
		//상대방한테 메세지 받음
		} else {
			if($('#chat-content div').last().hasClass("reverse") || $('#chat-content div').last().hasClass("empty")){
				$('#chat-content').append("<div class='media media-chat'><img class='avatar' src='https://img.icons8.com/color/36/000000/administrator-male.png'><div class='media-body'><p>"
						+ data.message + "</p></div></div>");
			}else {
				$('#chat-content div').last().append("<p>"+ data.message + "</p>");
			}
			
			
		}
	}

	function processError(message) {
	}

	window.onbeforeunload = function() {
		websocket.close();

	};
</script>
</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>1:1 상담</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<input type="button" id="leaveBtn" name="leaveBtn" value="Leave" />

	<div class="page-content page-container" id="page-content">
		<div style="margin-top: 30px; margin-bottom: 30px;">
			<div class="row container d-flex justify-content-center" style="margin-right: auto; margin-left: auto;">
				<div class="col-md-6">
					<div class="card card-bordered" style="width: 450px;">
						<div class="card-header">
							<div id="users" style="font-size: 18px;"></div>
							<a class="btn btn-xs btn-secondary" href="#" data-abc="true">Let's Chat App</a>
						</div>
						
						
						
						
						<!-- chat-content DIV 시작 -->
						<div id="chat-content" class="ps-container ps-theme-default ps-active-y" style="overflow-y: scroll !important; height: 600px !important;" >
							<!-- <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
								<div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
							</div>
							<div class="ps-scrollbar-y-rail" style="top: 0px; height: 0px; right: 2px;">
								<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 2px;"></div>
							</div> -->
							
						
							
							
							
							
							<div class="empty"></div>
							<!-- 
							내가 보내는 부분
							<div class="media media-chat media-chat-reverse">
								<div class="media-body">
								<p>안녕</p>
								</div>
							</div>
							
							

							<div class="media media-chat media-chat-reverse">
								<div class="media-body">
								<p>안녕</p>
								<p>안녕</p>
								</div>
							</div>
							 -->
							<!-- 
							<div class="media media-chat">
								<img class="avatar"
									src="https://img.icons8.com/color/36/000000/administrator-male.png"
									alt="...">
								<div class="media-body">
									<p>Hi</p>
									<p>How are you ...???</p>
									<p>
										What are you doing tomorrow?<br> Can we come up a bar?
									</p>
									<p class="meta">
										<time datetime="2018">23:58</time>
									</p>
								</div>
							</div>
							<div class="media media-meta-day">Today</div>
							<div class="media media-chat media-chat-reverse">
								<div class="media-body">
									<p>Hiii, I'm good.</p>
									<p>How are you doing?</p>
									<p>Long time no see! Tomorrow office. will be free on
										sunday.</p>
									<p class="meta">
										<time datetime="2018">00:06</time>
									</p>
								</div>
							</div>
							 -->
						
						</div>
						<!-- chat-content DIV 끝 -->
						
						
						<div class="publisher bt-1 border-light">
							<img class="avatar avatar-xs" src="https://img.icons8.com/color/36/000000/administrator-male.png">
							
							<input id="textMessage" class="publisher-input" type="text" placeholder="Write something"> 
							
							<input type="button" id="sendBtn" name="sendBtn" value="Send" />
							
							<a class="publisher-btn text-info" href="#" data-abc="true"><i class="fa fa-paper-plane"></i></a>
							
							<span class="publisher-btn file-group"><i class="fa fa-paperclip file-browser"></i><input type="file"></span> 
							
						</div>
						<div class="publisher bt-1" style="background-color: #f9fafb; border: none;">
							<div class="classes__item__text" style="text-align: center; padding-top: 10px; padding-left: 0; padding-right: 0">
								<a href="chatDetail" class="class-btn_w" style="font-size: 1.1em; width: 410px; height: 50px;">상담종료</a>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#chat-content').scrollTop($('#chat-content')[0].scrollHeight);
</script>
<!-- Js Plugins -->
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/jquery.nice-select.min.js"></script>
<script src="./resources/js/jquery.barfiller.js"></script>
<script src="./resources/js/jquery.slicknav.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/main.js"></script>

<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js" rel="stylesheet"> -->
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
<!--     <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet"> -->

</html>










