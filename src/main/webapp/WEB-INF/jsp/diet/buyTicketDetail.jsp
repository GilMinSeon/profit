<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8">
<script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
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

function paybtn() {
    INIStdPay.pay('SendPayForm_id');
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
                        <form id="SendPayForm_id" name="" method="POST" >
                        <div class="row">
                            <div class="col-xs-12 table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                   <th>결제유형</th>
                   <td><select class="formdata" name="mid">
        	           <option value="INIpayTest">일반결제
        	    	   <option value="iniescrow0">에스크로
					   <!--option value="INIBillTst">빌키발급-->
        	           </select></td>	   
                </tr>
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
<%--                                             <td>${ticketCategory['ticketName']}</td> --%>
                                            <td><input class="formdata" name="goodname" value="${ticketCategory['ticketName']}" spellcheck="false"></td>
<%--                                             <td>${ticketCategory['ticketPrice']}</td> --%>
                                            <td><input class="formdata" name="price" value="1000" spellcheck="false" readonly></td>
                                            <td>원(&#8361;)</td>
                                        </tr>
                                                                            </tbody>
                                </table>
                                <input type="hidden" class="formdata" name="buyername" value="길동이" spellcheck="false">
                                <input type="hidden" class="formdata" name="buyertel" value="010-1234-5678" spellcheck="false">
                                <input type="hidden" class="formdata" name="buyeremail" placeholder="이메일을 입력하세요." spellcheck="false">
                                <input type="hidden" class="formdata" name="acceptmethod" value="CARDPOINT:va_receipt:HPP(1):below1000" spellcheck="false">
                                <input type="hidden"   name="version"      value="1.0" >
					            <input type="hidden"   name="currency"     value="WON" >
								<input type="hidden"   name="gopaymethod"  value="" >
					            <input type="hidden"   name="oid"          value="TEST_1625298904368" >
					            <input type="hidden"   name="timestamp"    value="1625298904368" >
					            <input type="hidden"   name="signature"    value="100ad411051c7bd84e223473e4d2e35990e4a9051ba84e926195c5907350c0e6" >
					            <input type="hidden"   name="mKey"         value="3a9503069192f207491d4b19bd743fc249a761ed94246c8c42fed06c3cd15a33" >
					            <input type="hidden"   name="returnUrl"    value="http://localhost:9999/" >
					            <input type="hidden"   name="closeUrl"     value="http://localhost:9999/" >
                            </div><!-- /.col -->
                        </div><!-- /.row -->
						</form>
                        <div class="row">
                            <!-- accepted payments column -->
                            <div class="col-md-12">
                                <p class="lead" style="font-size: 1.1em">🛒구매일시<div id="clock"></div></p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            
                                            
                                            <tr style="text-align: right;">
                                                <td>총 합계 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: #FBEDB5;padding: 3px;">${ticketCategory['ticketPrice']}원(&#8361;)</span></td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                     <div class="classes__item__text"  style="text-align: center;padding-top: 0px;margin-left: auto;margin-right: auto;">
									         <a class="class-btn_w" style="font-size: 1.1em;" onclick="paybtn()">&nbsp;&nbsp;결제하기&nbsp;&nbsp;</a>
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