<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>

// var obj = document.getElementById("videoplay");
// obj.addEventListener('loadedmetadata', function() {
//     console.log(obj.duration);
// });
// $(document).ready(function(){
// 	var time = obj.duration;
// 	alert(time);
// })

function fn_delClass(){
	var params = location.search.substr(location.search.indexOf("?") + 1);
    var lessonDetailSeq = params.substr(params.indexOf("=")+1); 
    console.log(lessonDetailSeq);
    var flag_ok = confirm("강의를 삭제하시겠습니까?");
    if(flag_ok){
   		var param = "";
   		param += "dummy=" + Math.random();
   		param += "&lessonDetailSeq=" + lessonDetailSeq
   		console.log(param)

   		$.ajax({
   			url : "class_delAjax.do",
   			data : param,
   			dataType : "text",
   			async:false,
   			success : function(data) {
   				if(data == "ok"){
   					alert("삭제가 정상적으로 완료되었습니다.");	
   					location.href="lessonDetail.do?lessonSeq="+$("input:hidden[name=lessonSeq]").val();
   				} else{
   					alert("삭제에 실패하였습니다. 다시 한 번 시도해주세요")
   				}
   				console.log(data)
   			}
   		});
		
		
	}
}


// const videoContainer = document.getElementById('videoplay')
// function formatDate(seconds) {
// 	const secondsNumber = parseInt(seconds, 10)
// 	  let hours = Math.floor(secondsNumber / 3600)
// 	  let minutes = Math.floor((secondsNumber - hours * 3600) / 60)
// 	  let totalSeconds = secondsNumber - hours * 3600 - minutes * 60
	  
// 	  if (hours < 10) {
// 		    hours = `0${hours}`
// 		  }
// 		  if (minutes < 10) {
// 		    minutes = `0${minutes}`
// 		  }
// 		  if (totalSeconds < 10) {
// 		    totalSeconds = `0${totalSeconds}`
// 		  }
// 		  return `${hours}:${minutes}:${totalSeconds}`
// }
// async function setTotalTime() {
// 	  const duration = await getBlobDuration(videoPlayer.src)
// 	  setInterval(getCurrentTime, 1000)
// 	  totalTime.innerHTML = formatDate(duration)
// 	}


</script>

</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>강의 보기</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
				<!-- 여기부터 달라짐 -->
				<section class="classes spad">
					<div class="container">
						<h3>📽 강의시청</h3>
						<br>
						<input type="hidden" name="lessonSeq" value="${classResult.lessonSeq}">
						<table class="table table" style="text-align: center;">
							<tbody>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;width:30%;">강의명</th>
									<td>${classResult.lessonDetailTitle}</td>
								</tr>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;">상세 설명</th>
									<td><div style="width:60%;height: auto; text-align: left;margin:0 auto;">${classResult.lessonDetailContent}</div></td>
								</tr>
								<tr>
									<th scope="row" style="background-color: #E6E6E6;">강의 정보</th>
									<td>
										<div style="display: inline-block;"><span style="color: #666">수강가능일</span>&nbsp;&nbsp;<span>바로수강가능</span></div>&nbsp;&nbsp; | &nbsp;&nbsp;
										<div style="display: inline-block;"><span style="color: #666">재생시간</span>&nbsp;&nbsp;<span>20:30</span></div>&nbsp;&nbsp; | &nbsp;&nbsp;
										<div style="display: inline-block;"><span style="color: #666">등록일</span>&nbsp;&nbsp;<span>${classResult.inDate}</span></div>
									</td>
									
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<th scope="row" style="background-color: #E6E6E6;">재생시간</th> -->
<!-- 									<td>20:30</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<th scope="row" style="background-color: #E6E6E6;">등록일</th> -->
<%-- 									<td>${classResult.inDate}</td> --%>
<!-- 								</tr> -->
								
								<tr>
									<th scope="row" colspan="2">
										<video id="videoplay" controls  src="http://192.168.41.6:9999/upload/profit/${classResult.fileSaveName}" width="100%" ></video>
									</th>
								</tr>
							</tbody>
						</table>
						<div class="classes__item__text" style="text-align: right;">
							<a href="javascript:history.back();" class="class-btn">목록</a>
							<input type="button" onclick="fn_delClass()" class="class-btn" style="cursor:pointer;" value="삭제">
						</div>
					</div>
				</section>
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