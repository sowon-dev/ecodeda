<%@page import="com.ecodeda.review2.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<!-- 커스텀 board CSS 모든페이지에 필요 -->
<link href="../board/board.css" rel="stylesheet" />
<title>수강후기 수정</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
request.setCharacterEncoding("UTF-8");
int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");

ReviewDAO rdao = new ReviewDAO();
ReviewBean rb = rdao.getReview(bno);

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
<legend id="legendMe">수강후기 수정하기</legend>
	<form action="updatePro.jsp?bno=<%=rb.getBno()%>&pageNum=<%=pageNum %>" method="post" name="fr" id="formMe" enctype="multipart/form-data">
		<div id="centerMe">
			<input type="hidden" name="bno" value="<%=rb.getBno() %>">
			<input type="text" class="lableMe" value="이메일" readonly/>
			<input type="text" name="email" class="inputMe" value="<%=rb.getEmail() %>" readonly><br>
			<input type="text" class="lableMe" value="작성자" readonly/>
			<input type="text" name="name" class="inputMe" value="<%=rb.getName() %>" readonly><br>
			<input type="text" class="lableMe" value="비밀번호 " readonly/>
			<input type="password" name="pw" class="inputMe" placeholder="비밀번호를 입력해주세요" required><br>
			<input type="text" class="lableMe" value="제목" readonly/>
			<input type="text" name="subject" maxlength="15" class="inputMe" value="<%=rb.getSubject() %>" required ><br>
			<input type="text" class="lableMe" value="파일" readonly/>
			<input type="file" name="file" class="inputMe" value="<%=rb.getFile() %>" required>
			<input type="text" class="lableMe" value="내용 " style="margin-right: 460px;" readonly/><br>
			<textarea rows="10" cols="35" name="content" class="inputMe" style="width: 572px;" required><%=rb.getContent() %></textarea><br>
		</div>
		<input type="submit" value="수정하기" class="btnn">
	  	<input type="button" value="목록으로" class="btnn" onclick="location.href='reviewList.jsp'">
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