<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이코드다 - 코딩교육의 모든 것</title>
        <!-- favicon  모든페이지에 필요 -->
        <link rel="icon" type="image/x-icon" href="../resources/assets/img/favicon.ico" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
		
        <!-- Masthead 메인첫 -->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Hello ECODEDA world!</div>
                <div class="masthead-heading text-uppercase">코딩이 막막하세요?</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#about">지금 바로 시작</a>
            </div>
        </header>

        <!-- Portfolio Grid 갤러리게시판-->
        <section class="page-section bg-light" id="portfolio">
			<jsp:include page="../lecture/lectureGrid.jsp"></jsp:include>
        </section>
        
        <!-- About 강의 로드맵-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">강의로드맵</h2>
                    <h3 class="section-subheading text-muted">처음이라 막막하시다구요? 로드맵만 따라가면 당신도 주니어 엔지니어!</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><a href="../lecture/lectureFrame.jsp?url=tZooW6PritE?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb">
                        	<img class="rounded-circle img-fluid img-hover" src="../resources/assets/img/about/1resize.png" title="클릭하면 무료강의로 이동합니다"/></a>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>WEB페이지 만들기</h4>
                                <h4 class="subheading">언어 : HTML CSS </h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">더이상 지루한 문법공부는 그만! WEB페이지를 함께 만들어보면서 프로그래밍의 기초를 다듬어보세요!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><a href="../lecture/lectureFrame.jsp?url=dPRtcRwKo-Y?list=PLuHgQVnccGMBB348PWRN0fREzYcYgFybf">
                        	<img class="rounded-circle img-fluid img-hover" src="../resources/assets/img/about/2resize.png" title="클릭하면 무료강의로 이동합니다" /></a>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>WEB페이지 더 멋있게 만들기</h4>
                                <h4 class="subheading">언어 : JavaScript</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">정적 WEB페이지라 지루하셨다구요? JS로 움직임의 날개를 달아보세요!</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><a href="../lecture/lectureFrame.jsp?url=V3QsSrldHqI?list=PLcqDmjxt30RtqbStQqk-eYMK8N-1SYIFn">
                        	<img class="rounded-circle img-fluid img-hover" src="../resources/assets/img/about/react.jpg" title="클릭하면 무료강의로 이동합니다" /></a>
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>웹게임 만들기</h4>
                                <h4 class="subheading">언어 : React</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">홈페이지 만들기가 지겹다면? 웹게임을 만들어봐요!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><a href="../lecture/lectureFrame.jsp?url=hke9FKluXow?list=PLRx0vPvlEmdAdWCQeUPnyMZ4PsW3dGuFB">
                        	<img class="rounded-circle img-fluid img-hover" src="../resources/assets/img/about/jsp.png" title="클릭하면 무료강의로 이동합니다" /></a></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>강의평가 웹사이트 만들기</h4>
                                <h4 class="subheading">언어 : JSP</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">강의평가 웹사이트를 만들어보며 백앤드의 매력에 빠져보아요!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><a href="../lecture/lectureFrame.jsp?url=hFJZwOfme6w?list=PLuHgQVnccGMA8iwZwrGyNXCGy2LAAsTXk">
                        	<img class="rounded-circle img-fluid img-hover" src="../resources/assets/img/about/git.png" title="클릭하면 무료강의로 이동합니다" /></a></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>협업을 위한 버전관리</h4>
                                <h4 class="subheading">GIT</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">협업의 기본 툴인 버전관리소프트웨어 Git과 커멘트명령어 마스터!!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>주니어<br />개발자로<br />이직성공!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        
        <!-- Services 회사소개-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">Simple is the best. 확실히 실무에 필요한 지식들만 제공합니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">수강생 먼저</h4>
                        <p class="text-muted">강의 먼저 들으시고 결제하세요. 수강생 만족이 최우선.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">1대1과외</h4>
                        <p class="text-muted">원격지원 예약서비스로 모르는 부분, 답답한 부분, 잘 안 풀리는 부분 확실하게 잡아드립니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">안심지원</h4>
                        <p class="text-muted">취업지원까지 체계적으로 끝까지 될때까지 도와드립니다</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Team 수강후기-->
        <section class="page-section bg-light" id="team">
			<jsp:include page="../review/reviewList.jsp"></jsp:include>
        </section>
        
        <!-- Portfolio Modals 갤러리게시판-->
        <jsp:include page="../lecture/lectureModals.jsp"></jsp:include>
        
        <!-- Footer랑 js랑 세트  -->
        <!-- Footer-->
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
    