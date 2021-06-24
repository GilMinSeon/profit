<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
.out_div{
	margin-right: auto; 
	max-width: 100%; 
	width: 500px; 
	margin-left: auto;
}
.inner_input{
 	margin-bottom: 17px; 
 	margin-top: 4px;
}

.form-control:focus {
	color: white;
	background-color: #FFFFFF33;
	border-color: #80bdff;
	outline: 0;
	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25)
}

#submitBtn {
	font-size: 14px;
	color: #5768AD;
	text-transform: uppercase;
	display: inline-block;
	background: #ffffff;
	padding: 14px 35px 12px;
	border-radius: 2px;
	border: none;
	font-weight: 700;
	letter-spacing: 2px;
}
</style>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#frm").submit(function(){
		
		if($("#memberPwd").val() !== $("#confirmPwd").val()){
			alert("비밀번호가 다릅니다!")
			$('#confirmPwdMsg').html("you can use this ID");
			$("#memberPwd").val("").focus();
			$("#confirmPwd").val("");
			return false;
		}
	})
	
	$("#memberId").blur(function() {
		
		var memberId = $.trim($("#memberId").val()); //현재 창에 입력된 값
		
		//checkMemberId로 데이터 전송 - 비동기 전송방식
		$.ajax({
			type : "POST",
			data : "memberId="+memberId, //json
			url : "idcheck",
			dataType : "text", //리턴타입
			
			//전송 후 세팅
			success : function(result) {
				if (result == "ok") {
					$("#msgId").html("사용가능한 아이디 입니다");
					$("input[name=checked_id]").val('y');
				} else {
					$("#msgId").html("사용중인 아이디입니다");
				}
			},
			error : function(){
				alert("오류발생");
			}
			
		})
	});
	
	
	
	$("#confirmPwd").blur(function() {
		
		
		if($("#memberPwd").val() !== $("#confirmPwd").val()){
			$("#msgPwd").html("비밀번호가 일치합니다!");
			alert("비밀번호가 다릅니다!")
			$('#confirmPwdMsg').html("you can use this ID");
			$("#memberPwd").val("").focus();
			$("#confirmPwd").val("");
			return false;
		}
		
		
		
		var memberId = $.trim($("#memberId").val()); //현재 창에 입력된 값
		
		//checkMemberId로 데이터 전송 - 비동기 전송방식
		$.ajax({
			type : "POST",
			data : "memberId="+memberId, //json
			url : "idcheck",
			dataType : "text", //리턴타입
			
			//전송 후 세팅
			success : function(result) {
				if (result == "ok") {
					$("#msgId").html("사용가능한 아이디 입니다");
					$("input[name=checked_id]").val('y');
				} else {
					$("#msgId").html("사용중인 아이디입니다");
				}
			},
			error : function(){
				alert("오류발생");
			}
			
		})
	});
	
	
			
		
})
	
</script>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>회원가입</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->

	<!-- Appoinment Section Begin -->
	<section class="appointment" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="container">
			<div class="appointment__text">
				<!-- <form class="appointment__form" action="#"> -->
				<form class="appointment__form" action="joinMemberTable" id="frm" method="post">
					<div class="text-center" >

						<!-- 1. 아이디 // 1) 아이디 중복검사 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 5px;">
								<h5 style="display: inline; float: left; color: white;">아이디 *&nbsp;&nbsp;</h5>
								<h5 style="display: inline; float: left; color: orange;" id="msgId" ></h5>
							</div>
							<input class="inner_input" type="text" placeholder="ID" id="memberId" name="memberId">
							<input class="inner_input" type="hidden" name="checked_id" value="n">
						</div>

						
						<!-- 2. 비밀번호 입력 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">비밀번호 *&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="Password" id="memberPwd" name="memberPwd">
						</div>

						<!-- 3. 비밀번호 확인 // 2) 비밀번호 일치여부 검사 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">비밀번호 확인 *&nbsp;&nbsp;</h5>
								<h5 style="display: inline; float: left; color: orange;" id="msgPwd" ></h5>
							</div>
							<input class="inner_input" type="text" placeholder="Password" id="confirmPwd" name="confirmPwd">
							<input class="inner_input" type="hidden" name="checked_pwd" value="n">
						</div>
						
						<!-- 4. 이름 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">이름 *&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="Name" id="memberName" name="memberName">
						</div>
						
						<!-- 5. 닉네임 // 3) 닉네임 중복검사 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">닉네임 *&nbsp;&nbsp;</h5>
								<h5 style="display: inline; float: left; color: orange;" id="msgNickname" ></h5>
							</div>
							<input class="inner_input" type="text" placeholder="Nickname" id="memberNickname" name="memberNickname">
							<input class="inner_input" type="hidden" name="checked_nickname" value="n">
						</div>
						
						<!-- 6. 핸드폰번호 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">핸드폰번호 *&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="숫자만 입력해주세요" id="memberMobile" name="memberMobile">
						</div>

						<!-- 7. 성별 선택 -->
						<div class="col-lg-6 text-center mypage_myinfo out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">성별 *&nbsp;&nbsp;</h5>
								&nbsp;&nbsp;
							</div>
							<div class="join_gender" >
								<input type="radio" name="memberGender" id="male" value="남자" autocomplete="off" style="opacity: 0;margin-bottom: 5px;"> 
								<label for="male" style="float: left;margin-bottom: 5px;">남자</label> 
								<input type="radio" name="memberGender" id="female" value="여자" autocomplete="off" style="opacity: 0;margin-bottom: 5px;"> 
								<label for="female" style="float: left;margin-bottom: 5px;">여자</label>
							</div>
						</div>

						<br><br><br>
						<!-- 8. 키 입력 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">키&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="" id="memberHeight" name="memberHeight">
						</div>

						<!-- 9. 몸무게 입력 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">몸무게&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="" id="memberWeight" name="memberWeight">
						</div>
						
						<!-- 10. 이메일 & 이메일 인증 버튼 -->
						<div class="col-lg-6 text-center out_div" style="margin-bottom: 20px;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white; margin-bottom: 4px;">이메일 *&nbsp;&nbsp;</h5>
							</div>
							<div class="input-group" style="margin-bottom: 5px;">
								<input type="text" class="form-control" placeholder="Email" id="memberEmail" name="memberEmail" style="font: white;"> 
									<span class="input-group-addon"
									style="border: 1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='pwdMod'" class="input-group-addon"
										style="font-size: 1.0em; padding: 12.5px; margin-left: 5px;">인증번호전송</button>
								</span>
							</div>
						</div>
						
						
						<!-- 11. 이메일인증번호 입력칸 -->
						<div class="col-lg-6 text-center out_div">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">이메일 인증번호 *&nbsp;&nbsp;</h5>
							</div>
							<input class="inner_input" type="text" placeholder="인증번호">
						</div>
						<br>
						
						
						<!-- 끝! 회원가입 버튼 -->
						<div class="col-lg-6 text-center out_div">
							<input type="submit" value="회원가입" id="submitBtn" style="font-size: 1.1em;"><br>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Appoinment Section End -->


	<!-- Js Plugins -->
	
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
</body>

</html>