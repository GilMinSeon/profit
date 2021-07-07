<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style type="text/css">
.classes__item__text .class-btn {
    font-size: 14px;
    font-weight: 700;
    color: #ffffff;
    background-color: #5768AD;
    display: inline-block;
    border: 1px solid rgba(155, 158, 163, 0.2);
    padding: 10px 20px 7px;
    border-radius: 2px;
    -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    -ms-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
}

.classes__item__text .class-btn:hover {
    background: #ffffff;
    border: 1px solid #5768AD;
    color: #5768AD;
}

-ms-overflow-style: none; } 
::-webkit-scrollbar { display: none; }
.box{ -ms-overflow-style: none; } 
.box::-webkit-scrollbar{ display:none; }

</style>
</head>
<body>


    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>칼로리 계산기</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
    	
        <div class="container">
       <div class="classes__item__text"  style="text-align: center;padding-top: 0;padding-bottom: 0">
	 		 <span class="blinking" style="font-weight:bold; font-size: 1.2em"> 내가 먹은 음식의 칼로리를 알아보고 영양소 구성 및 운동 상세를 확인할 수 있습니다</span>&nbsp;
	    </div><br>
            <div class="row" style="justify-content: center">
                <div style="display: left;margin-right: 20px;width: 30%;background-color: white;padding: 30px;border: 1px solid #ebecef;border-radius: 10px;height: 550px;">
            	<div style="text-align: center;">
	            	<p style="font-size: 1.2em;font-weight: bold;"><span style="background-color: #fee9b8;padding: 3px;">Kcal 계산기</span></p><br>
                </div>
                <div>
                	<div class="box" style="overflow-y: scroll;height: 370px;">
	                	<p>🥨 제육덮밥&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">500 Kcal</span></p>
	                	<p>🥨 김치 치즈 탕수육&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">700 Kcal</span></p>
	                	<p>🥨 연어샐러드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">150 Kcal</span></p>
	                	<p>🥨 빠네 파스타&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">550 Kcal</span></p>
	                	<p>🥨 마르게리따 피자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">670 Kcal</span></p>
	                	<p>🥨 얼큰이 칼국수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">580 Kcal</span></p>
	                	<p>🥨 곱창전골&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">760 Kcal</span></p>
	                	<p>🥨 마카롱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">150 Kcal</span></p>
	                	<p>🥨 밀크티 쉐이크&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">280 Kcal</span></p>
                	</div>
                	<hr>
                	<div style="text-align: right">
	                	<p style="font-weight: bold;font-size: 1.2em;color: #5768AD">총 칼로리 : 3050 Kcal</p>
                	</div>
                </div>
                <div class="blog__sidebar" style="height: 500px;" >
                
				</div>
				</div>
				
                <div class="col-lg-8 order-lg-2 order-1" style="background-color: white;padding: 30px;border: 1px solid #ebecef;border-radius: 10px;display: left;height: 900px;">
                <div class="classes__filter">
				<div class="row">
					<div class="col-lg-12">
						<form method="get" id="frm" action="lessonList.do#location123">
							<div class="class__filter__input">
								<p>Search:</p>
								<input type="text" style="width: 470px;" placeholder="검색" id="keyword" name="keyword" value="${option.keyword}">
							</div>
							<div class="class__filter__btn">
								<button type="submit" style="cursor:pointer;">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<span id="location123"></span>
						</form>
							<p style="font-size: 0.8em;">음식의 칼로리 뿐만 아니라 영양소 구성을 조회할 수 있으므로 다이어트뿐 아니라 <br><span style="color:#16a8e5">건강한 식습관 형성</span>에도 도움이 됩니다.</p>
					</div>
				</div>
			</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

</body>
<!-- Js Plugins -->
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</html>