<%@page import="com.ecodeda.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제</title>
</head>
<body>
<%
//1. 한글처리
request.setCharacterEncoding("UTF-8");
//2. 파라미터저장(액션태그사용 & pageNum은 파라미터로) 
int bno = Integer.parseInt(request.getParameter("bno"));
String pageNum = request.getParameter("pageNum");
String pw = request.getParameter("pw");
//3. DAO생성
BoardDAO bdao = new BoardDAO();
//4. 정보수정메서드 updateBoard(bb) 
// -> 결과를 정수형 데이터로 리턴 (1=>정상처리, 0=>비번오류, -1=>해당글없음)
int result = bdao.deleteBoard(bno, pw);
if(result == 1){
	%>
	<script type="text/javascript">
		alert("정상적으로 글 삭제되었습니다");
		location.href="boardList.jsp";
	</script>
	<% 
}else if(result == 0){
	%>
	<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
	</script>
	<% 
}else{
	%>
	<script type="text/javascript">
		alert("존재하지않는 게시글입니다");
		history.back();
	</script>
	<%
}
%>
</body>
</html>