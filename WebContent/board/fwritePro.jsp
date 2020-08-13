<%@page import="com.ecodeda.board.*"%>
<%@page import="com.ecodeda.member.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일업로드</title>
</head>
<body>
<%
String savePath = "d:\\upfile"; 
// 보통은 20~250MB (1MB = 1024바이트 * 1024바이트)
int maxSize =  20 * 1024 * 1024;
MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,"UTF-8", new DefaultFileRenamePolicy());
out.println("파일 업로드 완료!");
BoardBean bb = new BoardBean();
bb.setEmail(multi.getParameter("email"));
bb.setPw(multi.getParameter("pw"));
bb.setSubject(multi.getParameter("subject"));
bb.setContent(multi.getParameter("content"));

// bb.setFile(multi.getParameter("file")); //DB에 파일저장 불가->아래코드로 진행
bb.setFile(multi.getFilesystemName("file"));
System.out.println("upfile에 저장된 파일명 : "+multi.getFilesystemName("file"));
System.out.println("사용자가 올린  원본 파일명 : "+multi.getOriginalFileName("file"));

//7. boardDAO객체생성
BoardDAO bdao = new BoardDAO();
//8. 글쓰기 메서드 호출
bdao.insertBoard(bb);
//9. 목록페이지로 이동
response.sendRedirect("boardList.jsp");
%>
</body>
</html>