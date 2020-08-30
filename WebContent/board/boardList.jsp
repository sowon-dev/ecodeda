<%@page import="com.ecodeda.board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<title>게시글목록</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<!-- 커스텀 board CSS -->
<link href="board.css" rel="stylesheet"/>
<%
BoardDAO bdao = new BoardDAO();
int cnt = bdao.getBoardCount();

//7. 페이징처리 (이미 유명한 알고리즘 공식, 사용법만 알면 됨)
//7-1. 한 페이지에서 보여줄 글의 개수 설정(5개, 변경가능)
int pageSize = 10; 
//7-2. 지금 내가 몇페이지에 있는 확인
//페이지번호는 숫자인데 왜 String으로 하는지 ? => 연산을 할 것이 아니라서
String pageNum = request.getParameter("pageNum");
//7-3. 페이지번호정보가 없을 경우 내가 보는 페이지가 첫페이지가 되도록
if(pageNum == null){ 
	pageNum ="1";
}
//7-4. 시작행번호계산
//10개씩 컬럼 나누고 2페이지에서 시작행이 11이되고 3페이지에서 시작행이 21이 되기
int currentPage = Integer.parseInt(pageNum); //String을 integer로 변환
int startRow = (currentPage-1)*pageSize + 1;
//currentPage가 2인경우, (2-1)x10+1 = 11
//currentPage가 3인경우, (3-1)x10+1 = 21

//7-5. 끈행번호계산
int endRow= currentPage * pageSize;
//currentPage가 2인경우, 2*10 = 20
//currentPage가 3인경우, 3*10 = 30

//System.out.println(bdao.getBoardList());
ArrayList boardList = null;
if(cnt != 0){
	//일반
	//boardList = bdao.getBoardList();
	//7-6. 페이징 처리한 리스트 호출 => getBoardList()메서드만들기(메서드 오버로딩)
	boardList = bdao.getBoardList(startRow, pageSize);
} 

//6. 게시판 모든 내용을  화면에 출력
String email = (String) session.getAttribute("email");
%>
<fieldset id="fieldsetMe">
<legend id="legendMe">커뮤니티</legend>
	<div id="contents">
	게시판 총 글의 수 : <%=cnt%> 개
	<%
	if(email == null){
	%>
	<input class="btnn" type="button" value="로그인 후 글쓰기" onclick="location.href='../login/loginForm.jsp'">
	<%
	}else if( email != null){
		%>
	<input class="btnn" type="button" value="글쓰기" onclick="location.href='fwriteForm.jsp'">	
		<%
	}
	%>
	<br>
	<table id="tableMe">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	<tr>
		<!-- 페이지 역순으로 나타내기  -->
<%-- 	<c:forEach items="${boardList }" var="board" varStatus="status">
		<td> ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
		</c:forEach> --%>
		<%//반복문
		for(int i=0;i<boardList.size(); i++){
			BoardBean bb = (BoardBean) boardList.get(i);
			
			final String EMAIL_PATTERN = "([\\w.]{2})(?:[\\w.]*)(@.*)";
			String emailMasking = bb.getEmail().replaceAll(EMAIL_PATTERN, "$1****"); //항상 6자리출력
		%>
		<td><%=bb.getBno()%></td>
		<td>
		<%
		int wid = 0;
		if(bb.getRe_lev() > 0){
			wid= 10 * bb.getRe_lev(); //레벨값의 10을 곱한 값만큼 이미지 가로길이를 길게해줌
		%>
		<img src="level.gif" width="<%=wid%>" height="15">
		<img src="re.gif">
		<% } %>
		<a style="color:black;" href="content.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a>
		</td>
		<td><%=emailMasking%></td>
		<td><%=bb.getReadcount()%></td>
		<td><%=bb.getDate()%></td>
	</tr>
	<%
	}
	%>
	</table>
	</div>
</fieldset>
<%
//8. 페이지 이동버튼
if(cnt != 0){ //cnt는 전체 글 갯수
	//8-1. 페이지갯수처리
	//전체페이지 50개이고 화면에 10개씩 출력 => 5페이지만 있으면됨
	//전체페이지 57개이고 화면에 10개씩 출력 => 6페이지만 있으면됨	
	//삼항연산자로 처리
	int pageCount = cnt/pageSize + (cnt%pageSize == 0? 0:1);
	
	//8-2. 화면에 보여줄 페이지번호의 갯수(페이지블럭)
	int pageBlock = 3; //페이지에 10개 페이지갯수 보여줌
	
	//8-3. 페이지블럭의 시작페이지번호
	//현재 11페이지면, (11-1)/10 * 10 + 1 = 11
	int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
	
	//8-4. 페이지블럭의 끝페이지번호
	int endPage = startPage + pageBlock - 1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
	
	//8-5. 이전, 숫자, 다음처리
	// 이전
	%>
	<div id="pageBlock">
	<%
	if(startPage > pageBlock){
		%>
		<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">   이전   </a>
		<%
	}
	
	//숫자
	for(int i=startPage; i<=endPage; i++){
		%>
		<a href ="boardList.jsp?pageNum=<%=i%>">   <%=i%>   </a>
		<%
	}
	//다음
	if(endPage < pageCount){
		%>
		<a href ="boardList.jsp?pageNum=<%=startPage+pageBlock%>">   다음   </a>
		<%
	}
	%>
	</div>
	<%
}
%>
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