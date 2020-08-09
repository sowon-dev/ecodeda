<%@page import="com.ecodeda.member.MemberBean"%>
<%@page import="com.ecodeda.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
 <!-- favicon  -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap) Bootstrap core CSS -->
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
<%//1.한글처리, 파라미터 
request.setCharacterEncoding("UTF-8");
String email = (String) session.getAttribute("email");//object를 string으로 다운캐스팅
//1-1. id없이는 진입불가, id없는 경우 로그인페이지로 이동
if(email == null){
	response.sendRedirect("../login/loginForm.jsp");
}
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(email);
%>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>

<!-- 회원정보조회-->
<%
if(mb != null){
%>
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase"><%=mb.getName()%>님의 마이페이지</h2>
	        <form id="contactForm" name="sentMessage" style="display:inline;margin:0px auto;">
	            <div class="row align-items-stretch mb-5">
	                <div class="col-md-6">
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="이메일" readonly></input>
	                        <input class="form-control-mypage2" id="email" type="text" value="<%=mb.getEmail() %>" readonly/>
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="비밀번호" readonly></input>
	                        <input class="form-control-mypage2" id="pw" type="password" value="" readonly/>
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="이름" />
	                        <input class="form-control-mypage2" id="name" type="text" value="<%=mb.getName() %>" />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="연락처" />
	                        <input class="form-control-mypage2" id="phone" type="text" value="<%=mb.getPhone() %>" />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="주소" />
	                        <input class="form-control-mypage2" id="addr" type="text" value="<%=mb.getAddr() %>" />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="가입일자" />
	                        <input class="form-control-mypage2" id="reg_date" type="text" value="<%=mb.getReg_date() %>" />
	                    </div>
	                </div>
	            </div>
			<div id="success"></div>
			<input type="button" class="btn btn-primary btn-xl text-uppercase" value="회원정보수정" class="button" onclick="location.href='updateForm.jsp'">
			<input type="button" class="btn btn-primary btn-xl text-uppercase" value="회원탈퇴" class="button" onclick="location.href='deleteForm.jsp'">
        	</form>
    	</div>
    </div>
</section>
<% 
} 
%>
<hr>

<!-- 관리자일때만 메뉴확인가능 -->
<% if(email != null){
	if(email.equals("admin")){ %>
	<input type="button" value="회원전체목록(관리자용)" class="button" onclick="location.href='memberList.jsp'">
<%
	}
}
%>

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