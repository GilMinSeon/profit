<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/datepicker/jquery-ui.css">
<script src="./resources/datepicker/jquery-3.5.1.js"></script>
<script src="./resources/datepicker/jquery-ui.js"></script>



<script type="text/javascript">
$(document).ready(function(){
   $( "#mydate" ).datepicker({
      changeYear : true,
      changeMonth : true,
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       yearRange: 'c-100:c+10',
       dateFormat: 'yymmdd'
      
    });
});


$(document).ready(function(){
    $('.count').prop('disabled', true);
      $(document).on('click','.plus',function(){
      $('.count').val(parseInt($('.count').val()) + 1 );
   });
   $(document).on('click','.minus',function(){
      $('.count').val(parseInt($('.count').val()) - 1 );
         if ($('.count').val() == 0) {
            $('.count').val(1);
         }
       });
   });




</script>
</head>
<style>
.classes__filter form .class__filter__btn_re {
   padding-right: 125px;
}
</style>
<body>

   <!-- Breadcrumb Begin -->
   <section class="breadcrumb-option set-bg"
      data-setbg="./resources/img/breadcrumb.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb__text">
                  <h2>회원관리</h2>

               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Breadcrumb End -->

   <!-- Blog Section Begin -->
   <section class="blog spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 order-lg-1 order-2">
               <div class="blog__sidebar">
                  <div class="blog__sidebar__categories">
                     <h4>카테고리</h4>
                     <ul>
                        <li><a href="trainerPermitList">트레이너승인</a></li>
                        <li><a href="adminMemberList">회원관리</a></li>
                        <li><a href="adminLessonList">온라인클래스 내역조회</a></li>
                        <li><a href="adminChatList">상담내역</a></li>
                        <li><a href="adminTicketPayList">이용권 구매내역</a></li>
                     </ul>
                  </div>
                  <div class="blog__sidebar__recent">
                     <h4>최신글</h4>
                     <div class="blog__recent__item">
                        <div class="blog__recent__item__pic">
                           <img src="./resources/img/blog/br-1.jpg" alt="">
                        </div>
                        <div class="blog__recent__item__text">
                           <h6>09 Kinds Of Vegetables Protect The Liver</h6>
                           <span>MAR 05, 2019</span>
                        </div>
                     </div>
                     <div class="blog__recent__item">
                        <div class="blog__recent__item__pic">
                           <img src="./resources/img/blog/br-2.jpg" alt="">
                        </div>
                        <div class="blog__recent__item__text">
                           <h6>Tips You To Balance Nutrition Meal Day</h6>
                           <span>MAR 05, 2019</span>
                        </div>
                     </div>
                     <div class="blog__recent__item">
                        <div class="blog__recent__item__pic">
                           <img src="./resources/img/blog/br-3.jpg" alt="">
                        </div>
                        <div class="blog__recent__item__text">
                           <h6>4 Principles Help You Lose Weight With Vegetables</h6>
                           <span>MAR 05, 2019</span>
                        </div>
                     </div>
                  </div>
                  <div class="blog__sidebar__tags">
                     <h4>인기 검색어</h4>
                     <a href="#">Weight</a> <a href="#">Beauty</a> <a href="#">Yoga
                        Ball</a> <a href="#">Fruit</a> <a href="#">Healthy Food</a> <a
                        href="#">Lifestyle</a>
                  </div>
               </div>
            </div>
            
            
            
            
            <!-- 여기부터 달라짐 -->
            <div class="col-lg-8 order-lg-2 order-1">
               <div class="row" style="display: inline-block; width: 100%;">
                  <!-- Classes Section Begin -->
                  <section class="classes spad" style="margin-top: 0px; padding-top: 0px;">
                     <div class="classes__filter" style="background-color: #9e9e9e0a; padding : 60px 10px;">
                        <div class="row">
                           <div class="col-lg-12">
                           <div style="text-align: center;">
                              <h4 style="font-family: DM Sans, sans-serif;color: #111111;font-weight: 400;">이용권 구매내역 관리</h4>
                              <br/><br/>
                           </div>
                              <form id="ticketPay_form" action="#" >

                                 <div class="class__filter__select">
                                    <p>검색조건:</p>
                                    <select>
                                       <option>전체</option>
                                       <option>이름</option>
                                       <option>아이디</option>
                                    </select>
   <!-- <input type="text" id="mydate"/>    -->                           </div>
                                 
                                 <div id="searchBtn" class="class__filter__input" style="margin-right: 20px;">
                                    <p>날짜:</p>
                                    <input type="text" placeholder="검색" id="mydate" style="width: 100%;">
                                 </div>
                                 
                                 <div id="searchBtn" class="class__filter__input">
                                    <p>Search:</p>
                                    <input type="text" placeholder="검색" style="width: 100%;">
                                 </div>
                                 <div id="search2" class="class__filter__btn_re">
                                    <button>
                                       <i class="fa fa-search"></i>
                                    </button>
                                 </div>

                              </form>
                           </div>
                        </div>
                        <br>

                        <table class="table table-hover" style="text-align: center;">
                           <thead>
                              <tr style="background: #E6E6E6;">
                                 <th scope="col">아이디</th>
                                 <th scope="col">이름</th>
                                 <th scope="col">종류</th>
                                 <th scope="col">남은횟수</th>
                                 <th scope="col">수정</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td><a href="ticketPayDetail">a001</a></td>
                                 <td>나미리</td>
                                 <td>1회권</td>
                                 <td>3회권</td>
                                 <td>
                                    <div class="qty mt-5">
                                             <span class="minus bg-dark">-</span>
                                             <input type="number" class="count" name="qty" value="1">
                                             <span class="plus bg-dark">+</span>
                                         </div>
                                 
                                 </td>
                              </tr>
                              <tr>
                                 <td><a href="ticketPayDetail">a001</a></td>
                                 <td>나미리</td>
                                 <td>1회권</td>
                                 <td>3회권</td>
                                 <td style="width:135px;">
                                    <div class="qty mt-5">
                                             <span class="minus bg-dark">-</span>
                                             <input type="number" class="count" name="qty" value="1">
                                             <span class="plus bg-dark">+</span>
                                         </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td><a href="ticketPayDetail">a001</a></td>
                                 <td>나미리</td>
                                 <td>1회권</td>
                                 <td>3회권</td>
                                 <td>
                                    <div class="qty mt-5">
                                             <span class="minus bg-dark">-</span>
                                             <input type="number" class="count" name="qty" value="1">
                                             <span class="plus bg-dark">+</span>
                                         </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td><a href="ticketPayDetail">a001</a></td>
                                 <td>나미리</td>
                                 <td>1회권</td>
                                 <td>3회권</td>
                                 <td>
                                    <div class="qty mt-5">
                                             <span class="minus bg-dark">-</span>
                                             <input type="number" class="count" name="qty" value="1">
                                             <span class="plus bg-dark">+</span>
                                         </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td><a href="ticketPayDetail">a001</a></td>
                                 <td>나미리</td>
                                 <td>1회권</td>
                                 <td>3회권</td>
                                 <td>
                                    <div class="qty mt-5">
                                             <span class="minus bg-dark">-</span>
                                             <input type="number" class="count" name="qty" value="1">
                                             <span class="plus bg-dark">+</span>
                                         </div>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <br/><br/>
                        <div class="col-lg-12" style="text-align: right;">
                                   <button type="submit" class="site-btn" style="font-size: 1.1em;color: white; background-color: #5768AD;width: 200px;height: 48px;margin-right: 7px;">수정하기</button>
                              </div>
                        
                        
                     </div>
                  </section>
                  <!-- Classes Section End -->
               </div>
            </div>
         </div>
      </div>

   </section>
   <!-- Blog Section End -->




   <!-- Js Plugins -->



   <!-- <script src="./resources/js/jquery-3.3.1.min.js"></script> -->
   <script src="./resources/js/bootstrap.min.js"></script>
   <script src="./resources/js/jquery.nice-select.min.js"></script>
   <script src="./resources/js/jquery.barfiller.js"></script>
   <script src="./resources/js/jquery.slicknav.js"></script>
   <script src="./resources/js/owl.carousel.min.js"></script>
   <script src="./resources/js/main.js"></script>
</body>
</html>