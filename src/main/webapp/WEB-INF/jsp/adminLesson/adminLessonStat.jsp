<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
.counter-section i {
    display: block;
    margin: 0 0 10px
}

.counter-section span.counter {
    font-size: 40px;
    color: #000;
    line-height: 60px;
    display: block;
    font-family: "Oswald", sans-serif;
    letter-spacing: 2px
}

.counter-title {
    font-size: 16px;
    letter-spacing: 2px;
    text-transform: uppercase
}

.counter-icon {
    top: 25px;
    position: relative
}

.counter-style2 .counter-title {
    letter-spacing: 0.55px;
    float: left
}

.counter-style2 span.counter {
    letter-spacing: 0.55px;
    float: left;
    margin-right: 10px
}

.counter-style2 i {
    float: right;
    line-height: 26px;
    margin: 0 10px 0 0
}

.counter-subheadline span {
    float: right
}

.medium-icon {
    font-size: 40px !important;
    margin-bottom: 15px !important
}
.classes__filter form .class__filter__btn_re {
	padding-right: 125px;
}
.table tr:hover {
	background-color: #f8f6ff;
}
.ui-datepicker-calendar {
    display: none;
}   
.table td, .table th {
	vertical-align: middle;
} 
a:hover, a:focus {
    text-decoration: none;
    outline: none;
    color: #6d7ab0;
}
.link{
	color: black;
}​
</style>

<script type="text/javascript">

function fn_switch(ele){
	
	var msg = "ok";
	
	if(msg=="ok"){
		var save = confirm("해당강의의 상태를 바꾸시겠습니까?");
		if(save == true){
			
			vtr = $(ele).parents('tr');
			lessonSeq = $(vtr).find('.lessonSeq').val();
			lessonPrivateFlag = $(vtr).find('.lessonPrivateFlag').val();
			upUserId = $(vtr).find('.upUserId').val();
			console.log(lessonSeq)
			console.log(lessonPrivateFlag)
			console.log(upUserId);
			
			var param = "";
				param += "dummy=" + Math.random();
				param += "&lessonSeq=" + lessonSeq;
				param += "&lessonPrivateFlag=" + lessonPrivateFlag;
				param += "&upUserId=" + upUserId;
				
			console.log("param " + param);
				
			$.ajax({
				type : 'post',
				url : 'updTrainerLessonAjax.do',
				data : param,
				async:false,
				dataType:"text",
				success : function(data){
					if(data=="ok"){
						alert("수정이 정상적으로 완료되었습니다.");
						location.reload();
					}else if(data=="ng"){
						alert("수정에 실패하였습니다. 다시 시도해주세요");
						location.reload();
					}else if(data=="A"){
						alert("관리자가 해당 강의를 비활성화 하였습니다. 관리자에게 문의하세요.");
						location.reload();
					}
			    },
				error : function(error){
					alert("수정에 실패하였습니다. 다시 시도해 주세요.");
					location.reload();
					console.log(error);
					console.log(error.status);
				}
				
				
			}); //ajax
			
		}//if save 
		else{
			alert("수정이 취소되었습니다.");
			location.reload();
		}
	}  //if msg
	
 }//function

function fn_change(processSeq){
	if (confirm("신청서를 검토하시겠습니까?") == true){
		$.ajax({
			type : "POST",
			data : "processSeq=" + processSeq,
			url : "updateStatusBAjax.do",
			dataType : "text", 
			success : function(result) {
				if (result == "ok") {
					location.href="trainerPermitDetail.do?processSeq="+processSeq+" "
				} else {
					alert("문제가 발생하였습니다. 잠시 후 다시 시도해주세요")
				}
			},
			error : function() {
				alert("오류발생");
			}
		})
	} else{  
	    return;
	}
}


