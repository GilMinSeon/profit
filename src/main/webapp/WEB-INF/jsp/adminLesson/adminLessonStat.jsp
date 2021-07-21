<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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

.link {
	color: black;
}
​
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
	$("input:radio[id='day']").prop("checked", true);  
	$("#dayChart").show();
	$("#weekChart").hide();
	$("#monthChart").hide();
	
	$("input:radio[id='buy']").prop("checked", true);  
	$("#buyChart").show();
	$("#categoryChart").hide();
	$("#newChart").hide();
	
	$("input:radio[id='bookmark']").prop("checked", true);  
	$("#bookmarkChart").show();
	$("#lessonChart").hide();
	$("#viewChart").hide();
	
	var context = document
    .getElementById('myChart')
    .getContext('2d');
var myChart = new Chart(context, {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
        	"${lessonPopularDays['cal7']}",
            "${lessonPopularDays['cal6']}",
            "${lessonPopularDays['cal5']}",
            "${lessonPopularDays['cal4']}",
            "${lessonPopularDays['cal3']}",
            "${lessonPopularDays['cal2']}",
            "${lessonPopularDays['cal1']}"
        ],
        
        datasets: [  { //데이터
                label: '전체 회원', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    ${lessonPopularDays[0]['cal1']},
                    ${lessonPopularDays[1]['cal1']},
                    ${lessonPopularDays[2]['cal1']},
                    ${lessonPopularDays[3]['cal1']},
                    ${lessonPopularDays[4]['cal1']},
                    ${lessonPopularDays[5]['cal1']},
                    ${lessonPopularDays[6]['cal1']}
               	 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                	'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 152, 0, 0.2)',
                    'rgba(75, 176, 80, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                	'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 152, 0, 1)',
                    'rgba(75, 176, 80, 1)'
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
var myChart2 = new Chart(context, {
type: 'line', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "4주전",
       "3주전",
       "2주전",
       "1주전",
       "이번주",
    ],
    datasets: [
        { //데이터
            label: '여자 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${lessonPriceWeeksF['f5']},
                ${lessonPriceWeeksF['f4']},
                ${lessonPriceWeeksF['f3']},
                ${lessonPriceWeeksF['f2']},
                ${lessonPriceWeeksF['f1']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } ,
        { //데이터
            label: '남자 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                ${lessonPriceWeeksM['m5']},
                ${lessonPriceWeeksM['m4']},
                ${lessonPriceWeeksM['m3']},
                ${lessonPriceWeeksM['m2']},
                ${lessonPriceWeeksM['m1']}
           	 //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(102, 204, 255, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(102, 204, 255, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } ,
        { //데이터
            label: '전체 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                ${lessonPriceWeeks['week5']},
                ${lessonPriceWeeks['week4']},
                ${lessonPriceWeeks['week3']},
                ${lessonPriceWeeks['week2']},
                ${lessonPriceWeeks['week1']}
           	 //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(101, 199, 105, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(101, 199, 105, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
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
.getElementById('myChart3')
.getContext('2d');
var myChart3 = new Chart(context, {
type: 'line', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       ${lessonPriceMonths['cal5']},
       ${lessonPriceMonths['cal4']},
       ${lessonPriceMonths['cal3']},
       ${lessonPriceMonths['cal2']},
       ${lessonPriceMonths['cal1']},
    ],
    datasets: [
        { //데이터
            label: '여자 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${lessonPriceMonthsF['f5']},
                ${lessonPriceMonthsF['f4']},
                ${lessonPriceMonthsF['f3']},
                ${lessonPriceMonthsF['f2']},
                ${lessonPriceMonthsF['f1']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } ,
        { //데이터
            label: '남자 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                ${lessonPriceMonthsM['m5']},
                ${lessonPriceMonthsM['m4']},
                ${lessonPriceMonthsM['m3']},
                ${lessonPriceMonthsM['m2']},
                ${lessonPriceMonthsM['m1']}
           	 //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(102, 204, 255, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(102, 204, 255, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } ,
        { //데이터
            label: '전체 회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                ${lessonPriceMonths['month5']},
                ${lessonPriceMonths['month4']},
                ${lessonPriceMonths['month3']},
                ${lessonPriceMonths['month2']},
                ${lessonPriceMonths['month1']}
           	 //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(101, 199, 105, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(101, 199, 105, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
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
.getElementById('myChart4')
.getContext('2d');
var myChart4 = new Chart(context, {
type: 'bar', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${buyTop5[0]['lessonTitle']}",
       "${buyTop5[1]['lessonTitle']}",
       "${buyTop5[2]['lessonTitle']}",
       "${buyTop5[3]['lessonTitle']}",
       "${buyTop5[4]['lessonTitle']}"
    ],
    datasets: [
        { //데이터
            label: "1위", //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${buyTop5[0]['cnt']},
            	${buyTop5[1]['cnt']},
            	${buyTop5[2]['cnt']},
            	${buyTop5[3]['cnt']},
            	${buyTop5[4]['cnt']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
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
.getElementById('myChart5')
.getContext('2d');
var myChart5 = new Chart(context, {
type: 'pie', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "헬스",
       "요가",
       "필라테스",
       "맨몸운동",
    ],
    datasets: [
        { //데이터
            label: "1위", //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${newRegister['헬스']},
            	${newRegister['요가']},
            	${newRegister['필라테스']},
            	${newRegister['맨몸운동']},
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } 
        
    ]
},
options: {
	responsive: false,
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
.getElementById('myChart6')
.getContext('2d');
var myChart6 = new Chart(context, {
type: 'line', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${newRegisterCount['day5']}",
       "${newRegisterCount['day4']}",
       "${newRegisterCount['day3']}",
       "${newRegisterCount['day2']}",
       "${newRegisterCount['day1']}",
    ],
    datasets: [
        { //데이터
            label: '신규 강좌 수', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${newRegisterCount['cnt5']},
                ${newRegisterCount['cnt4']},
                ${newRegisterCount['cnt3']},
                ${newRegisterCount['cnt2']},
                ${newRegisterCount['cnt1']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
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
.getElementById('myChart7')
.getContext('2d');
var myChart7 = new Chart(context, {
type: 'doughnut', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${bookmarkRank[0]['lessonTitle']}",
       "${bookmarkRank[1]['lessonTitle']}",
       "${bookmarkRank[2]['lessonTitle']}",
       "${bookmarkRank[3]['lessonTitle']}",
       "${bookmarkRank[4]['lessonTitle']}"
    ],
    datasets: [
        { //데이터
            label: '신규 강좌 수', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${bookmarkRank[0]['cnt']},
            	${bookmarkRank[1]['cnt']},
            	${bookmarkRank[2]['cnt']},
            	${bookmarkRank[3]['cnt']},
            	${bookmarkRank[4]['cnt']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } 
    ]
},
options: {
	responsive: false,
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
.getElementById('myChart8')
.getContext('2d');
var myChart8 = new Chart(context, {
type: 'doughnut', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${goodRank[0]['lessonTitle']}",
       "${goodRank[1]['lessonTitle']}",
       "${goodRank[2]['lessonTitle']}",
       "${goodRank[3]['lessonTitle']}",
       "${goodRank[4]['lessonTitle']}"
    ],
    datasets: [
        { //데이터
            label: '좋아요', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${goodRank[0]['cnt']},
            	${goodRank[1]['cnt']},
            	${goodRank[2]['cnt']},
            	${goodRank[3]['cnt']},
            	${goodRank[4]['cnt']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } 
    ]
},
options: {
	responsive: false,
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
.getElementById('myChart9')
.getContext('2d');
var myChart9 = new Chart(context, {
type: 'doughnut', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${viewRank[0]['lessonTitle']}",
       "${viewRank[1]['lessonTitle']}",
       "${viewRank[2]['lessonTitle']}",
       "${viewRank[3]['lessonTitle']}",
       "${viewRank[4]['lessonTitle']}"
    ],
    datasets: [
        { //데이터
            label: "조회순", //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${viewRank[0]['lessonHit']},
            	${viewRank[1]['lessonHit']},
            	${viewRank[2]['lessonHit']},
            	${viewRank[3]['lessonHit']},
            	${viewRank[4]['lessonHit']}
                //x축 label에 대응되는 데이터 값
            ],
            backgroundColor: [
                //색상
            	'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                //경계선 색상
            	'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } 
        
    ]
},
options: {
	responsive: false,
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

function fn_show4(){
	
	$("#newChart").hide();
	$("#categoryChart").hide();
	$("#buyChart").show();
}

function fn_show5(){
	
	$("#newChart").hide();
	$("#categoryChart").show();
	$("#buyChart").hide();
}

function fn_show6(){
	$("#newChart").show();
	$("#categoryChart").hide();
	$("#buyChart").hide();
}

function fn_show7(){
	$("#bookmarkChart").show();
	$("#lessonChart").hide();
	$("#viewChart").hide();
}

function fn_show8(){
	$("#bookmarkChart").hide();
	$("#lessonChart").show();
	$("#viewChart").hide();
}

function fn_show9(){
	$("#bookmarkChart").hide();
	$("#lessonChart").hide();
	$("#viewChart").show();
}



</script>


</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/hero/hero-11.jpg"
		style="padding-bottom: 0px; padding-top: 70px;"></section>
	<!-- Breadcrumb End -->


	<!-- 본문 시작 -->
	<section class="classes spad"
		style="visibility: visible; animation-name: fadeIn;">

		<div class="container">
			<h3 style="text-align: center; cursor: pointer;"
				onclick="location.href='trainerPermitList.do'">온라인클래스 강좌 통계</h3>
			<br>
			<div class="row" style="margin-bottom: 30px; margin-top: 30px;">

			</div>


			<!-- 1 -->
			<div class="classes__filter"
				style="margin-bottom: 0px; padding-bottom: 0px">
				<br>
				<div class="row">
					<span
						style="font-weight: bold; font-size: 1.1em; padding-left: 30px;">*
						 온라인클래스 인기강좌 현황 </span><br>
					<br>
					<div class="r_gender">

						<div class="col-lg-12" style="margin-left: 25px">
							<input type="radio" name="static" id="day" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show1()"
								checked> <label for="day"
								style="border: 1px solid; float: left; width: 30%;">최근
								7일</label> <input type="radio" name="static" id="week" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show2()">
							<label for="week" style="border: 1px solid; width: 30%;">주별</label>
							<input type="radio" name="static" id="month" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show3()">
							<label for="month" style="border: 1px solid; width: 30%;">월별</label>
						</div>
						<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
							<div id="dayChart">
								<canvas id="myChart"></canvas>
							</div>
							<div id="weekChart">
								<canvas id="myChart2"></canvas>
							</div>
							<div id="monthChart">
								<canvas id="myChart3"></canvas>
							</div>
						</div>



					</div>
				</div>
			</div>


			<!-- 2 -->
			<div class="classes__filter"
				style="margin-bottom: 0px; padding-bottom: 0px">
				<br>
				<div class="row">
					<span
						style="font-weight: bold; font-size: 1.1em; padding-left: 30px;">*
						신규 강좌(최근 일주일) </span><br>
					<br>
					<div class="r_gender">

						<div class="col-lg-12" style="margin-left: 25px">
							<input type="radio" name="static1" id="buy" value=""
								autocomplete="off" style="opacity: 0;" checked
								onclick="fn_show4()"> <label for="buy"
								style="border: 1px solid; float: left; width: 30%;">신규강좌
								구매 TOP5</label> <input type="radio" name="static1" id="category"
								value="" autocomplete="off" style="opacity: 0;"
								onclick="fn_show5()"> <label for="category"
								style="border: 1px solid; width: 30%;">카테고리별 신규 강좌 등록
								비율</label> <input type="radio" name="static1" id="new" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show6()">
							<label for="new" style="border: 1px solid; width: 30%;">신규강좌
								등록수</label>
						</div>
						<div style="width: 900px; height: 550px;">
							<div id="buyChart">
								<canvas id="myChart4"></canvas>
							</div>
							<div id="categoryChart" style="text-align: center;">
								<canvas id="myChart5" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
							<div id="newChart">
								<canvas id="myChart6"></canvas>
							</div>
						</div>



					</div>
				</div>
			</div>



			<!-- 3 -->
			<div class="classes__filter"
				style="margin-bottom: 0px; padding-bottom: 0px">
				<br>
				<div class="row">
					<span
						style="font-weight: bold; font-size: 1.1em; padding-left: 30px;">*
						누적 조회</span><br>
					<br>
					<div class="r_gender">

						<div class="col-lg-12" style="margin-left: 25px">
							<input type="radio" name="static2" id="bookmark" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show7()"
								checked> <label for="bookmark"
								style="border: 1px solid; float: left; width: 30%;">북마크 순위</label> <input type="radio" name="static2" id="lesson" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show8()">
							<label for="lesson" style="border: 1px solid; width: 30%;">좋아요 순위</label>
							<input type="radio" name="static2" id="trainer" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show9()">
							<label for="trainer" style="border: 1px solid; width: 30%;">조회수 순위</label>
						</div>
						<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
							<div id="bookmarkChart">
								<canvas id="myChart7" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
							<div id="lessonChart">
								<canvas id="myChart8" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
							<div id="viewChart">
								<canvas id="myChart9" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
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