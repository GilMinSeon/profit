<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			height : 300,
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

	+ //이미지 업로드
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : 'qnaProfileImage.do',
			cache : false,
			contentType : false,
			enctype : 'text',
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

	//파일 삭제
	function fn_delFile() {
		var form = {
			communitySeq : $("input[name='communitySeq']").val(),
			fileSeq : $("input[name='fileSeq']").val(),
			fileRealName : $("input[name='fileRealName']").val()
		}
		alert("form = " + form);
		$.ajax({
			type : 'get',
			url : 'noticeModDelFile.do',
			data : form,
			success : function(data) {
				if (data == "ok") {
					alert("파일이 정상적으로 삭제되었습니다.");
					location.href = "noticeMod.do?communitySeq=" + $("input[name='communitySeq']").val();
				} else if (data == "ng") {
					alert("등록이 실패하였습니다. 다시 시도해주세요");
				} else {
					alert("등록이 실패하였습니다. 다시 시도해주세요");
				}
			},
			error : function(error) {
				alert("삭제가 실패하였습니다. 다시 시도해 주세요.");
			}

		})
	}
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
						<h2>공지사항 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->


	<section class="classes spad">
		<main role="main" class="container">
		<h3>📑 공지사항 수정해주세요</h3>
		<br>
		<c:set var="data" value="${data}" />
		<form name="form" method="POST" action="/noticeMod.do?communitySeq=${data.communitySeq}" enctype="multipart/form-data">
			<input type="hidden" name="communitySeq" value="${data.communitySeq}">
			<input type="hidden" name="fileSeq" value="${data.fileSeq}">
			<input type="hidden" name="fileRealName" value="${data.fileRealName}">
			<input type="hidden" name="fileRealNameNew" value="${data.fileRealName}">
			<div class="pt-1"></div>
			<label>
				<p style="font-weight: bold; margin-bottom: 0">
					제목<span style="color: red;"> *</span>
				</p>
			</label>
			<input type="text" name="title" value="${data.commonTitle}" placeholder="제목을 입력하세요" style="width: 99%; border: none; border-bottom: 1px solid #D5D4D4; height: 54px; font-size: 15px;">
			<div class="pt-1">

				<br>
				<textarea class="summernote" id="summernote" name="contents">${data.commonContent}</textarea>
				<div id="loading" style="position: absolute; top: 50%; left: 50%; margin: -150px 0 0 -150px">
					<img id="loading-image" src="./resources/img/common/loading.gif" alt="Loading..." />
				</div>
			</div>
			<br>
			<div>
				<div id="d_file">
					<input type="hidden" class="fn_delFile" name="fn_delFile" value="${data.communitySeq}">
					<c:if test="${data.fileRealName ne '파일없음'}">
						<div style="display: inline-block;">
							<span>첨부파일 : </span>
						</div>
						<div style="display: inline-block;">
							<input type="text" class="form-control" id="fileRealName" style="width: auto;" value="${data.fileRealName}">
						</div>
						<div style="display: inline-block;">
							<a type="button" style="background-color: #efefef; width: 30px; text-align: center; height: 30px; border-radius: 4px; line-height: 28px;" onclick="fn_delFile()">X</a>
						</div>
					</c:if>
					<c:if test="${data.fileRealName eq '파일없음'}">
						<div>
							<input type="file" id="file" name="file" value="파일첨부">
						</div>
					</c:if>
				</div>
			</div>
			<div class="pt-1 text-right">
				<button id="hover_btn" class="btn btn btn-success" type="button" style="width: 10%; padding: 5px;" onclick="location.href='noticeList.do'">목록</button>
				<button id="hover_btn" class="btn btn btn-success" type="submit" style="width: 10%; padding: 5px;">수정</button>
			</div>
		</form>
		</main>
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
