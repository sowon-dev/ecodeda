<%@page import="java.util.ArrayList"%>
<%@page import="com.ecodeda.board.*"%>
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
<link href="board.css" rel="stylesheet" />
<title>글내용보기</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");
BoardDAO bdao = new BoardDAO();
bdao.updateReadCount(bno);
BoardBean bb = bdao.getBoard(bno);
String email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅

//\w. : 64개의 문자 중에 임의로 일치하는 한 문자(.)중에 {2}자리
final String EMAIL_PATTERN = "([\\w.]{2})(?:[\\w.]*)(@.*)";
String emailMasking = bb.getEmail().replaceAll(EMAIL_PATTERN, "$1****");
%>

<fieldset id="fieldsetMe">
<legend id="legendMe">글 내용 보기</legend>
	<table id="tableMe" border="1">
		<tr>
			<th>글번호</th>
			<td><%=bno%></td>
			<th>조회수</th>
			<td><%=bb.getReadcount()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=emailMasking%></td>
			<th>작성일</th>
			<td><%=bb.getDate()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=bb.getSubject()%></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<%
			if(bb.getFile() == null){
			%>
			<td colspan="3"><a href="#">파일없음</a></td>
			<%
			}else{
				%>
			<td colspan="3"><a href="file_down.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile() %></a></td>
				<%
			}
			%>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" height="300px" width="700px"><%=bb.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				
				<% 
				email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅
				//2. 아이디가 존재하면서 이름과 아이디가 같은 경우
				if( email != null && email.equals(bb.getEmail())){
					%>
				<input type="button" value="글수정" class="btnn" onclick="location.href='updateForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글삭제" class="btnn" onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
					<%
				}
				%>
				<input type="button" value="답글쓰기" class="btnn" onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
				<input type="button" value="목록으로" class="btnn" 
					onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>'">
					<!-- location.href='boardList.jsp만 하면 5페이지보고있다가 다시 1페이지로 돌아가버린다
					이때 historyback하면 조회수가 올라가지않는다.
					따라서 pageNum을 가져와서 사용하면된다
					  -->
			</td>
		</tr>
	</table>
</fieldset>
<hr>
<!-- 댓글기능추가 Disqus API -->
<div id="disqus_thread" style="width: 1000px;margin-left: auto;margin-right: auto;"></div>
<script>
/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
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