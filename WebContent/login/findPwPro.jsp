<%@page import="com.ecodeda.member.MakeRandomNum"%>
<%@page import="java.util.Random"%>
<%@page import="com.ecodeda.member.FindPw"%>
<%@page import="com.ecodeda.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
System.out.println("데이터가져오기: " +email+name+phone);

MemberDAO mdao = new MemberDAO();
int result = mdao.findPw(email, name, phone);
if(result == 1){
	/* 임시이메일 보내기 객체생성 */
	FindPw fp = new FindPw();
	MakeRandomNum r = new MakeRandomNum();
	String rNum = r.excuteGenerate();
	fp.send("(주)이코드다에서 고객님의 요청으로 발행된 임시 비밀번호입니다. 본인이 아닌 경우 (주)이코드다로 유선연락주세요.임시 비밀번호: "+rNum, email);
	mdao.updatePw(email, rNum);
	%>
	<script type="text/javascript">
		alert("임시비밀번호가 발급되었습니다. 이메일을 통해 확인하세요");
		location.href="../login/loginForm.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("입력 정보가 일치하지 않습니다. 다시 입력하세요");
		history.back();
	</script>	
	<%
}
%>
</body>
</html>