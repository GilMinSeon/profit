<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bulletin_write</title>
<script>
$(document).ready(function(){
	$('#minus1').click(function(e){
		e.preventDefault();
		var stat = $('#count1').val();
		var num = parseInt(stat,10);
		num--;
		console.log(stat);
		console.log(num);
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('#count1').val(num);
		});
		$('#plus1').click(function(e){
		e.preventDefault();
		var stat = $('#count1').val();
		var num = parseInt(stat,10);
		num++;
		console.log(stat);
		console.log(num);
	
		if(num>100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count1').val(num);
	});
	
	$('#minus2').click(function(e){
		e.preventDefault();
		var stat = $('#count2').val();
		var num = parseInt(stat,10);
		num--;
		console.log(stat);
		console.log(num);
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('#count2').val(num);
		});
		$('#plus2').click(function(e){
		e.preventDefault();
		var stat = $('#count2').val();
		var num = parseInt(stat,10);
		num++;
		console.log(stat);
		console.log(num);

		if(num>100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count2').val(num);
	});
		
	$('#minus3').click(function(e){
		e.preventDefault();
		var stat = $('#count3').val();
		var num = parseInt(stat,10);
		num--;
		console.log(stat);
		console.log(num);
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('#count3').val(num);
		});
		$('#plus3').click(function(e){
		e.preventDefault();
		var stat = $('#count3').val();
		var num = parseInt(stat,10);
		num++;
		console.log(stat);
		console.log(num);

		if(num>100){
		alert('더이상 늘릴수 없습니다.');
		num=100;
		}
		$('#count3').val(num);
	});
		
	$('#minus4').click(function(e){
		e.preventDefault();
		var stat = $('#count4').val();
		var num = parseInt(stat,10);
		num--;
		console.log(stat);
		console.log(num);
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('#count4').val(num);
		});
		$('#plus4').click(function(e){
		e.preventDefault();
		var stat = $('#count4').val();
		var num = parseInt(stat,10);
		num++;
		console.log(stat);
		console.log(num);

		if(num>100){
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

// function fn_lessonAdd(){
// 	var title = $("#lessonTitle").val();
// 	var category = $("#lessonCategorySeq").val();
// 	var title_comment = $("#lessonTitleComment").val();
// 	var balance = $("#lessonBalance").val();
// 	var flex = $("#lessonFlex").val();
// 	var strong = $("#lessonStrong").val();
// 	var core = $("#lessonCore").val();
// 	var intro = $("#lessonIntro").val();
// 	var price = $("#lessonPrice").val();
// 	var month = $("#lessonMonth").val();
	 
// 	if(title.trim()==""){
// 		alert("제목을 입력해주세요.");
// 		$("#lessonTitle").focus();
// 		return;
// 	}
	
// 	if(title_comment.trim()==""){
// 		alert("강의소개를 입력해주세요.");
// 		$("#lessonTitleComment").focus();
// 		return;
// 	}
	
	
// 	if(intro.trim()==""){
// 		alert("강의소개를 입력해주세요.");
// 		$("#lessonIntro").focus();
// 		return;
// 	}
	
// 	if(price.trim()==""){
// 		alert("강의소개를 입력해주세요.");
// 		$("#lessonPrice").focus();
// 		return;
// 	}
	
// 	if(month.trim()==""){
// 		alert("강의일수를 입력해주세요.");
// 		$("#lessonMonth").focus();
// 		return;
// 	}
	
// 	var param = "";
// 	param += "dummy=" + Math.random();
// 	param += "&store_name="+store_name;
// 	param += "&store_tel="+store_tel;
// 	param += "&store_code="+store_code;
	

// 	console.log(param)
// 	$.ajax({
// 		url : "store_ins.ajax",
// 		data : param,
// 		dataType : "json",
// 		type : "post",
// 		async: false,
// 		statusCode : {
// 			404 : function() {
// 				alert("네트워크가 불안정합니다. 다시 시도부탁드립니다.");
// 			}
// 		},
// 		success : function(data) {
// 			if(data.msg =="ok"){
// 				alert("업체가 정상적으로 추가되었습니다.")
// 				location.href="store_list"
// 			}else{
// 				alert("추가도중 문제가 생겼습니다");
// 			}
// 			console.log(data.msg);
// 		}
// 	});
	
// }

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
<body style="padding-top: 5rem;">
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
				<form name="form" method="get" action="/lessionList" style="text-align: center;">
					<div class="write-title">
						<label>
							<p>
								카테고리 선택
								<span style="color: red;"> *</span>
							</p>
						</label>
						<div class="c_radio">
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="exercise" value="exercise" autocomplete="off" style="opacity: 0;">
								<label for="exercise">헬스</label>
								<input type="radio" name="cate_type" id="food" value="food" autocomplete="off" style="opacity: 0">
								<label for="food">요가</label>
							</div>
							<div style="display: inline-block;">
								<input type="radio" name="cate_type" id="motive" value="motive" autocomplete="off" style="opacity: 0">
								<label for="motive">필라테스</label>
								<input type="radio" name="cate_type" id="habit" value="habit" autocomplete="off" style="opacity: 0">
								<label for="habit">맨몸운동</label>
							</div>
						</div>
					</div>
					<p>
						<div class="form-group">
						    <input type="text" class="form-control" id="lessonTitle" name="lessonTitle" placeholder="제목을 입력하세요">
						</div>
					</p>
					<p>	
						<div class="form-group">
						    <input type="text" class="form-control" id="lessonTitleComment" name="lessonTitleComment" placeholder="부제목(강의설명)을 입력하세요">
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
	                                <input type="number" class="count" id="count1" name="lessonBalance" name="qty" value="1">
	                                <span class="plus bg-dark" id="plus1">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;margin-right:5px; float:left;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943;">Flex</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus2">-</span>
	                                <input type="number" class="count" id="count2" name="lessonFlex" name="qty" value="1">
	                                <span class="plus bg-dark" id="plus2">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;margin-right:5px; float:left;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943;">Strong</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus3">-</span>
	                                <input type="number" class="count" id="count3" name="lessonStrong" name="qty" value="1">
	                                <span class="plus bg-dark" id="plus3">+</span>
	                            </div>
							</div>
							
							<div style="display: inline-block;flex:1;float:right;border:1px solid #D4D5D8; border-radius: 5px;height: 65px; background: white;">
								<div>
									<span style="color: #001943">Core</span>
								</div>
								<div class="qty mt-5">
									<span class="minus bg-dark" id="minus4">-</span>
	                                <input type="number" class="count" id="count4" name="lessonCore" name="qty" value="1">
	                                <span class="plus bg-dark" id="plus4">+</span>
	                            </div>
							</div>
						
						</div>
						</p>
						
						<p>
							<textarea class="form-control" rows="9" id="lessonIntro" name="lessonIntro" placeholder="강의 소개를 입력해주세요"></textarea>
						</p>
						
						<p>
							<div class="form-group">
							    <input type="text" class="form-control" id="lessonPrice" name="lessonPrice"  placeholder="강의가격을 입력해주세요">
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
