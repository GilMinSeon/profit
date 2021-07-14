<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
table{
	width: 50%;
	margin: 0;
	margin-left: auto; 
	margin-right: auto;
}
td{
	padding: 10px;
}
th{
	background-color:#e2e0e0;
	padding: 10px;
}
table, th, td {
    border: 1px solid black;
    text-align: center;
}
p{
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
}
#title{
	font-size: 1.5em;
	color: black;
	text-align: center;
}
.total td{
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(function(){
		html2canvas($('#div0')[0],{
			allowTaint : true,
			   useCORS : true,
			   logging : false,
			   height : window.outerHeight + window.innerHeight,
			   windowHeight : window.outerHeight + window.innerHeight
		}).then(function(canvas){
			var imgData = canvas.toDataURL('image/png');
		   	var imgWidth = 210;
		   	var pageHeight = imgWidth * 1.414;
		   	var imgHeight = canvas.height * imgWidth / canvas.width;
		   	var heightLeft = imgHeight;
		   	var doc = new jsPDF('p', 'mm');
		   	var position = 0;
		   	
		    doc.addImage(imgData, 'PNG' , 0, position, imgWidth, imgHeight);
		    heightLeft -= pageHeight;
		   
		    while (heightLeft >= 20){
			   position = heightLeft - imgHeight;
			   doc.addPage();
			   doc.addImage(imgData,'PNG', 0, position, imgWidth, imgHeight);
			   heightLeft -= pageHeight;
		   }
		    window.open(doc.output('bloburl'));
		});
});
</script>
</head>
 
<body>
<div id="div0">
<p id="title">정산내역서</p>
<p>1. 사업 기관 : PROFIT</p>
<p>2. 날짜 : 2021-07-14 ~ 2021-07-31</p>
<p>3. 통장내역</p>
<table>
<tr>
	<th>은행명</th>
	<th>계좌번호</th>
	<th>이름</th>
	<th>입금 금액</th>
	<th>비고</th>
</tr>

<tr>
	<td>신한은행</td>
	<td>010-030-091874</td>
	<td>김오기</td>
	<td>150000원</td>
	<td></td>
</tr>

</table>
<br>
<p>4. 정산내역</p>
<table>
	<tr>
		<th>지급처</th>
		<th>지급내용</th>
		<th>건수</th>
		<th>수익</th>
		<th>수수료</th>
		<th>총금액</th>
	</tr>
	<tr>
		<td>(주)프로핏</td>
		<td>1:1상담</td>
		<td>10건</td>
		<td>40000원</td>
		<td>8000원</td>
		<td>32000원</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="total">
		<td colspan="2">합계</td>
		<td>10건</td>
		<td>40000원</td>
		<td>8000원</td>
		<td>32000원</td>
	</tr>
</table>
</div>
</body>
</html>