<%@ page contentType="text/html; charset=UTF-8"%>
<%
		String name = request.getParameter("name");
%>
<!-- include 액션태그 호출 시 요청정보도 같이 넘어간다. -->
include 액션태그의 Top입니다.<p>
<b><%=name %></b> 파이팅!!!
<hr align="left" color="red" width="40%">