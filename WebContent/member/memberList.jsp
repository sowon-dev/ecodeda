<%@page import="java.util.ArrayList"%>
<%@page import="com.ecodeda.member.MemberDAO"%>
<%@page import="com.ecodeda.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<title>관리자용 회원목록</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<!-- 커스텀 board CSS -->
<link href="../board/board.css" rel="stylesheet"/>
<%
//1. 로그인세션제어(관리자는 제외)
String email = (String) session.getAttribute("email");//다운캐스팅
if(email == null || !email.equals("admin@admin.com")){ //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
	response.sendRedirect("../login/loginForm.jsp");
}
//2. DAO객체생성
MemberDAO mdao = new MemberDAO();

//3. 회원목록을 가져오는 메서드 사용
mdao.getMemberList();
ArrayList memberList = mdao.getMemberList();
%>

<fieldset id="fieldsetMe"> <legend id="legendMe">회원목록</legend>
<table id="tableMe">
	<div id="contents">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>주소</td>
			<td>연락처</td>
			<td>회원가입일</td>
		</tr>
		<%//반복문
		//ArrayList는 가변배열이므로 length가 없고 size가 존재한다.
		//size()메서드는 배열의 요소의 갯수를 리턴
		for(int i=0;i<memberList.size(); i++){
			MemberBean mb = (MemberBean) memberList.get(i);
			if(!mb.getEmail().equals("admin@admin.com")){
		%>
		<tr>
			<td><%=mb.getEmail() %></td>
			<td><%=mb.getName() %></td>
			<td><%=mb.getPw() %></td>
			<td><%=mb.getAddr() %></td>
			<td><%=mb.getPhone() %></td>
			<td><%=mb.getReg_date() %></td>
		</tr>
		<%
		}}
		%>
	</div>
</table>
</fieldset>

<!-- Footer랑 js랑 세트  -->
<hr>
<!-- Footer-->
<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Contact form JS-->
<script src="../resources/assets/mail/jqBootstrapValidation.js"></script>
<script src="../resources/assets/mail/contact_me.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/scripts.js"></script>

</body>
</html>