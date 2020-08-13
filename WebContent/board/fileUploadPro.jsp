<%@page import="com.ecodeda.board.BoardDAO"%>
<%@page import="com.ecodeda.board.BoardBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body>
<!-- 파일 업로드 처리  -->
<%
//1. 파일 저장 위치 (가상경로) 만들기
// D:\workspace_jsp7\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileUpload/upload
//System.out.println("가상경로 : "+request.getRealPath("/upload"));
String uploadPath = request.getRealPath("/upload");
int maxSize = 10 * 1024 * 1024;
String email ="";
String subject ="";
String filename = ""; //서버에 올라갈 파일명
String OFilename = ""; //오리지널 파일명

try{
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

email = multi.getParameter("email");
subject = multi.getParameter("subject");
//5-2. 전달된 파일의 이름 확인
Enumeration files = multi.getFileNames(); //업캐스팅
String file1 = (String) files.nextElement(); //위의 업캐스팅한 걸 다운캐스팅
//5-3. 서버에 저장되는 파일 이름
filename = multi.getFilesystemName(file1);
System.out.println("filename : " + filename);
//5-4. 원래 파일이름
OFilename = multi.getOriginalFileName(file1);
System.out.println("OFilename : " + OFilename);
//여기까지 업로드 기능 구현 완료! => 6. 파일업로드는 예외가 많이때문에 예외처리를 해야한다

BoardBean bb = new BoardBean();
bb.setEmail(multi.getParameter("email"));
bb.setPw(multi.getParameter("pw"));
bb.setSubject(multi.getParameter("subject"));
bb.setContent(multi.getParameter("content"));

// bb.setFile(multi.getParameter("file")); //DB에 파일저장 불가->아래코드로 진행
bb.setFile(multi.getFilesystemName("file"));

//7. boardDAO객체생성
BoardDAO bdao = new BoardDAO();
//8. 글쓰기 메서드 호출
bdao.insertBoard(bb);
//9. 목록페이지로 이동
response.sendRedirect("boardList.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>

<form action="fileCheck.jsp" method="post" name="filecheck">
	<input type="hidden" name="email" value="<%=email%>"><br>
	<input type="hidden" name="subject" value="<%=subject%>"><br>
	<input type="hidden" name="filename" value="<%=filename%>"><br>
	<input type="hidden" name="ofilename" value="<%=OFilename%>"><br>   
</form>

</body>
</html>