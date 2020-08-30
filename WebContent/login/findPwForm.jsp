<%@page import="com.ecodeda.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<link href="login.css" rel="stylesheet" type="text/css">
<!--favicon -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
</head>

<body>
<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
%>
<!-- 4.팝업창구현  -->
<div class="card">
    <div class="login-box">
        <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">비밀번호 찾기</label> 
            <div class="login-space">
            	<div style="font-weight:bold;margin:5px 50px;">비밀번호 찾기는 1분정도 소요됩니다.</div>
                <div class="">
                	<form action="../login/findPwPro.jsp" method="post">
                     <div class="group"> <label for="user" class="label">이메일</label> 
                     					 <input name="email" type="text" class="input" placeholder="가입했던 이메일 주소를 입력하세요" required>
        			</div>
                     <div class="group"> <label for="name" class="label">이름</label> 
                     					 <input name="name" type="text" class="input" placeholder="이름을 입력하세요" required>
                     </div>
                     <div class="group"> <label for="user" class="label">연락처</label> 
                     					 <input id="phone" name="phone" type="text" class="input" placeholder="-포함하여 입력해주세요 예시) 010-1234-5678" required>
                     </div>
                     <div class="group"> <input type="submit" class="button" value="임시 비밀번호 발급" style="font-weight: bold;color:white;"> </div>
                 	</form>
                 	<div class="hr"></div>
                    <div class="foot"> <a href="../login/loginForm.jsp">로그인</a> | <a href="../index.jsp">홈페이지로 돌아가기</a></div>
                </div>
            </div>
          </div> 
	</div>
</div>

</body>
</html>