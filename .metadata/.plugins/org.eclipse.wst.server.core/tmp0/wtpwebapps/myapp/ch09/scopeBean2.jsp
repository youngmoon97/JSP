<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//세션 특정한 값만 제거
	session.removeAttribute("pbean");
	//세션을 전체를 제거, 무효화, 초기화
	session.invalidate();
	response.sendRedirect("scopeBean.jsp");
%>