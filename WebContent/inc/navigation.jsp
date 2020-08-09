<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Navigation-->
<%
String email = (String) session.getAttribute("email");
%>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="resources/assets/img/navbar-logo.svg" alt="" /></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" 
        		aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            	메뉴
            <i class="fas fa-bars ml-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ml-auto">
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">강의로드맵</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">모든강의</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">수강후기</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#community">커뮤니티</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">회사소개</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">고객센터</a></li>
                <%
                if(email != null){
                %>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="./mypage/mypage.jsp">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="./login/logout.jsp">로그아웃</a></li>
                <%	
                }else{
                %>
                <li class="nav-item"><a class="nav-link js-scroll-trigger" href="./login/loginForm.jsp"> 로그인 | 회원가입 </a></li>
                <%
                }
                %>
            </ul>
        </div>
    </div>
</nav>