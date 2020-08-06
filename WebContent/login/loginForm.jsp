<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link href="login.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
<!-- Bootstrap JS -->
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<!-- Jquery -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
</head>
<body>
<div class="row">
    <div class="col-md-6 mx-auto p-0">
        <div class="card">
            <div class="login-box">
                <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label> <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
                    <div class="login-space">
                        <div class="login">
                        	<form action="loginPro.jsp" method="post">
                            <div class="group"> <label for="user" class="label">아이디</label> <input id="user" type="text" class="input" placeholder="아이디를 입력해주세요"> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input id="pass" type="password" class="input" data-type="password" placeholder="비밀번호를 입력해주세요"> </div>
                            <div class="group"> <input id="check" type="checkbox" class="check" checked> <label for="check"><span class="icon"></span> 아이디저장하기</label> </div>
                            <div class="group"> <input type="submit" class="button" value="로그인"> </div>
                            </form>
                            <div class="hr"></div>
                            <div class="foot"> <a href="#">비밀번호를 잊어버렸나요?</a> </div>
                        </div>
                        <div class="sign-up-form">
                            <div class="group"> <label for="user" class="label">아이디</label> <input id="user" type="text" class="input" placeholder="아이디를 입력해주세요"> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input id="pass" type="password" class="input" data-type="password" placeholder="영문숫자특수문자혼합 8자리이상"> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호확인</label> <input id="pass" type="password" class="input" data-type="password" placeholder="비밀번호를 한번 더 입력해주세요"> </div>
                            <div class="group"> <label for="pass" class="label">이메일주소</label> <input id="pass" type="text" class="input" placeholder="예시) ecodeda@ecodeda.com (@포함하여 입력)"> </div>
                            <div class="group"> <label for="pass" class="label">연락처</label> <input id="pass" type="text" class="input" placeholder="예시) 010-1234-5678 (-포함하여 입력)"> </div>
                            <div class="group"> <input type="submit" class="button" value="회원가입"> </div>
                            <div class="hr"></div>
                            <div class="foot"> <label for="tab-1">이미 회원입니까?</label> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>