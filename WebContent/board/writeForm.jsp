<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<!-- 커스텀 board CSS -->
<link href="board.css" rel="stylesheet" />
<title>게시판 글쓰기</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
String email = (String) session.getAttribute("email");
if( email == null){
	%>
	<script type="text/javascript">
	alert("로그인 후 이용가능합니다");
	location.href="../login/loginForm.jsp"
	</script>
	<%
}
%>
<fieldset id="fieldsetMe">
<legend id="legendMe">게시판 글쓰기</legend>
	<form action="writePro.jsp" method="post" name="fr" id="formMe">
		<div id="centerMe">
			<label for="name" class="lableMe"> 글쓴이 </label> 
			<input type="text" name="name" required><br>
			<label for="pw" class="lableMe">  비밀번호 </label>
			<input type="password" name="pw" required><br>
			<label for="title" class="lableMe"> 제목 </label>
			<input type="text" name="subject" maxlength="15" required><br>
			<label for="content" class="lableMe"> 내용 </label><br> 
			<textarea rows="10" cols="35" name="content" placeholder="여기에 작성해주세요" required></textarea><br>
		</div>
		<input type="submit" value="글등록" class="btnn">
	  	<button type="reset" class="btnn">초기화</button>
	  	<input type="button" value="목록으로" class="btnn" onclick="location.href='boardList.jsp'">
	</form>

</fieldset>
<hr>
<!-- Footer랑 js랑 세트  -->
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