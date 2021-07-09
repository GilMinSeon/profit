<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	//섬머노트
	$(function() {
		$('#loading').hide();
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
	//파일업로드
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
			beforeSend : function() {
				$('#loading').show();
			},
			success : function(img_name) {
				console.log(img_name);
				setTimeout(function() {
					alert("파일첨부");
					$('#loading').hide();
					$(el).summernote('editor.insertImage', img_name);
				}, 5000);
			}
		});
	}
	//클릭시 파일 처음거 가지고가기
	$(function() {
		$('#hover_btn').click(function() {
			var tumnail = $("form img").first().attr("src");
			alert(tumnail);
			$('#hidden').val(tumnail);
		})
	})
</script>
</head>
<body style="padding-top: 5rem;">
	<c:set var="data" value="${data}" />
	<!-- Breadcrumb Begi -->
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg" style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>문의하기 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->




	<section class="classes spad">
		<main role="main" class="container">
		<h3>📑 문의 수정해주세요</h3>
		<br>
		<form class="container" name="form" method="POST" action="/qnaMod.do?communitySeq=${data.communitySeq}">
			<input type="hidden" id="hidden" name="tumnalil_img" value="none" />
			<div class="pt-1"></div>
			<input type="text" name="commonTitle" value="${data.commonTitle}" style="border-radius: 5px; width: 100%; padding: 5px;">
			<div class="container" style="margin-top: 10px; margin-bottom: 20px; padding: 0; position: relative;">
				<textarea class="summernote" id="summernote" name="commonContent">
					${data.commonContent}
				</textarea>
				<div id="loading" style="position: absolute; top: 50%; left: 50%; margin: -150px 0 0 -150px">
					<img id="loading-image" src="./resources/img/common/loading.gif" alt="Loading..." />
				</div>
			</div>
			<div class="pt-1 text-right">
				<button id="hover_btn" class="btn btn btn-success" type="button" style="width: 10%; padding: 5px;" onclick="location.href='qnaList.do'">목록</button>
				<button id="hover_btn" class="btn btn btn-success" type="submit" style="width: 10%; padding: 5px;">수정</button>
			</div>
		</form>
		</main>
	</section>
</body>
</html>


