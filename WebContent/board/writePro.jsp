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

//6. 로그인한사람만 글쓸수있음
String email = (String) session.getAttribute("email");
if( email == null){
	%>
	<script type="text/javascript">
	alert("로그인 후 이용가능합니다");
	history.back();
	</script>
	<%
}
%>
<!-- 2. 액션태그사용 : 전달된 정보를 저장(bno, name, pw 등등) - 자바빈객체에 저장-->
<jsp:useBean id="bb" class="com.ecodeda.board.BoardBean" />
<!-- 2-1. 파라미터 값 저장 
jsp:setProperty의 동작
- 1. String name = request.getParameter("bno")
- 2. bb.setbno(bno)
등등 모든 변수의 1번2번동작을 한꺼번해 처리해줌 -->
<jsp:setProperty property="*" name="bb"/>
<%//2-2. 전달정보 확인위한 출력 : null인 값들은 별로도 추가해줘야한다.
//System.out.println(bb); //bb.toString()과 동일한 동작

//3. 디비처리작업진행 : boardDAO객체 생성
BoardDAO bdao = new BoardDAO();

//4. 데이터처리 : BoardDAO객체 안의 메서드 중 글스기 기능을 하는 메서드 호출
bdao.insertBoard(bb);

// 5. 글목록 페이지로 이동
response.sendRedirect("boardList.jsp");
%>
</body>
</html>