$(document).ready(function() {
	$("#maleChart").hide();
	$("#femaleChart").show();
	
	 var context = document
     .getElementById('myChart')
     .getContext('2d');
 var myChart = new Chart(context, {
     type: 'bar', // 차트의 형태
     data: { // 차트에 들어갈 데이터
         labels: [
             //x 축
            "${chartFemaleResult[0]['lessonTitle']}",
            "${chartFemaleResult[1]['lessonTitle']}",
            "${chartFemaleResult[2]['lessonTitle']}",
            "${chartFemaleResult[3]['lessonTitle']}",
            "${chartFemaleResult[4]['lessonTitle']}",
            "${chartFemaleResult[5]['lessonTitle']}"
         ],
         datasets: [
             { //데이터
                 label: '여자 회원', //차트 제목
                 fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                 data: [
                     ${chartFemaleResult[0]['cnt']},
                     ${chartFemaleResult[1]['cnt']},
                     ${chartFemaleResult[2]['cnt']},
                     ${chartFemaleResult[3]['cnt']},
                     ${chartFemaleResult[4]['cnt']},
                     ${chartFemaleResult[5]['cnt']}
                     //x축 label에 대응되는 데이터 값
                 ],
                 backgroundColor: [
                     //색상
                     'rgba(255, 99, 132, 0.2)',
                     'rgba(54, 162, 235, 0.2)',
                     'rgba(255, 206, 86, 0.2)',
                     'rgba(75, 192, 192, 0.2)',
                     'rgba(153, 102, 255, 0.2)',
                     'rgba(255, 159, 64, 0.2)'
                 ],
                 borderColor: [
                     //경계선 색상
                     'rgba(255, 99, 132, 1)',
                     'rgba(54, 162, 235, 1)',
                     'rgba(255, 206, 86, 1)',
                     'rgba(75, 192, 192, 1)',
                     'rgba(153, 102, 255, 1)',
                     'rgba(255, 159, 64, 1)'
                 ],
                 borderWidth: 1 //경계선 굵기
             }
            
         ]
     },
     options: {
         scales: {
             yAxes: [
                 {
                     ticks: {
                         beginAtZero: true
                     }
                 }
             ]
         }
     }
 });
 
 
 
 
 
 var context = document
 .getElementById('myChart2')
 .getContext('2d');
var myChart = new Chart(context, {
 type: 'bar', // 차트의 형태
 data: { // 차트에 들어갈 데이터
     labels: [
         //x 축
        "${chartMaleResult[0]['lessonTitle']}",
        "${chartMaleResult[1]['lessonTitle']}",
        "${chartMaleResult[2]['lessonTitle']}",
        "${chartMaleResult[3]['lessonTitle']}",
        "${chartMaleResult[4]['lessonTitle']}",
        "${chartMaleResult[5]['lessonTitle']}"
     ],
     datasets: [
         { //데이터
             label: '남자 회원', //차트 제목
             fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
             data: [
                 ${chartMaleResult[0]['cnt']},
                 ${chartMaleResult[1]['cnt']},
                 ${chartMaleResult[2]['cnt']},
                 ${chartMaleResult[3]['cnt']},
                 ${chartMaleResult[4]['cnt']},
                 ${chartMaleResult[5]['cnt']}
                 //x축 label에 대응되는 데이터 값
             ],
             backgroundColor: [
                 //색상
            	 'rgba(255, 99, 132, 0.2)',
                 'rgba(54, 162, 235, 0.2)',
                 'rgba(255, 206, 86, 0.2)',
                 'rgba(75, 192, 192, 0.2)',
                 'rgba(153, 102, 255, 0.2)',
                 'rgba(255, 159, 64, 0.2)'
             ],
             borderColor: [
                 //경계선 색상
            	 'rgba(255, 99, 132, 1)',
                 'rgba(54, 162, 235, 1)',
                 'rgba(255, 206, 86, 1)',
                 'rgba(75, 192, 192, 1)',
                 'rgba(153, 102, 255, 1)',
                 'rgba(255, 159, 64, 1)'
             ],
             borderWidth: 1 //경계선 굵기
         }
        
     ]
 },
 options: {
     scales: {
         yAxes: [
             {
                 ticks: {
                     beginAtZero: true
                 }
             }
         ]
     }
 }
});
});


function fn_show1(){
	$("#dayChart").show();
	$("#weekChart").hide();
	$("#monthChart").hide();
	
}

function fn_show2(){
	
	$("#weekChart").show();
	$("#dayChart").hide();
	$("#monthChart").hide();
}

