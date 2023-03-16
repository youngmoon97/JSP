<!-- /ch05/expression2.jsp -->
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	public int max(int a, int b){
		return a>b?a:b;
	}
%>
<% 
	Date d= new Date();
	int hour = d.getHours();
	int a=10,b=20;
%>
지금은 오전일까요? 오후일까요? <%=(hour<12)?"오전":"오후"%><br>
a와 b 중에 큰 숫자를 출력하시오 <%=max(a,b) %>