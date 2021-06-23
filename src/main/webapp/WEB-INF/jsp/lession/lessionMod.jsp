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
	<section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg" style="background-image: url(&quot;./resources/img/breadcrumb.jpg&quot;);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>강의 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb End -->
	<div class="container">
		<section class="classes spad">
			<div>
				<h3 style="padding-left: 15px; color: #263246; font-family: DM Sans, sans-serif; font-weight: 400;">🦾 강의를 수정해주세요 🦿</h3>
			</div>
			<br />
			<br />
			<main role="main" class="container">
				<form name="form" method="get" action="/lessionList">
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
					<div class="pt-1"></div>
					<p>
						<input type="text" name="title" placeholder="제목을 입력하세요" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<p>
						<input type="text" name="title" placeholder="강의 설명을 입력해주세요" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<p>
						<input type="number" name="title" placeholder="Breathing" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<p>
						<input type="number" name="title" placeholder="Methabolism" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<p>
						<input type="number" name="title" placeholder="Flexibility" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<p>
						<input type="number" name="title" placeholder="Strongness" style="border-radius: 5px; width: 100%; padding: 5px;">
					</p>
					<div class="pt-1">
						<textarea id="summernote" name="contents"></textarea>
					</div>
					<script>
						$('#summernote').summernote({
							placeholder : '클래스 소개를 적어주세요',
							tabsize : 2,
							height : 300
						});
					</script>
					<br />
					<div class="pt-1 text-right">
						<button id="hover_btn" class="btn btn btn-success" type="button" style="width: 10%; padding: 5px;" onclick="location.href='lessionList'">목록</button>
						<button id="hover_btn" class="btn btn btn-success" type="submit" style="width: 10%; padding: 5px;">수정</button>
					</div>
				</form>
			</main>
		</section>
	</div>
</body>
</html>
