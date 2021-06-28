<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bulletin_write</title>
<script>
var uploadPath = "Y:/profit/";
$(document).ready(function(){
	$('#minus1').click(function(e){
		e.preventDefault();
		var stat = $('#count1').val();
		var num = parseInt(stat,10);
		num -=5;
		if(num<0){
		alert('더이상 줄일수 없습니다.');
		num =0;
		}
		$('#count1').val(num);
		});
		$('#plus1').click(function(e){
		e.preventDefault();
		var stat = $('#count1').val();
		var num = parseInt(stat,10);
		num +=5;
	
		if(num>=100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count1').val(num);
	});
	
	$('#minus2').click(function(e){
		e.preventDefault();
		var stat = $('#count2').val();
		var num = parseInt(stat,10);
		num -=5;
		if(num<0){
		alert('더이상 줄일수 없습니다.');
		num =0;
		}
		$('#count2').val(num);
		});
		$('#plus2').click(function(e){
		e.preventDefault();
		var stat = $('#count2').val();
		var num = parseInt(stat,10);
		num +=5;

		if(num>=100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count2').val(num);
	});
		
	$('#minus3').click(function(e){
		e.preventDefault();
		var stat = $('#count3').val();
		var num = parseInt(stat,10);
		num -=5;
		if(num<0){
		alert('더이상 줄일수 없습니다.');
		num =0;
		}
		$('#count3').val(num);
		});
		$('#plus3').click(function(e){
		e.preventDefault();
		var stat = $('#count3').val();
		var num = parseInt(stat,10);
		num +=5;

		if(num>=100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count3').val(num);
	});
		
	$('#minus4').click(function(e){
		e.preventDefault();
		var stat = $('#count4').val();
		var num = parseInt(stat,10);
		num -=5;
		if(num<0){
		alert('더이상 줄일수 없습니다.');
		num =0;
		}
		$('#count4').val(num);
		});
		$('#plus4').click(function(e){
		e.preventDefault();
		var stat = $('#count4').val();
		var num = parseInt(stat,10);
		num +=5;

		if(num>=100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count4').val(num);
	});
		
		
		
	$("#exe_btn").hide();
  	var fileTarget = $('#file'); 
  	fileTarget.on('change', function(){ // 값이 변경되면
     	var cur=$(".filebox input[type='file']").val();
  	
     	var curSplit  = cur.split("\\");    //   "\" 로 전체 url 을 나눈다
     	var nameLength = curSplit.length;
     	var fileName         = curSplit[nameLength-1];   // 나누어진 배열의 맨 끝이 파일명이다

    	$(".upload-name").val(fileName);
  	}); 
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#preview_img').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
    $("#exe_btn").show();
}

function guid() {
	  function _s4() {
	    return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	  }
	  return _s4() + _s4() + '-' + _s4() + '-' + _s4() + '-' + _s4() + '-' + _s4() + _s4() + _s4();
}


function fn_lessonAdd(){
	var lessonTitle = $("#lessonTitle").val();
	var lessonCategorySeq = $("input:radio[name=cate_type]:checked").val();
	var lessonTitleComment = $("#lessonTitleComment").val();
	var lessonBalance = $("#count1").val();
	var lessonFlex = $("#count2").val();
	var lessonStrong = $("#count3").val();
	var lessonCore = $("#count4").val();
	var lessonIntro = $("#lessonIntro").val();
	var lessonPrice = $("#lessonPrice").val();
	var lessonMonth = $("#lessonMonth").val();
	var filePath=$(".filebox input[type='file']").val();	//C:\fakepath\bookmark_full.PNG
	//전체경로를 \ 나눔.
// 	var filePathSplit = filePath_temp.split('\\'); 
// 	//전체경로를 \로 나눈 길이.
// 	var filePathLength = filePathSplit.length;
// 	var fileRealName = filePathSplit[2];
// 	var filePath= uploadPath + fileRealName;
// 	var fileSaveName = guid() + "_" + fileRealName;
	
	console.log(lessonTitle);
	console.log(lessonCategorySeq);
	console.log(lessonTitleComment);
	console.log(lessonBalance);
	console.log(lessonFlex);
	console.log(lessonStrong);
	console.log(lessonCore);
	console.log(lessonIntro);
	console.log(lessonPrice);
	console.log(lessonMonth);
	console.log(filePath);
	
	var chk_radio = document.getElementsByName('cate_type');
	var sel_type = null;
	for(var i=0;i<chk_radio.length;i++){
		if(chk_radio[i].checked == true){ 
			sel_type = chk_radio[i].value;
		}
	}

	if(sel_type == null){
        alert("카테고리를 선택하세요."); 
		return;
	}

	
	if(lessonTitle==""){
		alert("제목을 입력해주세요.");
		$("#lessonTitle").focus();
		return;
	}
	
	if(lessonTitleComment==""){
		alert("강의소개를 입력해주세요.");
		$("#lessonTitleComment").focus();
		return;
	}
	
	if(lessonMonth==""){
		alert("강의일수를 입력해주세요.");
		$("#lessonMonth").focus();
		return;
	}
	
	
	if(lessonIntro==""){
		alert("강의소개를 입력해주세요.");
		$("#lessonIntro").focus();
		return;
	}	
	
	
	if(lessonPrice==""){
		alert("강의 가격을 입력해주세요.");
		$("#lessonPrice").focus();
		return;
	}
	
	var price_reg = /^[0-9]*$/;
	if (!price_reg.test(lessonPrice)) {
		alert("가격은 (특수기호없이)숫자만 입력해주세요. \n ex) 300000");
		$("#lessonPrice").focus();
		return false;
	}
	
	var month_reg = /^(0[1-9]|1[012])$/;
	if (!month_reg.test(lessonMonth)) {
		alert("수강기간은 1월부터 12월까지의 숫자만 가능합니다. \n ex) 01, 02, 03 ... 12");
		$("#lessonMonth").focus();
		return false;
	}
	
	var fileCheck = document.getElementById("file").value;
    if(!fileCheck){
        alert("파일을 첨부해 주세요");
        return false;
    }
	
	var param = "";
	param += "dummy=" + Math.random();
	param += "&lessonTitle="+lessonTitle;
	param += "&lessonCategorySeq="+lessonCategorySeq;
	param += "&lessonTitleComment="+lessonTitleComment;
	param += "&lessonBalance="+lessonBalance;
	param += "&lessonFlex="+lessonFlex;
	param += "&lessonStrong="+lessonStrong;
	param += "&lessonCore="+lessonCore;
	param += "&lessonIntro="+lessonIntro;
	param += "&lessonPrice="+lessonPrice;
	param += "&lessonMonth="+lessonMonth;
	param += "&filePath="+filePath;

	console.log(param)
	$.ajax({
		url : "lesson_insAjax.do",
		data : param,
		dataType : "text",
		type : "post",
		async: false,
		statusCode : {
			404 : function() {
				alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
			}
		},
		success : function(data) {
			console.log(data);
			if(data =="ok"){
				alert("강의가 정상적으로 추가되었습니다.")
				location.href="lessonList.do"
			}else{
				alert("추가도중 문제가 생겼습니다. 다시 시도해 주세요");
				return;
			}
		},
	});
	
}

</script>
<style>
.site-btn_s{
font-size: 14px;
	color: #5768AD;
	font-weight: 700;
	text-transform: uppercase;
	display: inline-block;
	padding: 14px 50px;
	background: #ffffff;
	border: none;
	letter-spacing: 2px;
	border-radius: 2px;
	cursor: pointer;
}
.site-btn_s:hover{
background: #ffffff;
	border: 1px solid #5768AD;
	color: #5768AD;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg" style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>강의 등록</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<div class="container">
		<section class="classes spad">
			<div>
				<h3 style="padding-left: 15px; color: #263246; font-family: DM Sans, sans-serif; font-weight: 400;">강의를 등록해주세요 </h3>
			</div>
			<br />
			<br />
			<main role="main" class="container">
				<form name="form" method="post" action="lessonAdd" style="text-align: center;"  enctype="multipart/form-data">
					<div class="write-title">
						<label>
							<p>
								카테고리 선택
								<span style="color: red;"> *</span>
							</p>
						</label>
						<div class="c_radio">
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="gym" value="1" autocomplete="off" style="opacity: 0;">
								<label for="gym">헬스</label>
								<input type="radio" name="cate_type" id="yoga" value="2" autocomplete="off" style="opacity: 0">
								<label for="yoga">요가</label>
							</div>
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="filates" value="3" autocomplete="off" style="opacity: 0">
								<label for="filates">필라테스</label>
								<input type="radio" name="cate_type" id="exercise" value="4" autocomplete="off" style="opacity: 0">
								<label for="exercise">맨몸운동</label>
							</div>
						</div>
					</div>
					<p>
						<div class="form-group">
							<label for="lessonPrice" style="float:left;">제목 : </label>
						    <input type="text" class="form-control" id="lessonTitle" name="lessonTitle" placeholder="ex)1강 전신스트레칭">
						</div>
					</p>
					<p>	
						<div class="form-group">
							<label for="lessonPrice" style="float:left;">강의코멘트(부제목) : </label>
						    <input type="text" class="form-control" id="lessonTitleComment" name="lessonTitleComment" placeholder="ex)운동시작전 몸을 풀기위한 스트레칭 강의입니다...">
						</div>
					</p>
					
					<p>	
						<div class="form-group">
							<label for="lessonPrice" style="float:left;">강의기간 : </label>
						    <input type="text" class="form-control" id="lessonMonth" name="lessonMonth" placeholder="ex)01">
						</div>
					</p>
					
					<p>
						<div style="display: flex; width: auto;">
							<div style="display: inline-block;flex:1;margin-right:5px; float:left;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943;">Balance</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus1">-</span>
	                                <input type="number" class="count" id="count1" name="lessonBalance" name="qty" value="0">
	                                <span class="plus bg-dark" id="plus1">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;margin-right:5px; float:left;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943;">Flex</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus2">-</span>
	                                <input type="number" class="count" id="count2" name="lessonFlex" name="qty" value="0">
	                                <span class="plus bg-dark" id="plus2">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;margin-right:5px; float:left;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943;">Strong</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus3">-</span>
	                                <input type="number" class="count" id="count3" name="lessonStrong" name="qty" value="0">
	                                <span class="plus bg-dark" id="plus3">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;float:right;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943">Core</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus4">-</span>
	                                <input type="number" class="count" id="count4" name="lessonCore" name="qty" value="0">
	                                <span class="plus bg-dark" id="plus4">+</span>
	                            </div>
							</div>
						
						</div>
						</p>
						
						<p>
							<label for="lessonPrice" style="float:left;">강의소개 : </label>
							<textarea class="form-control" rows="9" id="lessonIntro" name="lessonIntro" placeholder="ex)우리의 클래스를 시작하기전에 몸을 제대로 풀고 시작해봅니다....."></textarea>
						</p>
						
						<p>
							<div class="form-group">
								<label for="lessonPrice" style="float:left;">강의가격 : </label>
							    <input type="text" class="form-control" id="lessonPrice" name="lessonPrice"  placeholder="ex)530000">
							</div>
						</p>
						
						<p>
							<div class="filebox" style="text-align: left;margin-top: 30px;"> 
							  <label for="file">파일첨부</label> 
							  <input type="file" id="file" onchange="readURL(this);"> 
							  <input class="upload-name" value="첨부파일이 없습니다." readonly="readonly">
							</div>
							<div class="ai-thumnail-wrapper" style="width: 100%; height: autox;">
						        <div class="img_wrap ai-thumbnail" style="text-align: center;">
						            <img id="preview_img" />
						        </div>
						    </div>
						</p>
						
					<br />
					</form>
					<div style="text-align: right;">
                             <button type="submit" id="hover_btn"  class="site-btn_s" onclick="fn_lessonAdd()">등록</button>
                    </div>
					
			</main>
		</section>
	</div>
</body>
</html>
