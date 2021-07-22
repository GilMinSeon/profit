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
	$("#trainerChart").hide();
	
	var context = document
    .getElementById('myChart')
    .getContext('2d');
var myChart = new Chart(context, {
    type: 'line', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
           '${lessonPriceDays['cal7']}',
           '${lessonPriceDays['cal6']}',
           '${lessonPriceDays['cal5']}',
           '${lessonPriceDays['cal4']}',
           '${lessonPriceDays['cal3']}',
           '${lessonPriceDays['cal2']}',
           '${lessonPriceDays['cal1']}'
        ],
        datasets: [
            { //데이터
                label: '여자 회원', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    
                	${lessonPriceDaysF['f7']},
                    ${lessonPriceDaysF['f6']},
                    ${lessonPriceDaysF['f5']},
                    ${lessonPriceDaysF['f4']},
                    ${lessonPriceDaysF['f3']},
                    ${lessonPriceDaysF['f2']},
                    ${lessonPriceDaysF['f1']}
                    //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1 //경계선 굵기
            } ,
            { //데이터
                label: '남자 회원', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    ${lessonPriceDaysM['m7']},
                    ${lessonPriceDaysM['m6']},
                    ${lessonPriceDaysM['m5']},
                    ${lessonPriceDaysM['m4']},
                    ${lessonPriceDaysM['m3']},
                    ${lessonPriceDaysM['m2']},
                    ${lessonPriceDaysM['m1']}
               	 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(102, 204, 255, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(102, 204, 255, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1 //경계선 굵기
            } ,
            { //데이터
                label: '전체 회원', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    ${lessonPriceDays['day7']},
                    ${lessonPriceDays['day6']},
                    ${lessonPriceDays['day5']},
                    ${lessonPriceDays['day4']},
                    ${lessonPriceDays['day3']},
                    ${lessonPriceDays['day2']},
                    ${lessonPriceDays['day1']},
               	 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(101, 199, 105, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(101, 199, 105, 1)',
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
type: 'bar', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
       "${lessonRank[0]['lessonTitle']}",
       "${lessonRank[1]['lessonTitle']}",
       "${lessonRank[2]['lessonTitle']}",
       "${lessonRank[3]['lessonTitle']}",
       "${lessonRank[4]['lessonTitle']}",
       "${lessonRank[5]['lessonTitle']}",
       "${lessonRank[6]['lessonTitle']}",
       "${lessonRank[7]['lessonTitle']}",
       "${lessonRank[8]['lessonTitle']}",
       "${lessonRank[9]['lessonTitle']}"
    ],
    datasets: [
        { //데이터
            label: "1위", //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                
            	${lessonRank[0]['cnt']},
            	${lessonRank[1]['cnt']},
            	${lessonRank[2]['cnt']},
            	${lessonRank[3]['cnt']},
            	${lessonRank[4]['cnt']},
            	${lessonRank[5]['cnt']},
            	${lessonRank[6]['cnt']},
            	${lessonRank[7]['cnt']},
            	${lessonRank[8]['cnt']},
            	${lessonRank[9]['cnt']}
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
                'rgba(75, 176, 80, 0.2)',
                'rgba(244, 67, 54, 0.2)',
                'rgba(0, 150, 136, 0.2)',
                'rgba(63, 81, 181, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 152, 0, 1)',
                'rgba(75, 176, 80, 1)',
                'rgba(244, 67, 54, 1)',
                'rgba(0, 150, 136, 1)',
                'rgba(63, 81, 181, 1)'
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
	$("#trainerChart").hide();
}

function fn_show8(){
	$("#bookmarkChart").hide();
	$("#lessonChart").show();
	$("#trainerChart").hide();
}

function fn_show9(){
	$("#bookmarkChart").hide();
	$("#lessonChart").hide();
	$("#trainerChart").show();
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
				onclick="location.href='trainerPermitList.do'">1:1 상담 통계</h3>
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
						전체 채팅 건수 </span><br>
					<br>
					<div class="r_gender">

						<div class="col-lg-12" style="margin-left: 25px">
							<input type="radio" name="static" id="day" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show1()"
								checked> <label for="day"
								style="border: 1px solid; float: left; width: 30%;">최근
								7일</label> <input type="radio" name="static" id="week" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show2()">
							<label for="week" style="border: 1px solid; width: 30%;">최근 한달</label>
							<input type="radio" name="static" id="month" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show3()">
							<label for="month" style="border: 1px solid; width: 30%;">최근 6개월</label>
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
							<label for="lesson" style="border: 1px solid; width: 30%;">좋아요순위</label>
							<input type="radio" name="static2" id="trainer" value=""
								autocomplete="off" style="opacity: 0;" onclick="fn_show9()">
							<label for="trainer" style="border: 1px solid; width: 30%;">인기강좌</label>
						</div>
						<div style="width: 900px; height: 550px;">
							<!--차트가 그려질 부분-->
							<div id="bookmarkChart">
								<canvas id="myChart7" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
							<div id="lessonChart">
								<canvas id="myChart8" style="height:500px; width:500px;margin-left:210px;"></canvas>
							</div>
							<div id="trainerChart">
								<canvas id="myChart9"></canvas>
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