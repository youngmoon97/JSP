<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	int intervalTime = session.getMaxInactiveInterval();
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	if(id!=null){
%>
<%=id%>님이 좋아하는 계절은 <%=season%>이고, 과일은 <%=fruit%>입니다. <br>
	<%}else{ %>
		out.println("세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수가 없습니다.");
	<%} %>
세션 ID : <%=session.getId() %><br>
세션 유지 시간 : <%=intervalTime %>