<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!-- 아이디 : <%=id %> 비밀번호 : <%=pwd %> -->
<jsp:forward page="forward1_2.jsp"/>