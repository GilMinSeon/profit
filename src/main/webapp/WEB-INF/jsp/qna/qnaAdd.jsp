<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<!-- include libraries(jQuery, bootstrap) -->
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
<title>bulletin_write</title>
<style type="text/css">
#hover_btn {
	font-size: 14px;
	font-weight: 700;
	color: #5768AD;
	display: inline-block;
	border: 1px solid rgba(155, 158, 163, 0.2);
	padding: 10px 20px 7px;
	border-radius: 2px;
	background-color: white;
}

#hover_btn:hover {
	background: #5768AD;
	border: 1px solid #5768AD;
	color: #ffffff;
}
</style>

<script type="text/javascript">

	$(function() {

		$('.summernote').summernote({
			height : 600,
			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			focus : true,

			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
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
			data : form_data,
			type : "POST",
			url : 'qnaProfileImage.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				console.log(img_name);
				setTimeout(function() {
					alert("파일첨부");
					$(el).summernote('editor.insertImage', img_name);
				}, 5000);
			}
		});
	}
</script>
</head>
<body style="padding-top: 5rem;">

	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg"
		data-setbg="./resources/img/breadcrumb.jpg"
		style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>문의하기 등록</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->


	<section class="classes spad">
		<main role="main" class="container">
		<h3>👨‍🎓 문의를 입력 해주세요</h3>
		<br>
		<form name="form" method="POST" action="/qnaAdd.do">
			<div class="pt-1"></div>
			<input type="text" name="title" placeholder="제목을 입력하세요"
				style="border-radius: 5px; width: 100%; padding: 5px;">
			<div class="pt-1">
				<textarea class="summernote" id="summernote" name="contents"></textarea>
			</div>
			<div class="pt-1 text-right">
				<button id="hover_btn" class="btn btn btn-success" type="submit"
					style="width: 10%; padding: 5px;">등 록</button>
			</div>
		</form>
		</main>
	</section>
</body>
</html>

