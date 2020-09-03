<%@page import="java.io.PrintWriter"%>
<%@page import="com.ecodeda.member.*"%>
<%@page import="com.ecodeda.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//1. 한글처리 & 로그인여부체크 ->로그인페이지이동
request.setCharacterEncoding("UTF-8");
String email = (String) session.getAttribute("email");
if (email == null) {
	response.sendRedirect("../login/loginForm.jsp");
}
//2.액션태그사용 : 전달된 정보를 저장(아이디,비번,이름,나이,성별,이멜)
//2-1. 파라미터 값 저장
%>
<jsp:useBean id="mb" class="com.ecodeda.member.MemberBean" />
<jsp:setProperty property="*" name="mb"/>

<%//3. MeberDAO객체 생성
MemberDAO mdao = new MemberDAO();
//4. 데이터처리 : 1-수정완료, 0-비번오류, -1-아이디없음
int result = mdao.updateMember(mb);
//System.out.println("updatePro의 mb가 이메일을 가져올까요? : "+mb+", result: "+result);
PrintWriter ot = response.getWriter();
response.setContentType("text/html; charset=UTF-8");
if(result == 1){
	ot.println("성공적으로 회원정보가 수정되었습니다");
}else if(result == 0){
	ot.println("비밀번호오류로 회원정보수정이 실패했습니다");
}else{
	ot.println("비밀번호를 입력하세요");
}
%>