<%@page import="com.ecodeda.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<%
//1. 한글처리 
request.setCharacterEncoding("UTF-8");

%>
<!-- 2. 전달되는 데이터 입력(저장) => 자바빈 객채, 액션태그사용-->
<jsp:useBean id="mb" class="com.ecodeda.member.MemberBean" />
<jsp:setProperty property="*" name="mb"/>
<%

//4. MemberDAO객체생성 -> 전달받은 정보 모두 저장
MemberDAO mdao = new MemberDAO();

//5. 회원 가입 메서드 (insertMember())
mdao.insertMember(mb);
%>

<script type="text/javascript">
alert("회원가입성공")
location.href="loginForm.jsp";
</script>
</body>
</html>