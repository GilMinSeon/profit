<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
			<h3>👨‍🎓 문의 해주세요</h3><br>
			<form name="form" method="POST" action="/qnaList">
				<div class="pt-1"></div>
				<input type="text" name="title" placeholder="제목을 입력하세요"
					style="border-radius: 5px; width: 100%; padding: 5px;">
				<div class="pt-1">
					<textarea id="summernote" name="contents"></textarea>
				</div> 
				<script>
// 				$(document).ready(function() {

// 					var toolbar = [
// 						    // 글꼴 설정
// 						    ['fontname', ['fontname']],
// 						    // 글자 크기 설정
// 						    ['fontsize', ['fontsize']],
// 						    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
// 						    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
// 						    // 글자색
// 						    ['color', ['forecolor','color']],
// 						    // 표만들기
// 						    ['table', ['table']],
// 						    // 글머리 기호, 번호매기기, 문단정렬
// 						    ['para', ['ul', 'ol', 'paragraph']],
// 						    // 줄간격
// 						    ['height', ['height']],
// 						    // 그림첨부, 링크만들기, 동영상첨부
// 						    ['insert',['picture','link','video']],//
// 						    // 코드보기, 확대해서보기, 도움말
// 						    ['view', ['codeview','fullscreen']]
// 						  ];

// 					var setting = {
// 				            height : 300,
// 				            minHeight : null,
// 				            maxHeight : null,
// 				            focus : true,
// 				            lang : 'ko-KR',
// 				            toolbar : toolbar,
// 				            callbacks : { //여기 부분이 이미지를 첨부하는 부분
// 				            onImageUpload : function(files, editor,
// 				            welEditable) {
// 				            for (var i = files.length - 1; i >= 0; i--) {
// 				            uploadSummernoteImageFile(files[i],
// 				            this);
// 				            		}
// 				            	}
// 				            }
// 				         };

// 				        $('#summernote').summernote(setting);
// 				        });
				
// 				//파일 업로드
// 				var setting = {
// 			            height : 300,
// 			            minHeight : null,
// 			            maxHeight : null,
// 			            focus : true,
// 			            lang : 'ko-KR',
// 			            toolbar : toolbar,
// 			            //콜백 함수
// 			            callbacks : { 
// 			            	onImageUpload : function(files, editor, welEditable) {
// 			            // 파일 업로드(다중업로드를 위해 반복문 사용)
// 			            for (var i = files.length - 1; i >= 0; i--) {
// 			            uploadSummernoteImageFile(files[i],
// 			            this);
// 			            		}
// 			            	}
// 			            }
// 			         };
			        
// 			        function uploadSummernoteImageFile(file, el) {
// 						data = new FormData();
// 						data.append("file", file);
// 						$.ajax({
// 							data : data,
// 							type : "POST",
// 							url : "uploadSummernoteImageFile",
// 							contentType : false,
// 							enctype : 'multipart/form-data',
// 							processData : false,
// 							success : function(data) {
// 								$(el).summernote('editor.insertImage', data.url);
// 							}
// 						});
// 					}
				$('#summernote').summernote({
						placeholder : '내용을 입력해주세요',
						tabsize : 2,
						height : 300
					});
				</script>
				<div class="pt-1 text-right">
					<button id="hover_btn" class="btn btn btn-success" type="submit"
						style="width: 10%; padding: 5px;">등록</button>
				</div>
			</form>
		</main>
	</section>
</body>
</html>