function fn_show3(){
	
	$("#monthChart").show();
	$("#dayChart").hide();
	$("#weekChart").hide();
}



</script>


</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
	</section>
	<!-- Breadcrumb End -->
	
	
	<!-- 본문 시작 -->
	<section class="classes spad" style="visibility: visible; animation-name: fadeIn;">
		
		<div class="container">
			<h3 style="text-align: center; cursor: pointer;" onclick="location.href='trainerPermitList.do'" >온라인클래스 강좌 통계</h3>
			<br>
        	<div class="row" style="margin-bottom: 30px;margin-top: 30px;">
            
        	</div>

						
			<!-- 1 -->
		    <div class="classes__filter" style="margin-bottom: 0px;padding-bottom:0px">
			<br>
               <div class="row">
               	<span style="font-weight: bold; font-size: 1.1em;padding-left: 30px;">* 결제한 회원 수 </span><br><br>
                 <div class="r_gender">
                    
                   <div class="col-lg-12" style="margin-left: 25px">
	                   <input type="radio" name="static" id="day" value="" autocomplete="off" style="opacity: 0;" checked onclick="fn_show1()">
	                    <label for="day" style="border:1px solid;float:left;width:30%;">일별</label>
						<input type="radio" name="static" id="week" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show2()">
	                    <label for="week" style="border:1px solid;width:30%;" >주별</label>
	                    <input type="radio" name="static" id="month" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show3()">
	                    <label for="month" style="border:1px solid;width:30%;" >월별</label>
                 	</div>
                   		<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
						<div id="dayChart"><canvas id="myChart"></canvas></div>
						<div id="weekChart"><canvas id="myChart2"></canvas></div>
						<div id="monthChart"><canvas id="myChart3"></canvas></div>
						</div>
		
                   		
                   		
                   	</div>
               	</div>
            </div>
            
            
            <!-- 2 -->
		    <div class="classes__filter" style="margin-bottom: 0px;padding-bottom:0px">
			<br>
               <div class="row">
               	<span style="font-weight: bold; font-size: 1.1em;padding-left: 30px;">* 강좌 등록 수 </span><br><br>
                 <div class="r_gender">
                    
                   <div class="col-lg-12" style="margin-left: 25px">
                   		<input type="radio" name="static" id="day" value="" autocomplete="off" style="opacity: 0;" checked onclick="fn_show1()">
	                    <label for="day" style="border:1px solid;float:left;width:30%;">일별</label>
						<input type="radio" name="static" id="week" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show2()">
	                    <label for="week" style="border:1px solid;width:30%;" >주별</label>
	                    <input type="radio" name="static" id="month" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show3()">
	                    <label for="month" style="border:1px solid;width:30%;" >월별</label>
                   </div>
                   		<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
						<div id="maleChart"><canvas id="myChart"></canvas></div>
						<div id="femaleChart"><canvas id="myChart2"></canvas></div>
						</div>
		
                   		
                   		
                   	</div>
               	</div>
            </div>
            
            
            
            <!-- 3 -->
		    <div class="classes__filter" style="margin-bottom: 0px;padding-bottom:0px">
			<br>
               <div class="row">
               	<span style="font-weight: bold; font-size: 1.1em;padding-left: 30px;">* 인기강좌 </span><br><br>
                 <div class="r_gender">
                    
                   <div class="col-lg-12" style="margin-left: 25px">
                   		<input type="radio" name="static" id="day" value="" autocomplete="off" style="opacity: 0;" checked onclick="fn_show1()">
	                    <label for="day" style="border:1px solid;float:left;width:30%;">일별</label>
						<input type="radio" name="static" id="week" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show2()">
	                    <label for="week" style="border:1px solid;width:30%;" >주별</label>
	                    <input type="radio" name="static" id="month" value="" autocomplete="off" style="opacity: 0;" onclick="fn_show3()">
	                    <label for="month" style="border:1px solid;width:30%;" >월별</label>
                 </div>
                   		<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
						<div id="maleChart"><canvas id="myChart"></canvas></div>
						<div id="femaleChart"><canvas id="myChart2"></canvas></div>
						</div>
		
                   		
                   		
                   	</div>
               	</div>
            </div>
		    

		<!-- container div 끝 -->	
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