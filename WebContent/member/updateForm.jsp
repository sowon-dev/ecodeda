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
System.out.println("updateForm이메일을 가져올까요? : "+email);
%>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>

<!-- 회원정보조회-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase"><%=mb.getName()%>님의 마이페이지</h2>
	        <form action="updatePro.jsp" method="post" id="contactForm" style="display:inline;margin:0px auto;">
	            <div class="row align-items-stretch mb-5" style="width: 2300px;">
	                <div class="col-md-6">
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="이메일" style="width: 114px;" readonly />
	                        <input class="form-control-mypage2" id="email" name="email" type="text" value="<%=mb.getEmail() %>" style="width: 344px;" readonly/>
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="비밀번호" style="width: 114px;" readonly />
	                        <input class="form-control-mypage2" id="pw" name="pw" type="password" placeholder="비밀번호를 입력하세요" style="width: 344px;" required />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="이름" style="width: 114px;" readonly />
	                        <input class="form-control-mypage2" id="name" name="name" type="text" value="<%=mb.getName() %>" style="width: 344px;" />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="연락처" style="width: 114px;" readonly />
	                        <input class="form-control-mypage2" id="phone" name="phone" type="text" value="<%=mb.getPhone() %>" style="width: 344px;" />
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control-mypage" type="text" value="주소" style="width: 114px;" readonly />
	                        <input class="form-control-mypage2" id="addr" name="addr" type="text"  value="<%=mb.getAddr() %>" style="width: 344px;" />
	                    </div>
	                </div>
	            </div>
			<div id="success"></div>
			<input type="button" class="btn btn-primary btn-xl text-uppercase" value="뒤로가기" class="button" onclick="location.href='./mypage.jsp'" style="padding:1rem 1.2rem">
			<input type="button" class="btn btn-primary btn-xl text-uppercase" value="회원정보수정" class="button" id="updatePro" onclick="" style="padding:1rem 1.2rem">
        	</form>
    	</div>
    </div>
</section>
<hr>

<!--input벼튼 updatePro넘기기 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" >


$(function(){
	$('#updatePro').click(function(){
	    let form = {
	            email : $('#email').val(),
	            pw : $('#pw').val(),
	            name : $('#name').val(),
	            phone : $('#phone').val(),
	            addr : $('#addr').val()
	        };
	    
        $.ajax({
            type: "POST", 
            url: "updatePro.jsp",
            data: form,
			success: function(result){
				alert(result)
				console.log("ajax click 성공");
			},error: function(){
				console.log("ajax click 실패");
			}
		});//ajax closed
		
	});//clickevent closed
	
	
});//jquery closed
</script>



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