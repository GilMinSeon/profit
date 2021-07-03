<!DOCTYPE html>
<html lang="zxx">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
/* -------------------------------------
    GLOBAL
    A very basic CSS reset
------------------------------------- */
* {
    margin: 0;
    padding: 0;
    font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
    box-sizing: border-box;
    font-size: 14px;
}

img {
    max-width: 100%;
}

/* body { */
/*     -webkit-font-smoothing: antialiased; */
/*     -webkit-text-size-adjust: none; */
/*     width: 100% !important; */
/*     height: 100%; */
/*     line-height: 1.6; */
/* } */

/* Let's make sure all tables have defaults */
table td {
    vertical-align: top;
}

/* -------------------------------------
    BODY & CONTAINER
------------------------------------- */
/* body { */
/*     background-color: #f6f6f6; */
/* } */

 .body-wrap { 
     background-color: #ffffff; 
     width: 40%; 
 } 

/* .container { */
/*     display: block !important; */
/*     max-width: 800px !important; */
/*     margin: 0 auto !important; */
/*     /* makes it centered */ */
/*     clear: both !important; */
/* } */

/* .content { */
/*     max-width: 800px; */
/*     margin: 0 auto; */
/*     display: block; */
/*     padding: 20px; */
/* } */

/* -------------------------------------
    HEADER, FOOTER, MAIN
------------------------------------- */
/* .main { */
/*     background: #fff; */
/*     border: 1px solid #e9e9e9; */
/*     border-radius: 3px; */
/* } */

/* .content-wrap { */
/*     padding: 20px; */
/* } */

/* .content-block { */
/*     padding: 0 0 20px; */
/* } */

/* .header { */
/*     width: 100%; */
/*     margin-bottom: 20px; */
/* } */

/* .footer { */
/*     width: 100%; */
/*     clear: both; */
/*     color: #999; */
/*     padding: 20px; */
/* } */
/* .footer a { */
/*     color: #999; */
/* } */
/* .footer p, .footer a, .footer unsubscribe, .footer td { */
/*     font-size: 12px; */
/* } */

/* -------------------------------------
    TYPOGRAPHY
------------------------------------- */
h1, h2, h3 {
    font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    color: #000;
    margin: 40px 0 0;
    line-height: 1.2;
    font-weight: 400;
}

h1 {
    font-size: 32px;
    font-weight: 500;
}

h2 {
    font-size: 24px;
}

h3 {
    font-size: 18px;
}

h4 {
    font-size: 14px;
    font-weight: 600;
}

p, ul, ol {
    margin-bottom: 10px;
    font-weight: normal;
}
p li, ul li, ol li {
    margin-left: 5px;
    list-style-position: inside;
}

/* -------------------------------------
    LINKS & BUTTONS
------------------------------------- */
a {
    color: #1ab394;
    text-decoration: underline;
}

.btn-primary {
    text-decoration: none;
    color: #FFF;
    background-color: #1ab394;
    border: solid #1ab394;
    border-width: 5px 10px;
    line-height: 2;
    font-weight: bold;
    text-align: center;
    cursor: pointer;
    display: inline-block;
    border-radius: 5px;
    text-transform: capitalize;
}

/* -------------------------------------
    OTHER STYLES THAT MIGHT BE USEFUL
------------------------------------- */
.last {
    margin-bottom: 0;
}

.first {
    margin-top: 0;
}

.aligncenter {
    text-align: center;
}

.alignright {
    text-align: right;
}

.alignleft {
    text-align: left;
}

.clear {
    clear: both;
}

/* -------------------------------------
    ALERTS
    Change the class depending on warning email, good email or bad email
------------------------------------- */
.alert {
    font-size: 16px;
    color: #fff;
    font-weight: 500;
    padding: 20px;
    text-align: center;
    border-radius: 3px 3px 0 0;
}
.alert a {
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    font-size: 16px;
}
.alert.alert-warning {
    background: #f8ac59;
}
.alert.alert-bad {
    background: #ed5565;
}
.alert.alert-good {
    background: #1ab394;
}

/* -------------------------------------
    INVOICE
    Styles for the billing table
------------------------------------- */
.invoice {
    margin: 40px auto;
    text-align: left;
    width: 80%;
}
.invoice td {
    padding: 5px 0;
}
.invoice .invoice-items {
    width: 100%;
}
.invoice .invoice-items td {
    border-top: #eee 1px solid;
}
.invoice .invoice-items .total td {
    border-top: 2px solid #333;
    border-bottom: 2px solid #333;
    font-weight: 700;
}

