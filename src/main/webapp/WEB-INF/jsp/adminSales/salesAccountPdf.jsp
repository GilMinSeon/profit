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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript">
function fn_print(){
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
}
</script>
<style>
table{
	width: 90%;
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

</head>
<body>
	<!-- Breadcrumb Begin -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/hero/hero-11.jpg" style="padding-bottom: 0px; padding-top: 70px;">
	</section>
	<!-- Breadcrumb End -->
	
	
	<!-- ?????? ?????? -->
	<section class="classes spad" style="visibility: visible; animation-name: fadeIn;">
		
		<div class="container">
			<br>
		    <div class="classes__filter" style="margin-bottom: 0px;padding-bottom:0px">
			<br>
			<div class="classes__item__text" style="text-align: right;padding-top: 0;">
                 <a class="class-btn_w" onclick="fn_print()">PDF ??????</a>
                 <a href="adminSalesList.do" class="class-btn_w" >????????????</a>
   		 	</div>
               	<div id="div0">
<br>
<p id="title">${selDate}??? ???????????????</p>
<p>1. ?????? ?????? : PROFIT</p>
<p>2. ????????????</p>
<table>
<tr>
	<th>?????????</th>
	<th>????????????</th>
	<th>?????????</th>
	<th>?????? ??????</th>
	<th>??????</th>
</tr>

	<c:forEach var="result" items="${AccountList}" varStatus="status">
<tr>
	<td>????????????</td>
	<td>010-030-091874</td>
	<td>${result.memberName}</td>
	<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.realamount}" /> ???</td>
	<td></td>
</tr>
</c:forEach>
</table>
<br>
<p>3. ????????????</p>
<table>
	<tr>
		<th>?????????</th>
		<th>????????????</th>
		<th>??????</th>
		<th>??????</th>
		<th>?????????</th>
		<th>?????????</th>
		<th>?????????</th>
	</tr>
	<c:forEach var="result" items="${AccountList}" varStatus="status">
	<tr>
		<td>(???)?????????</td>
		<td>${result.gubun}</td>
		<td>${result.memberName}</td>
		<td>${result.cnt} ???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.sum}" /> ???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.fee}" />  ???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${result.realamount}" />  ???</td>
	</tr>
	</c:forEach>
	
	<tr class="total">
		<td colspan="3">??????</td>
		<td>${AccountSumList[0]['totalcnt']}???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${AccountSumList[0]['total']}" /> ???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${AccountSumList[0]['totalfee']}" /> ???</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${AccountSumList[0]['totalrealamount']}" /> ???</td>
	</tr>
</table>
<br><br><br>
</div>
            </div>
		<!-- container div ??? -->	
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