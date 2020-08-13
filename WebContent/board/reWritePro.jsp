<%@page import="com.ecodeda.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%//1. 한글처리
request.setCharacterEncoding("UTF-8");
%>
<!-- 2. 액션태그 사용하여 파라미터값 저장 -->
<jsp:useBean id="bb" class="com.ecodeda.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<%
//3.DAO생성
BoardDAO bdao = new BoardDAO();

//4. 데이터처리 : BoardDAO객체 안의 메서드 reInsertBoard(객체)
bdao.reInsertBoard(bb);
//5. 글목록 페이지로 이동
response.sendRedirect("boardList.jsp");
%>

</body>
</html>