<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name = "조영문";
	String bloodType = request.getParameter("bloodType");
%>
<jsp:forward page='<%=bloodType+".jsp" %>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:forward>
