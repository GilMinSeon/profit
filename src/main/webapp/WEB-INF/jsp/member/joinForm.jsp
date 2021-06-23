<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
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
<script type="text/javascript">
	function fn_join(){
		alert("dddd");
		
		var formData = $("#frm").serialize().replace(/%/g,'%25');
		console.log(formData);
		
		
		
		
	}
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
				<form class="appointment__form" action="#" id="frm">
					<div class="text-center" >

						<!-- 1. 아이디 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">아이디 *</h5>
								&nbsp;
							</div>
							<div class="input-group" style="margin-bottom: 5px;">
								<input type="text" class="form-control" placeholder="ID" id="memberId" name="memberId"> 
									<span class="input-group-addon" style="border: 1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='pwdMod'" class="input-group-addon" 
									style="font-size: 1.0em; padding: 12.5px; margin-left: 5px;">중복 확인</button>
								</span>
							</div>
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지 출력창</h5>
							</div>
						</div>

						<br>
						<!-- 2. 비밀번호 입력 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">비밀번호 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Password" id="memberPwd" name="memberPwd" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>
						<br>

						<!-- 3. 비밀번호 확인 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">비밀번호 확인 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Password" id="confirmPwd" name="confirmPwd" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>
						
						<br>
						<!-- 4. 이름 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">이름 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Name" id="memberName" name="memberName" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>
						
						<br>
						<!-- 5. 닉네임 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">닉네임 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="Nickname" id="memberNickname" name="memberNickname" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>
						
						<br>
						<!-- 6. 핸드폰번호 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">핸드폰번호 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="숫자만 입력해주세요" id="memberMobile" name="memberMobile" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>

						<br>
						<!-- 7. 성별 선택 -->
						<div class="col-lg-6 text-center mypage_myinfo"
							style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">성별 *</h5>
								&nbsp;
							</div>
							<div class="join_gender" >
								<input type="radio" name="memberGender" id="male" value="남자" autocomplete="off" style="opacity: 0;margin-bottom: 5px;"> 
								<label for="male" style="float: left;margin-bottom: 5px;">남자</label> 
								<input type="radio" name="memberGender" id="female" value="여자" autocomplete="off" style="opacity: 0;margin-bottom: 5px;"> 
								<label for="female" style="float: left;margin-bottom: 5px;">여자</label>
							</div>
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>

						<br><br><br>
						<!-- 8. 키 입력 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">키</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="" id="memberHeight" name="memberHeight" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>

						<br>
						<!-- 9. 몸무게 입력 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">몸무게</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="" id="memberWeight" name="memberWeight" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>

						<br>
						<!-- 10. 이메일 & 이메일 인증 버튼 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">이메일 *</h5>
								&nbsp;
							</div>
							<div class="input-group" style="margin-bottom: 5px;">
								<input type="text" class="form-control" placeholder="Email" id="memberEmail" name="memberEmail"> 
									<span class="input-group-addon"
									style="border: 1px solid #5768AD; border-radius: 4px;">
									<button type="button" onclick="location.href='pwdMod'" class="input-group-addon"
										style="font-size: 1.0em; padding: 12.5px; margin-left: 5px;">인증번호전송</button>
								</span>
							</div>
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>

						<br>
						<!-- 11. 이메일인증번호 입력칸 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<div style="margin-bottom: 2px;">
								<h5 style="display: inline; float: left; color: white;">이메일 인증번호 *</h5>
								&nbsp;
							</div>
							<input type="text" placeholder="인증번호" style="margin-bottom: 5px;">
							<div style="margin-bottom: 15px;">
								<h5 style="display: inline; float: left; color: orange;">경고메세지</h5>
							</div>
						</div>
						<br>
						
						
						
						<!-- 끝! 회원가입 버튼 -->
						<div class="col-lg-6 text-center" style="margin-right: auto; max-width: 100%; width: 500px; margin-left: auto;">
							<input type="button" value="회원가입" id="submitBtn" style="font-size: 1.1em;" onclick="fn_join()"><br>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Appoinment Section End -->


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