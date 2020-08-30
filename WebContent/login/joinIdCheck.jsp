<%@page import="com.ecodeda.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 아이디중복체크</title>
<link href="login.css" rel="stylesheet" type="text/css">
<!--favicon -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
</head>
<body style="width:360px;height:387px">
<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("userid");

//2. MemberDAO객체생성 -> 전달받은 정보 모두 저장
MemberDAO mdao = new MemberDAO();

//3. joinIdCheck(ID)메서드
int result = mdao.joinIdCheck(email);
%>
<div style="background:rgba(254, 209, 54, 0.7);padding:20px;">
<div class="login-space">
<%
if (result == 1){
	out.print("사용가능한 이메일입니다");	
	//5. 아이디사용하기버튼추가 => 동기방식사용 but 요즘은 비동기방식을 더 많이사용한다
	%>
		<p></p>
		<div class="group"> <input type="button" class="button" value="아이디 사용하기" onclick="result();"></div>
	<%
}else if(result == 0){
	out.print("이미 사용중인 이메일입니다.<br>다른 이메일을 적어주세요.");
	%>
	<p></p>
	<%
}else{
	out.print("알수없는 에러 : 다시 진행해주세요"); 
}
%>
<!-- 4.팝업창구현  -->
		<form action="joinIdCheck.jsp" method="post" name="wfr" class="sign-up-form">
			<div class="group"><label for="email" class="label"> Email</label> <input type="email" class="input" name="userid" value="<%=email%>"></div>
			<div class="group"> <input type="submit" value="중복 확인" class="button" >	 </div>
		</form>
</div>
</div>


<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	//팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
    	//팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
    	//alert("팝업창의 id값"+document.wfr.userid.value + ", 회원가입창의 id값 : " +opener.document.fr.id.value)
    	//6-1. 회원가입페이지의 id값에 아이디중복으로 선택된 id값을 대입.
    	opener.document.fr.email.value = document.wfr.userid.value;
    	
    	//6-3. 회원가입창 제어
    	//readonly 속성제어(커멜표기가 아닐때는 제어가 안됨 신기하네 ㅋㅋㅋ)
    	opener.document.fr.email.readOnly=true;
    	
    	//6-2. 창닫기
    	window.close();
    }
 
 </script>

</body>
</html>