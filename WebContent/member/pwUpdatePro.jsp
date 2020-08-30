<%@page import="java.io.PrintWriter"%>
<%@page import="com.ecodeda.member.*"%>
<%@page import="com.ecodeda.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//1. 한글처리 & 로그인여부체크 ->로그인페이지이동
request.setCharacterEncoding("UTF-8");
String email = (String) session.getAttribute("email");
if (email == null) {
	response.sendRedirect("../login/loginForm.jsp");
}
String pw = request.getParameter("pw");
%>

<%//3. MeberDAO객체 생성
MemberDAO mdao = new MemberDAO();
//4. 데이터처리 : 1-수정완료, 0-비번오류, -1-아이디없음
int result = mdao.idCheck(email, pw);
response.setContentType("text/html; charset=UTF-8");
if(result == 1){
	response.sendRedirect("pwUpdateForm2.jsp");
}else if(result == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("알 수 없는 오류입니다. 다시 시도하세요");
	history.back();
	</script>
	<%
}
%>