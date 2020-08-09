<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link href="login.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
<!-- Bootstrap JS -->
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<!-- Jquery -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<!--favicon -->
<link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="row">
    <div class="col-md-6 mx-auto p-0">
        <div class="card">
            <div class="login-box">
                <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label> 
                						<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
                    <div class="login-space">
                        <div class="login">
                        	<form action="loginPro.jsp" method="post">
	                            <div class="group"> <label for="user" class="label">이메일</label> <input name="email1" type="text" class="input" placeholder="이메일 주소를 입력해주세요"> </div>
	                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input name="pw1" type="password" class="input" data-type="password" placeholder="비밀번호를 입력해주세요"> </div>
	                            <div class="group"> <input id="check" type="checkbox" class="check" checked> <label for="check"><span class="icon"></span> 아이디저장하기</label> </div>
	                            <div class="group"> <input type="submit" class="button" value="로그인" style="font-weight: bold;color:white;"> </div>
	                        </form>
                            <div class="hr"></div>
                            <div class="foot"> <a href="#">비밀번호 찾기</a> | <a href="../index.jsp">홈페이지로 돌아가기</a></div>
                        </div>
                        <form action="joinPro.jsp" method="post" class="sign-up-form" id="join" name="fr">
                            <div class="group"> <label for="email" class="label">이메일
                            	<input type="button" class="button" onclick="winopen();" value="중복 확인" style="font-size:12px;width:80px;display:inline;padding:5px 0;margin-bottom:3px;color:white;"><br> </label>
                            	<input id="email" name="email" type="email" class="input" onkeyup="emailCheckFunc()" placeholder="이메일 주소를 입력해주세요(아이디로 사용됩니다)." required> 
                            	<div id="emaillcheckMsg" style="font-size:12px; display:none; margin-bottom:-5px; margin-bottom:5px; font-weight:bold; text-align:center;"></div>
                            </div>
                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input name="pw" type="password" class="inputpw" data-type="password" onkeyup="pwCheckFunc()" placeholder="영문숫자특수문자혼합 8자리이상 입력해주세요" required> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호확인</label> <input name="pw2" type="password" class="inputpw" data-type="password" onkeyup="pwCheckFunc()" placeholder="비밀번호를 확인해주세요" required> </div>
                            <div id="pwCheckFuncMsg" style="font-size:12px; display:none; margin-bottom:-5px; margin-bottom:5px; font-weight:bold; text-align:center;"></div>
                            <div class="group"> <label for="userName" class="label">이름</label> <input id="name" name="name" type="text" class="input" placeholder="한글로 공백없이 입력해주세요" required> </div>
                            <div class="group"> <label for="userAddr" class="label">주소 <input type="button" class="button" onclick="daumPostcode()" value="주소 찾기" style="font-size:12px;width:80px;display:inline;padding:5px 0;margin-bottom:3px;color:white;"><br> </label>
                        	    <input type="hidden" id="sample4_postcode" placeholder="우편번호"> 
                            	<input type="text" name="addr" id="sample4_roadAddress" class="input" placeholder="주소찾기를 눌러주세요" readonly required> 
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999; display:none; visibility:hidden"></span>
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                            </div> 
                            <div class="group"> <label for="user" class="label">연락처</label> <input id="phone" name="phone" type="text" class="input" placeholder="-포함하여 입력해주세요 예시) 010-1234-5678" required> </div>
                            <div class="group"> <input type="submit" class="button" id="submitBtn" value="회원가입" style="font-weight: bold;color:white;"> </div>
                    		<div class="group"><div class="label">(주)이코드다는 꼭 필요한 최소한의 개인정보만 수집합니다 </div></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 유효성체크 : 데이터 빈공백체크(id와 성별) -->
<script type="text/javascript">

//이메일중복체크
function winopen(){
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.email.value =="" || document.fr.email.value.length < 0){
		alert("이메일을 입력해주세요")
		document.fr.email.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("joinIdCheck.jsp?userid="+document.fr.email.value,"","width=360px, height=387px");
	}
}

//이메일중복체크 서블릿사용-실패
function emailCheckFunc(){
	$.ajax({
		type : 'POST',
		url : './UserRegisterCheckServlet',
		data : {email: $('#email').val()},
		success : function(result) {
			console.log("이메일중복체크(1 = 중복o / 0 = 중복x) : "+ result);	
			if(result == 1){ //이메일중복 아닌 경우
				$('#emaillcheckMsg').css("color", "blue").html("사용 가능한 이메일입니다.");
				$('#submitBtn').css('background', '#1161ee').attr("disabled", false);
			}else {//이메일중복인 경우
				$('#emaillcheckMsg').css('color', 'red').html("사용 불가능한 이메일입니다.");
				$('#submitBtn').css('background', 'rgb(255, 255, 255, .1)').attr("disabled", true);
			}
		}, error : function(){console.log("이메일중복체크 실패")}
	})//ajax닫음
};//jquery닫음


//비밀번호와 비밀번호확인 일치여부
function pwCheckFunc(){
    let pwd1 = $("input[name=pw]").val();
    let pwd2 = $("input[name=pw2]").val();
    if (pwd1 == pwd2) { //비번이 일치할 경우
    	$('#pwCheckFuncMsg').css({visibility: 'visible', display: 'block', color:'blue'}).text("비밀번호가 일치합니다.");
    	$('#submitBtn').css('background', '#1161ee').attr("disabled", false);
    } else { //비번이 불일치할 경우
    	$('#pwCheckFuncMsg').css({visibility: 'visible', display: 'block', color:'red'}).text("비밀번호가 일치하지않습니다.");           
    	$('#submitBtn').css('background', 'rgb(255, 255, 255, .1)').attr("disabled", true);
    }
}

//todo : 모든 input태그에 입력값이 없으면 회원가입 버튼 비활성화(.attr("disabled", true))

//도로명주소 API사용
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>


</body>
</html>