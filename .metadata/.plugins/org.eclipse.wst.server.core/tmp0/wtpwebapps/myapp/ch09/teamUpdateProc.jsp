<!-- ch09/teamUpdateProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch09.TeamMgr"/>
<jsp:useBean id="bean" class="ch09.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.updateTeam(bean);
	out.print(result);
%>