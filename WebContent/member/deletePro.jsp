<%@page import="com.ecodeda.member.*"%>
<%@page import="com.ecodeda.board.*"%>
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
request.setCharacterEncoding("UTF-8");
String email = (String) session.getAttribute("email");
if(email == null){
	response.sendRedirect("../login/loginForm.jsp");
}
String pw = request.getParameter("pw");
%>
<%
//3.DAO객체생성 -> 결과를 리턴(1=정상처리 2=비번오류 -1=아이디가없음)
MemberDAO mdao = new MemberDAO();
int result = mdao.deleteMember(email, pw);

//4.데이터처리 -> 삭제후 login페이지로 이동
if(result == 1){
	session.invalidate(); //초기화 필수! 까먹지마!
	%>
	<script type="text/javascript">
	alert("회원정보삭제 성공");
	location.href="../main/main.jsp";
	</script>
	<%
}else if(result == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호오류로 회원정보삭제실패");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("존재하지않는 아이디입니다.");
	history.back();
	</script>
	<%
}
%>
</body>
</html>