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
                            <div class="group"> <label for="user" class="label">이메일</label> <input id="user" type="text" class="input" placeholder="이메일 주소를 입력해주세요"> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input id="pass" type="password" class="input" data-type="password" placeholder="비밀번호를 입력해주세요"> </div>
                            <div class="group"> <input id="check" type="checkbox" class="check" checked> <label for="check"><span class="icon"></span> 아이디저장하기</label> </div>
                            <div class="group"> <input type="submit" class="button" value="로그인"> </div>
                            </form>
                            <div class="hr"></div>
                            <div class="foot"> <a href="#">비밀번호를 잊어버렸나요?</a></div>
                        </div>
                        <form action="joinPro.jsp" method="post" class="sign-up-form" id="join" name="fr">
                            <div class="group"> <label for="user" class="label">이메일</label> <input id="user" name="email" type="email" class="input" placeholder="이메일 주소를 입력해주세요(아이디로 사용됩니다)." required> </div>
                            <div id="idCheckResult"></div>
                            <div class="group"> <label for="pass" class="label">비밀번호</label> <input name="pw" type="password" class="inputpw" data-type="password" placeholder="영문숫자특수문자혼합 8자리이상 입력해주세요" required> </div>
                            <div class="group"> <label for="pass" class="label">비밀번호확인</label> <input name="pw2" type="password" class="inputpw" data-type="password" placeholder="비밀번호를 확인해주세요" required> </div>
                            <span id="s_result" style="font-size:12px; display:none; color:#d92742; font-weight:bold;">비밀번호가 일치하지 않습니다.</span>
                            <div class="group"> <label for="user" class="label">이름</label> <input id="user" name="name" type="text" class="input" placeholder="한글로 공백없이 입력해주세요" required> </div>
                            <div class="group"> <label for="user" class="label">주소 <input type="button" onclick="daumPostcode()" value="주소찾기"><br> </label>
                        	    <input type="hidden" id="sample4_postcode" placeholder="우편번호"> 
								
                            	<input type="text" name="addr" id="sample4_roadAddress" class="input" placeholder="주소찾기를 눌러주세요" readonly> 
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999; display:none; visibility:hidden"></span>
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                            </div> 
                            <div class="group"> <label for="user" class="label">휴대전화</label> <input id="phone" name="phone" type="text" class="input" placeholder="-포함하여 입력해주세요 예시) 010-1234-5678" required> </div>
                            <div class="group"> <input type="submit" class="button" value="회원가입"> </div>
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

//아이디중복체크
function winopen(){
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.id.value =="" || document.fr.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.id.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("joinIdCheck.jsp?userid="+document.fr.id.value,"","width=500, height=300");
	}
}


//비밀번호와 비밀번호확인 일치여부
$(document).ready(functioon(){
	 $('.inputpw').focusout(function () {
	        let pwd1 = $("input[name=pw]").val();
	        let pwd2 = $("input[name=pw2]").val();
	 
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            	$s_result.css({display:inline-block, color:blue}).text("비밀번호가 일치합니다.");
	            } else {
	            	$s_result.text("비밀번호가 일치하지않습니다.");           
	            }
	        }
	    });
});


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