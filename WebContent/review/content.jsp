<%@page import="com.ecodeda.review2.ReviewBean"%>
<%@page import="com.ecodeda.review2.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecodeda.member.*"%>
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
<title>수강후기 보기</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");
ReviewDAO rdao = new ReviewDAO();
ReviewBean rb = rdao.getReview(bno);
String email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅

//\w. : 64개의 문자 중에 임의로 일치하는 한 문자(.)중에 {2}자리
final String EMAIL_PATTERN = "([\\w.]{2})(?:[\\w.]*)(@.*)";
String emailMasking = rb.getEmail().replaceAll(EMAIL_PATTERN, "$1****");
%>

<fieldset id="fieldsetMe">
<legend id="legendMe">수강후기 보기</legend>
	<table id="tableMe" border="1">
		<tr>
			<th>작성자</th>
			<td><%=emailMasking%></td>
			<th>작성일</th>
			<td><%=rb.getDate()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=rb.getSubject()%></td>
		</tr>
		<tr>
			<th>이미지</th>
			<%			
			if(rb.getFile() == null){
			%>
			<td colspan="3"><a href="#">이미지파일없음</a></td>
			<%
			}else{
				%>
			<td colspan="3" class="reviewTD" disabled>
				<img id="LoadingImage" class="sameImgSize" src="../upload/<%=rb.getFile()%>">
				</a>
			</td>
				
				<%
			}
			%>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" height="300px" width="700px" style="white-space:pre;"><%=rb.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				
				<% 
				email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅
				//2. 아이디가 존재하면서 이름과 아이디가 같은 경우
				if( email != null){ 
					if(email.equals(rb.getEmail()) || email != null && email.equals("admin@admin.com")){
					%>
				<input type="button" value="수강후기 수정" class="btnn" onclick="location.href='updateForm.jsp?bno=<%=rb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="수강후기 삭제" class="btnn" onclick="location.href='deleteForm.jsp?bno=<%=rb.getBno()%>&pageNum=<%=pageNum%>'">
					<%
				}}
				%>
				<input type="button" value="목록으로" class="btnn" onclick="location.href='reviewList.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</fieldset>
<hr>
<!-- 댓글기능추가 Disqus API -->
<div id="disqus_thread" style="width: 1000px;margin-left: auto;margin-right: auto;"></div>
<script>
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://ecodeda.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

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