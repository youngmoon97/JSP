<!-- main.jsp -->
<%@page import="myapp2.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
		String money="10000000";
		String res = MyUtil.getMoneyForm(money);
%>
<%=money %> ==천 단위 콤마 쉼표 표시==> <%=res %>