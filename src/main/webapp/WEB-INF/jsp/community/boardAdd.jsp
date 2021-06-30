<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>bulletin_write</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="./resources/summernote/summernote-lite.js"></script>
  <script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
  
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script>

$(function(){
	
	$('.summernote').summernote({
		height: 600,
		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck : [ '맑은고딕' ],
		focus: true,

		callbacks: {
		onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	             sendFile(files[i], this);
	            }
	        }
		}

	});

})

function sendFile(file, el) {
var form_data = new FormData();
       form_data.append('file', file);
       $.ajax({
         data: form_data,
         type: "POST",
         url: 'profileImage.do',
         cache: false,
         contentType: false,
         enctype: 'multipart/form-data',
         processData: false,
         success: function(img_name) {
            console.log(img_name);
            setTimeout(function() {
            	alert("파일첨부");
				$(el).summernote('editor.insertImage', img_name);
			}, 5000);
         }
       });
}


function fn_boardAdd(){
	var category = $("input[name='cate_type']:checked").val();
	var title = $("input[name='title']").val();
	var editordata= $("textarea[name='editordata']").val();
	
	if(!category){
		alert("카테고리를 선택해주세요");
		return;
	}
	if(!title){
		alert("제목을 입력해주세요");
		return;
	}
	if(!editordata){
		alert("내용을 입력해주세요");
		return;
	}
	
	var tumnail = $("form img").first().attr("src");
	$('#hidden').val(tumnail);
	
	var formData = new FormData($('#frm')[0]);
	$.ajax({
		type : 'post',
		url : 'boardAddAjax.do',
		data : formData,
		processData : false,
		contentType : false,
		async:false,
		dataType:"text",
		success : function(data){
		if(data=="ok"){
			alert("글이 정상적으로 등록되었습니다.");
			location.href="home.do";
		}else if(data=="no"){
			alert("등록이 실패하였습니다. 다시 시도해주세요");
		}else{
			alert("등록이 실패하였습니다. 다시 시도해주세요");
		}
	},
		error : function(error){
			alert("등록이 실패하였습니다. 다시 시도해 주세요.");
			console.log(error);
			console.log(error.status);
		}
		
		
	})
}

</script>


<style type="text/css">
#hover_btn {
	font-size: 14px;
	font-weight: 700;
	color: white;
	display: inline-block;
	border: 1px solid rgba(155, 158, 163, 0.2);
	padding: 10px 20px 7px;
	border-radius: 2px;
	background-color: #5768AD;
}

#hover_btn:hover {
	background: white;
	border: 1px solid #5768AD;
	color: #5768AD;
}
</style>
</head>
<body>

	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg"
		style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>게시판 작성</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	
	<div class="container">
	<section class="classes spad">
	<div style="text-align: center;">
		<h3 style="padding-left: 15px;color: #263246;font-family:DM Sans,sans-serif;font-weight: 400;">🔎 회원들과 공유할 꿀Tip을 작성해주세요</h3>
	</div>
	<br/><br/>
		<main role="main" class="container">
			<form name="form" id="frm">
			<input type="hidden" id="hidden" name="tumnail_img" value="none"/>
				<div class="write-title" style="margin-bottom: 5px;">
					<label>
						<p style="font-weight:bold;">카테고리<span style="color:red;"> *</span></p>
					</label>
					<div class="c_radio">
						<div style="display: inline-block;">
							<input type="radio" name="cate_type" id="exercise" value="1" autocomplete="off" style="opacity: 0;">
							<label for="exercise">운동</label>
							<input type="radio" name="cate_type" id="food" value="2" autocomplete="off" style="opacity: 0">
							<label for="food">식단</label>
						</div>
						<div style="display: inline-block;">
							<input type="radio" name="cate_type" id="motive" value="3" autocomplete="off" style="opacity: 0">
							<label for="motive">동기부여</label>
							<input type="radio" name="cate_type" id="habit" value="4" autocomplete="off" style="opacity: 0">
							<label for="habit">생활습관</label>
							<input type="radio" name="cate_type" id="etc" value="5" autocomplete="off" style="opacity: 0">
							<label for="etc">기타</label>
						</div>
					</div>
				</div>
				<br><br>
				<label>
						<p style="font-weight:bold;margin-bottom:0">제목<span style="color:red;"> *</span></p>
				</label>
				<div style="text-align: center;">
				<input type="text" name="title" placeholder="제목을 입력하세요"
					style="width: 99%;border: none;border-bottom: 1px solid #D5D4D4;height: 54px;font-size: 15px;">
				<br/>
				</div>
				<br><br>
				<label>
					<p style="font-weight:bold;margin-bottom:0">내용<span style="color:red;"> *</span></p>
				</label>
				<div class="container" style="margin-top:10px;margin-bottom:20px;padding:0">
				  <textarea class="summernote" name="editordata"></textarea>    
				</div>
				
				<div class="class__filter__input" style="text-align: right;">
					<button id="hover_btn" type="button" style="width: 150px;height:45px; padding: 5px;font-size:1.0em;" onclick="fn_boardAdd()">등록</button>
					<button id="hover_btn" type="button" style="width: 150px;height:45px; padding: 5px;font-size:1.0em;" onclick="location.href='boardList.do'">목록</button>
				</div>
				
			</form>
		</main>
	</section>
	</div>
</body>
</html>

