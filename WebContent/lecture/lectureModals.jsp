<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap) Bootstrap core CSS -->
<link href="../resources/css/styles.css" rel="stylesheet" />
<!-- 커스텀 board CSS -->
<link href="../board/board.css" rel="stylesheet"/>

<!-- Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">프론트앤드 기초언어</h2>
                            <p class="item-intro text-muted">Html, CSS, JS</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/01-full.jpg" alt="" />
                            <p> 입문자가 제일 좋아하는 강의! 만족도 100%! 실습구성으로 지루할 틈없는 알찬 강의!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 프론트앤드"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="실무 웹 제작 강의노트"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 프론트앤드"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i> 닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">백엔드 기초 언어</h2>
                            <p class="item-intro text-muted">Java, Php, C#, Python</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/02-full.jpg" alt="" />
                            <p>기초부터 탄탄하면 그 어떤 언어도 두렵지 않다! 기초부터 탄탄히 키워주는 옹골찬 강의!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 백앤드"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="서버마스터"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 백앤드"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i>닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 3-->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">데이터베이스</h2>
                            <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/03-full.jpg" alt="" />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 데이터베이스"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="실무 데이터베이스"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 DBA"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i>닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 4-->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">웹 프로그래밍</h2>
                            <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/04-full.jpg" alt="" />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 웹프로그래밍"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="실무 웹프로그래밍"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 웹프로그래밍"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i>닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 5-->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">모바일 프로그래밍</h2>
                            <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/05-full.jpg" alt="" />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 모바일프로그래밍"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="실무 웹 제작 강의노트"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 모바일프로그래밍"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i>닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 6-->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal"><img src="../resources/assets/img/close-icon.svg" alt="Close modal" /></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                            <h2 class="text-uppercase">알고리즘</h2>
                            <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                            <img class="img-fluid d-block mx-auto" src="../resources/assets/img/portfolio/06-full.jpg" alt="" />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                            <ul class="list-inline">
                                <li>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="기초부터 따라하는 알고라즘"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="실무 알고리즘"/>
                                	<input class="btnn" type="button" onclick="location.href='../lecture/lectureFrame.jsp?url=OoA70D2TE0A'" title="클릭하시면 강의보기로 이동됩니다." value="중급 알고르즘"/>
                                </li>
                            </ul>
                            <button class="btn btn-primary" data-dismiss="modal" type="button">
                                <i class="fas fa-times mr-1"></i>닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
