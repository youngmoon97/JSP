<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	mgr.deleteTeam(num);
	response.sendRedirect("teamList.jsp");
%>