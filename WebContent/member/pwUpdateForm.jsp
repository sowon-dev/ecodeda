<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<!-- 커스텀 board CSS -->
<link href="../board/board.css" rel="stylesheet" />
<title>비밀번호수정</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
String email = (String) session.getAttribute("email");
if( email == null ){
	 response.sendRedirect("../login/loginForm.jsp");
}
%> 
<fieldset id="fieldsetMe">
	<legend id="legendMe">비밀번호 확인하기</legend>
	<form action="pwUpdatePro.jsp" method="post" id="formMe">
	<!-- input타입중 hidden은 화면에 있는 해당 input태그를 숨겨서 정보 전달   -->
		<input type="text" class="lableMe" value="이메일" readonly/>
		<input type="text" name="email" class="inputMe" value="<%=email %>" readonly><br>
		<input type="text" class="lableMe" value="비밀번호" readonly/>
		<input type="password" name="pw" class="inputMe" placeholder="비밀번호 변경을 위해 한 번 더 로그인하세요"><br>
		<input type="submit" value="비밀번호 확인" class="btnn">
		<input type="button" value="뒤로가기" class="btnn" onclick="location.href='../main/main.jsp'">
	</form>
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