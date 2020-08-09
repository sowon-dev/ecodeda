<%@page import="com.ecodeda.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<% //1. 한글처리 및 변수가져오기
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email1");
String pw = request.getParameter("pw1");
//2. MemberDAO객체생성 -> idcheck(id, pw) 메서드생성
MemberDAO mdao = new MemberDAO();
int result = mdao.idCheck(email, pw);
//3.데이터처리
if(result == 1){
	//아이디값을 세션객체에 저장
	session.setAttribute("email", email); //두번째파라미터에서 업캐스팅발생 object->String
	System.out.println("아디일치비번일치->로그인성공");
	response.sendRedirect("../index.jsp?id");
}else if(result == 0){
	System.out.println("아디일치,비번불일치->로그인실패");
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다");
		history.back();
	</script>
	<%
}else{
	System.out.println("아디불일치,비번불일치->로그인실패");	
	%>
	<script type="text/javascript">
		alert("존재하지않는 아이디입니다");
		location.href="loginForm.jsp";
	</script>
	<%
}

%>
</body>
</html>