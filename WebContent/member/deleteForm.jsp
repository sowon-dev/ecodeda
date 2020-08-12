<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<%
String email = (String) session.getAttribute("email");
if( email == null ){
	 response.sendRedirect("../login/loginForm.jsp");
}
%> 
<fieldset>
	<legend>회원탈퇴</legend>
	<form action="deletePro.jsp" method="post">
	<!-- input타입중 hidden은 화면에 있는 해당 input태그를 숨겨서 정보 전달   -->
		이메일 : <input type="hidden" name="email" value="<%=email %>" readonly><br>
		비밀번호 : <input type="password" name="pw"><br>
		<input type="submit" value="탈퇴하기">
		<input type="button" value="뒤로가기" onclick="location.href='../main/main.jsp'">
	</form>
</fieldset>
</body>
</html>