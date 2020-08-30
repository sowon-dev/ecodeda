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
mdao.updatePwbyUser(email, pw);
session.invalidate();
%>
<script type="text/javascript">
alert("성공적으로 비밀번호가 변경되었습니다. 다시 로그인 하세요.");
location.href="../login/loginForm.jsp";
</script>