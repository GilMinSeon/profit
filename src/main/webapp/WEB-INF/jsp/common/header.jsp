<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--     Page Preloder
    <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu">
        <div class="offcanvas__logo">
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__widget dropdown">
			<p><a style="color:gray">송하나님</a></p>                
			<p><a style="color:gray" href="myinfo">마이페이지</a></p>                
			<p><a style="color:gray">로그아웃</a></p>                
        </div>
        <nav class="header__menu">
            <ul class="mobile-menu">
                <li class="active"><a href="home">Home</a></li>
				<li><a href="aiTeachList">AI교정</a></li>                
                <li><a href="#">식단관리</a>
                    <ul class="dropdown">
                        <li><a href="chatList">1:1 상담</a></li>
                        <li><a href="">칼로리 계산기</a></li>
                    </ul>
                </li> 
                <li><a href="lessonList">온라인클래스</a></li>
                <li><a href="#">커뮤니티</a>
                    <ul class="dropdown">
                        <li><a href="recipeList">레시피</a></li>
                        <li><a href="boardList">자유게시판</a></li>
                    </ul>
                </li> 
                <li><a href="noticeList">공지사항</a></li>
                <li><a href="qnaList">문의하기</a></li>
            </ul>
        </nav>
        <div class="offcanvas__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
<!--                     <div class="col-lg-3 col-md-3"> -->
<!--                         <div class="header__logo"> -->
<!--                             <a href="home"><img src="./resources/img/logo.png" alt=""></a> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
<!--             id="header_info"  -->
            <div style="width: 100%; ">
            		<div class="header__logo header_info" style="display: inline-block;padding-left: 15%;">
                            <a href="home"><img src="./resources/img/logo.png" alt=""></a>
                    </div>
                    <div class="header_info" style="vertical-align: bottom;text-align: right;float: right;height: 100%;padding-top: 70px;padding-right: 50px;">
                    <a href="trainerPermitList" style="color: gray;font-size: 0.9em;padding-left: 10px;">관리자님</a>
                    <a href="myinfo" style="color: gray;font-size: 0.9em;padding-left: 10px;">마이페이지</a>
                    <a href="login" style="color: gray;font-size: 0.9em;padding-left: 10px;">로그인</a>
                    </div>
      	    </div>
        </div>
        
        
        
        <div class="header__nav">
            <div class="container" style="text-align: center;">
                <div class="row" style="flex-wrap: nowrap;display: inline-block;">
        
                    <div class="col-lg-9 col-md-9" style="max-width: 100%;margin: 0;">
                        <nav class="header__menu" >
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li><a href="aiTeachList">AI교정</a></li>
								<li><a href="#">식단관리</a>
                                    <ul class="dropdown">
                                        <li><a href="chatList">1:1 상담</a></li>
                                        <li><a href="">칼로리 계산기</a></li>
                                    </ul>
                                </li>
                                <li><a href="lessonList">온라인클래스</a></li>
                                <li><a href="#">커뮤니티</a>
                                    <ul class="dropdown">
                                        <li><a href="recipeList">레시피</a></li>
                                        <li><a href="boardList">자유게시판</a></li>
                                    </ul>
                                </li>
                                <li><a href="noticeList">공지사항</a></li>
                                <li><a href="qnaList">문의하기</a></li>
<!--                                 <li><a href="#">예시</a> -->
<!--                                     <ul class="dropdown"> -->
<!--                                         <li><a href="aboutUs">aboutUs</a></li> -->
<!--                                         <li><a href="blog">blog</a></li> -->
<!--                                         <li><a href="blogDetail">blogDetails</a></li> -->
<!--                                         <li><a href="classes">classes</a></li> -->
<!--                                         <li><a href="classesDetail">classesDetails</a></li> -->
<!--                                         <li><a href="contact">contact</a></li> -->
<!--                                         <li><a href="faq">faq</a></li> -->
<!--                                         <li><a href="pricing">pricing</a></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    