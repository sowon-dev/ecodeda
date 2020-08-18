<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- favicon  모든페이지에 필요 -->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
<title>강의보기</title>
</head>
<body>
<!-- Navigation-->
<jsp:include page="../inc/navigation.jsp"></jsp:include>
<!-- 커스텀 board CSS -->
<link href="../board/board.css" rel="stylesheet"/>

<fieldset id="fieldsetMe">
<legend id="legendMe">강의보기</legend>
	<div id="contents">
<!-- 아이프레임  -->
<iframe id="vime-embed-1" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" class="iframe100" src="https://www.youtube-nocookie.com/embed/A2sWchE6eJY?enablejsapi=1&amp;rel=0&amp;fs=1&amp;iv_load_policy=3&amp;widget_referrer=https%3A%2F%2Fedu.goorm.io%2Flearn%2Flecture%2F4661%2Fgit-and-github-%25EC%259E%2585%25EB%25AC%25B8-by-%25EC%25BD%2594%25EB%2593%259C%25EC%258A%25A4%25EC%25BF%25BC%25EB%2593%259C%2Flesson%2F207307%2F6%25EA%25B0%2595-reset-%25EC%259C%25BC%25EB%25A1%259C-%25EC%25BB%25A4%25EB%25B0%258B-%25EB%2590%2598%25EB%258F%258C%25EB%25A6%25AC%25EA%25B8%25B0&amp;playsinline=1&amp;controls=1&amp;disablekb=0" title="YouTube - Git입문 6강: reset 으로 커밋 되돌리기"></iframe>
	</div>
</fieldset>

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