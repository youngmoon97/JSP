<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//업로드 파일 저장 위치
	final String SAVEFOLDER = "C:/Jsp/myapp/src/main/webapp/ch13/storage/";
	//업로드 파일명 인코딩
	final String ENCODING = "UTF-8";
	//업로드 파일 크기
	final int MAXSIZE = 1024*1024*20;	//20MB
	try{
		//DefaultFileRenamePolicy = 이름이 같으면 자동으로 이름 뒤에 인덱스 추가 
		MultipartRequest multi = 
				new MultipartRequest(
						request,
						SAVEFOLDER,
						MAXSIZE, 
						ENCODING, 
						new DefaultFileRenamePolicy()
						);
		String user = multi.getParameter("user");
		String title = multi.getParameter("title");
		String fileName = multi.getFilesystemName("myfile");
		String fileType = multi.getContentType("myfile");
		//파일정보
		File f = multi.getFile("myfile");
		long len=0;
		if(f!=null){
			len=f.length();
		}
		out.println("user : " + user + "<br>");
		out.println("title : " + title + "<br>");
		out.println("파일명 : " + fileName + "<br>");
		out.println("파일타입 : " + fileType + "<br>");
		out.println("파일크기 : " + len + "byte");
	}catch(Exception e){
		e.printStackTrace();
	}
%>