<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function go_time(){
	 
	 var now = new Date();
	 
	 var year = now.getFullYear(); //년
	 var month = now.getMonth(); //월
	 var day = now.getDay();  //일
	 var hour = now.getHours();  //시
	 var min = now.getMinutes();  //분
	 var sec = now.getSeconds();  //초
	 
	 document.getElementById("clock").innerHTML 
	 = year+"년 "+ month+"월 "+day+"일 "+hour+":"+min+":"+sec
	 //id가 clock인 html에 현재시각을 넣음
	 
	 setTimeout("go_time()", 1000);
	 //1초마다 해당 펑션을 실행함.
}
</script>
<body onload="go_time()">


    <!-- Breadcrumb Begin -->
    <section class="breadcrumb-option set-bg" data-setbg="./resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>이용권 구매</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb End -->
	
<!-- Pricing Section Begin -->
    <section class="pricing spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                    	<div style="background-color: #F6F6F9;padding: 60px;">
                        <h2 style="color:#404041; font-weight: bold;">구매 하기</h2>
	                        <br>
	                        <span style="color: gray;font-size: 1em;font-weight: bold;">※ 본 상품은 고객의 단순 변심으로 환불이 불가한 상품입니다.</span>
	                        <br>
	                        <br>
	                        <hr style="color: gray;width: 80%;">
	                        <br>
	                        <section class="content content_content" style="width: 70%; margin: auto;">
                    <section class="invoice">
                        <!-- title row -->
                        <div class="row">
                        </div>
                        <!-- info row -->
                        <div class="row invoice-info">
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <strong>
                                                                            </strong>
                                </address>
                            </div><!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <address>
                                    <strong>
                                        #구매정보                                   </strong>
                                    <br>
                                      결제사이트 : PROFIT                                  <br>
					   대표자 : JAYPARK<br>
					                                      <br>
                                                                  </address>
                            </div><!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <!-- Table row -->
                        <div class="row">
                            <div class="col-xs-12 table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>구매자</th>
                                            <th>상품명</th>
                                             <th>가격</th>
                                            <th>가격단위</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                                                                <tr>
                                            <td>${memberId}</td>
                                            <td>${ticketCategory['ticketName']}</td>
                                            <td>${ticketCategory['ticketPrice']}</td>
                                            <td>원(&#8361;)</td>
                                        </tr>
                                                                            </tbody>
                                </table>
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <div class="row">
                            <!-- accepted payments column -->
                            <div class="col-md-12">
                                <p class="lead" style="font-size: 1.1em">🛒구매일시<div id="clock"></div></p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            
                                            
                                            <tr style="text-align: right;">
                                                <td>총 합계 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: #FBEDB5;padding: 3px;">4000원(&#8361;)</span></td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                     <div class="classes__item__text"  style="text-align: center;padding-top: 0px;margin-left: auto;margin-right: auto;">
									         <a href="chatList.do" class="class-btn_w" style="font-size: 1.1em;">&nbsp;&nbsp;결제하기&nbsp;&nbsp;</a>
									         <a href="chatList.do" class="class-btn_w" style="font-size: 1.1em;">&nbsp;&nbsp;뒤로가기&nbsp;&nbsp;</a>
								    </div>
                                </div>
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                    </section>
                </section>
                        </div>
                    </div>
                </div>
            
            </div>
        </div>
        
    </section>
    
    <!-- Pricing Section End -->

    


    <!-- Js Plugins -->
    <script src="./resources/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.barfiller.js"></script>
    <script src="./resources/js/jquery.slicknav.js"></script>
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/main.js"></script>
</body>

</html>