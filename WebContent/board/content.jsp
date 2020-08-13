<%@page import="java.util.ArrayList"%>
<%@page import="com.ecodeda.board.*"%>
<%@page import="com.ecodeda.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 커스텀 board CSS -->
<link href="board.css" rel="stylesheet" />
<title>글내용보기</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<%
//1. html테이블작성

//글번호(pk제약조건의 컬럼필수)에 해당하는 글의 정보를 가져오기
//2. 전달된 데이터 저장(bno, pageNum)

int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");


//3. DAO객체생성
BoardDAO bdao = new BoardDAO();

//4. 글의 조회수정보를 1증가 : DB에서처리 -> DAO객체에 updateReadCount(bno)메서드 생성
bdao.updateReadCount(bno);

//5. 화면(테이블)에 출력 (getBoard(bno))
// DAO객체에 글정보를 가져오는 메서드 생성
BoardBean bb = bdao.getBoard(bno);
//System.out.println(bdao.getBoard(bno));
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
			<td><%=bb.getEmail()%></td>
			<th>작성일</th>
			<td><%=bb.getDate()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=bb.getSubject()%></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3"><a href="D:\upfile\<%=bb.getFile()%>"><%=bb.getFile() %></a></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" height="300px"><%=bb.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				
				<% //현재페이지에 로그인 정보가 없거나 글쓴이 이름과 아이디가 다를 경우 수정,삭제버튼을 숨긴다
				//1.세션값 가져오기
				String email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅
				//2. 아이디가 존재하면서 이름과 아이디가 같은 경우
				if( email != null && email.equals(bb.getEmail())){
					%>
				<input type="button" value="글수정" class="btnn" onclick="location.href='updateForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글삭제" class="btnn" onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글쓰기" class="btnn" onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
					<%
				}
				%>
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