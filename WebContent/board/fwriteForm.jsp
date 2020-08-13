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
<title>게시판 파일업로드</title>
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
	<form action="fileUploadPro.jsp" method="post" name="fr" id="formMe" enctype="multipart/form-data">
		<div id="centerMe">
			<input type="text" class="lableMe" value="작성자" readonly/>
			<input type="text" name="email" class="inputMe" value="<%=email %>" readonly><br>
			<input type="text" class="lableMe" value="비밀번호 " readonly/>
			<input type="password" name="pw" class="inputMe" required><br>
			<input type="text" class="lableMe" value="제목" readonly/>
			<input type="text" name="subject" maxlength="15" class="inputMe" required ><br>
			<input type="text" class="lableMe" value="파일" readonly/>
			<input type="file" name="file" class="inputMe">
			<input type="text" class="lableMe" value="내용 " style="margin-right: 460px;" readonly/><br>
			<textarea rows="10" cols="35" name="content" class="inputMe" placeholder="여기에 작성해주세요" style="width: 572px;" required></textarea><br>
		</div>
		<input type="submit" value="글등록" class="btnn">
	  	<button type="reset" class="btnn">초기화</button>
	  	<input type="button" value="목록으로" class="btnn" onclick="location.href='boardList.jsp'">
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