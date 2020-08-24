<%@page import="java.net.URLEncoder"%>
<%@page import="javax.activation.MimeType"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강후기 다운로드</title>
</head>
<body>
<% //1. 전달받은 데이터 저장
String filename = request.getParameter("file_name");
System.out.println("전달된 파일 명 : "+filename);
String savepath = "upload";

//3. 내 프로젝트 정보(ServletContext)안에서 가상경로를 실제경로로 계산해줘야한다.
//3-1. 서버안에 있는 물리적 위치 확인
ServletContext context = getServletContext();
String DownloadPath = context.getRealPath(savepath);
System.out.println("DownloadPath : "+DownloadPath);
//3-2. 다운로드할 파일의 전체 경로
//역슬러시 두개는 이스케이프문자로서 역슬러시 1개만 표현됨
String FilePath = DownloadPath+"\\"+filename;
//여기까지다운로드기능완료

//4. 데이터 응답처리를 다운로드 형태로 구현
//4-1. 파일을 한번에 처리하기위한 배열
byte[] b = new byte[4069];
//4-2. 파일입출력을 처리하는 파일 입력 스트림 객체생성(즉, 파일을 읽어오는 통로만들기)
FileInputStream fis = new FileInputStream(FilePath);

//4-3. 다운로드할 파일의 마임타입 확인(mime) 
//=> 클라이언트에게 전송되는 데이터(문서)를 다양하게 처리 가능하도록 하는 메커니즘
String MimeType = getServletContext().getMimeType(FilePath);
System.out.println("Mime type: "+MimeType);

if(MimeType == null){
	  //기본값 지정 - 이진파일을 처리하기위한 기본타입
	  //-> 잘 알려지지 않은 파일을 의미하기때문에 
	  //-> 브라우저는 보통 자동실행을 안하고 대화상자를 이용하여 사용자에게 실행할지 질문함
	  MimeType = "application/octet-stream";
}

//4-4내 응답정보를 마임타입으로 지정
response.setContentType(MimeType);

//5. 브라우저에 따른 데이터 처리(대응)
//왜 인터넷익스플로러를 기준으로 나눌까?
//인터넷익스폴러는 다운로드시 한글파일이 깨짐 -> 따라서 파일을 인코딩해서 다운로드함 
//이때 공백문자가 플러스(+)기호로 나옴 -> 이걸 %20(공백)으로 변경

//익스인지 아닌지는 어떻게 알까? 
String agent = request.getHeader("User-Agent");
System.out.println("agent : "+ agent);
boolean ieBrowser = 
	agent.indexOf("MSIE") > -1 || agent.indexOf("Trident") > -1;
	
if(ieBrowser){ // IE 일때 : +를 %20(공백)으로 변경
	filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
}else{ // IE 아닐때 : 데이터인코딩(한글깨짐방지)
	filename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
}

//6. 데이터다운로드 처리
//브라우저가 응답정보를 읽어서(해석) 처리시 
//"Content-Disposition" 설정값이  "attachment;" 모든 데이터 다운로드 처리 		
response.setHeader("Content-Disposition", "attachment; filename="+filename);

//7. 데이터출력(다운로드)
ServletOutputStream out2 = response.getOutputStream();
//7-1. 데이터출력 통로 생성
int data = 0;
while((data = fis.read(b,0,b.length)) != -1){
	//데이터출력시 파일이 있을동안 계속 진행
	out2.write(b,0,data); //배열에다가 data를 담아서 출력
	out2.flush();
}
//8. 자원해제

out2.close();
fis.close();

//9. java.lang.IllegalStateException:
//이 응답을 위해 getOutputStream()이 이미 호출되었습니다.
// => JSP->Servlet 변환시 out 객체가 자동생성, 추가로 OutputStream 객체 생성시
// 오류 메세지 출력( 다운로드 문제 X, 서버에 에러 메세지 로그 쌓임)

out.clear();
out = pageContext.pushBody();
%>
</body>
</html>