/* -------------------------------------
    RESPONSIVE AND MOBILE FRIENDLY STYLES
------------------------------------- */
@media only screen and (max-width: 640px) {
    h1, h2, h3, h4 {
        font-weight: 600 !important;
        margin: 20px 0 5px !important;
    }

    h1 {
        font-size: 22px !important;
    }

    h2 {
        font-size: 18px !important;
    }

    h3 {
        font-size: 16px !important;
    }

    .container {
        width: 100% !important;
    }

    .content, .content-wrap {
        padding: 10px !important;
    }

    .invoice {
        width: 100% !important;
    }
}
</style>
<body>


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
                    	<div style="background-color: #F6F6F9;padding: 30px;padding-bottom: 0px;height: 180px;">
                        <h2 style="color:#404041; font-weight: bold;">구매 하기</h2>
	                        <br>
	                        <span style="color: gray;font-size: 0.9em;font-weight: bold;background-color: #FBEDB5;padding:3px;">※ 본 상품은 고객의 단순 변심으로 환불이 불가한 상품입니다.</span>
	                        <br>
	                        <br>
<!-- 	                        <div> -->
<!-- 	                        	<br> -->
<!-- 	                        	<span style="float: left;padding-left: 60px;font-weight: bold;">구매 상품</span> -->
<!-- 	                        	<span style="float: right;padding-right: 60px;font-weight: bold;">1회권</span> -->
<!-- 	                        	<br><br> -->
<!-- 	                        	<span style="float: left;padding-left: 60px;font-weight: bold;">이름</span> -->
<!-- 	                        	<span style="float: right;padding-right: 60px;font-weight: bold;">송하나</span> -->
<!-- 								<br><br> -->
<!-- 	                        	<span style="float: left;padding-left: 60px;font-weight: bold;">전화번호</span> -->
<!-- 	                        	<span style="float: right;padding-right: 60px;font-weight: bold;">010-1111-2222</span> -->
<!-- 								<br><br> -->
<!-- 	                        	<span style="float: left;padding-left: 60px;font-weight: bold;">결제금액</span> -->
<!-- 	                        	<span style="float: right;padding-right: 60px;font-weight: bold;">4,000원</span>	                         -->
<!-- 								<br><br><br><br> -->
<!-- 								<div class="classes__item__text"  style="text-align: center;padding-top: 0px;"> -->
<!-- 							         <a href="#" class="class-btn_w" style="font-size: 1.1em;">이용권 구매</a> -->
<!-- 							         <a href="buyTicket" class="class-btn_w" style="font-size: 1.1em;">&nbsp;&nbsp;구매 취소&nbsp;&nbsp;</a> -->
<!-- 							    </div> -->
<!-- 	                        </div> -->

                        </div>
                        
                    </div>
                </div>
            
            </div>
        </div>
        <table class="body-wrap" style="margin-left: auto;margin-right: auto;">
    <tbody><tr>
        <td></td>
        <td class="container" width="600" style="padding:0">
            <div class="content">
                <table class="main" width="100%" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td class="content-wrap aligncenter">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tbody><tr>
                                    <td class="content-block">
                                    
                                        <h2 style="font-weight:bold;"><br>결제 정보<br></h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        <table class="invoice">
                                            <tbody><tr>
                                                <td style="font-size: 1.2em; ">결제 사이트 : PROFIT<br>대표자 : 임시완<br>구매일시 : 2021-07-03 12시 38분</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="invoice-items" cellpadding="0" cellspacing="0">
                                                        <tbody><tr>
                                                            <td>Service 1</td>
                                                            <td class="alignright">$ 20.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Service 2</td>
                                                            <td class="alignright">$ 10.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Service 3</td>
                                                            <td class="alignright">$ 6.00</td>
                                                        </tr>
                                                        <tr class="total">
                                                            <td class="alignright" width="80%">Total</td>
                                                            <td class="alignright">$ 36.00</td>
                                                        </tr>
                                                    </tbody></table>
                                                </td>
                                            </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        <a href="#">View in browser</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        Company Inc. 123 Van Ness, San Francisco 94102
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>
                    </tr>
                </tbody></table>
                <div class="footer">
                    <table width="100%">
                        <tbody><tr>
                            <td class="aligncenter content-block">Questions? Email <a href="mailto:">support@company.inc</a></td>
                        </tr>
                    </tbody></table>
                </div></div>
        </td>
        <td></td>
    </tr>
</tbody></table>
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