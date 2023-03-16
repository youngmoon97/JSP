<!-- ch06/page3.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="EUC-KR" 
		trimDirectiveWhitespaces="false"
		isELIgnored="true"		
%>
<%
		String site = "jspstudy.co.kr";
		request.setAttribute("site",site);
%>
사이트명 : <%=site %><br>
사이트명 : ${site}