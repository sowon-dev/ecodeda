<%@page import="com.ecodeda.member.*"%>
<%@page import="com.ecodeda.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<body>
<%
//1. 한글처리 & 로그인여부체크 ->로그인페이지이동
request.setCharacterEncoding("UTF-8");
String email = (String) session.getAttribute("email");
if (email == null) {
	response.sendRedirect("../login/loginForm.jsp");
}
%>
<!-- 2. 액션태그사용 : 전달된 정보를 저장(아이디,비번,이름,나이,성별,이멜) -->
<jsp:useBean id="mb" class="com.ecodeda.member.MemberBean" />
<!-- 2-1. 파라미터 값 저장 -->
<jsp:setProperty property="*" name="mb"/>

<%//3. MeberDAO객체 생성
MemberDAO mdao = new MemberDAO();
//4. 데이터처리 : 1-수정완료, 0-비번오류, -1-아이디없음
int result = mdao.updateMember(mb);
System.out.println("updatePro의 mb가 이메일을 가져올까요? : "+mb+", result: "+result);
if(result == 1){
	%>
	<script type="text/javascript">
	alert("회원정보수정 성공");
	location.href="mypage.jsp";
	</script>
	<%
}else if(result == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호오류로 회원정보수정실패");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("존재하지않는 회원입니다.");
	location.href="mypage.jsp";
	</script>
	<%
}

%>
</body>
</html>