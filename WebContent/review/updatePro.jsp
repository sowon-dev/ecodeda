<%@page import="com.ecodeda.review2.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강후기 수정</title>
</head>
<body>
<%//1. 한글처리
request.setCharacterEncoding("UTF-8");
//2. 파라미터저장(액션태그사용 & pageNum은 파라미터로) 
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="rb" class="com.ecodeda.review2.ReviewBean"></jsp:useBean>
<jsp:setProperty property="*" name="rb"/>
<% //3. DAO생성
ReviewDAO rdao = new ReviewDAO();
//4. 정보수정메서드 updateBoard(bb) 
// -> 결과를 정수형 데이터로 리턴 (1=>정상처리, 0=>비번오류, -1=>해당글없음)
int result = rdao.updateReview(rb);
if(result == 1){	
	  %>
	   <script type="text/javascript">
	     alert("수강후기가 수정되었습니다.");
	     location.href='reviewList.jsp?pageNum=<%=pageNum%>';		     
	   </script>		  
	  <%
}else if(result == 0){
	%>
	<script type="text/javascript">
	 alert("비번이 일치하지않습니다.");
	 history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	 alert("존재하지 않는 글입니다.");
	 history.back();
	</script>
	<%
}
%>
</body>
</html>