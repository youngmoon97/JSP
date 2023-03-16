<!-- /ch05/gugudan.jsp -->
<%@page import="java.awt.print.PrinterGraphics"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String dan[] = {"-","1단","2단","3단","4단","5단","6단","7단","8단","9단"};
%>
<table border="1">
		<h1>구구단 : <%=num %>단</h1>
		<%
			for(int i=1;i<10;i++){
		%>
		<tr>
			<td><%=num+" X " +i+" = "+num*i %></td>
		</tr>
		<%} %>
		<!-- 모든 구구단 출력 하지만 밑으로 출력댐 -->
		<%-- <%for(int i = 1; i<dan.length;i++){ %>
		<tr>
			<th><%=dan[i] %></th>
		
			<%for(int j=1;j<10;j++){ %>
			<tr>
				<td align ="center"><%=i+" X "+j+" = "+i*j %></td>
				
			<%} %>	
			</tr>
		<%} %>
		</tr>  --%>
</table>