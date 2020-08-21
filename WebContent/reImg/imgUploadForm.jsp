<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 등록</title>
<script type="text/javascript">
	function sendIt() {
	    f = document.myForm;
	    str = f.subject.value;
	    str = str.trim();
	    if(!str) {
	        alert("제목을 입력하세요 !!!");
	        f.subject.focus();
	        return;
	    }
	    f.subject.value = str;
	    str = f.uploadFile.value;
	    if(!str) {
	        alert("이미지 파일을 선택 하세요 !!!");
	        f.uploadFile.focus();
	        return;
	    }
	    f.action="/image/write_ok.do";
	    f.submit();
	}

</script>
</head>
<body>
<form action="<%=cp%>/image/write_ok.do" method="post" enctype="multipart/form-data" name="myForm">
<table cellpadding="2" id="bbs">
<tr>
	<td id="bbs_title" colspan="3">
	이미지 등록
	</td>
</tr>
<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
<tr>
	<td align="center" width="100">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
	<td colspan="2" >
	<input type="text" name="subject" class="boxTF" size="74"/></td>
</tr>
<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
<tr>
	<td align="center">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
	<td class="bbsCreated_bottomLine" colspan="2" >
	<input type="file" name="uploadFile" class="boxTF" size="74"/></td>
</tr>
<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
<tr id="bbsCreated_footer">
	<td colspan="3" align="center">
	<input type="button" value="파일등록" onclick="sendIt()"/>
	<input type="button" value="다시입력" onclick="document.myForm.subject.focus();"/>
	<input type="button" value="작성취소" onclick="javascript:location.href='<%=cp %>/image/list.do';"/></td>
</tr>
</table>
</form>
</body>
</html>