<!-- /ch05/if.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//if.html에서 name, color를 던짐
	String name=request.getParameter("name");
	String color=request.getParameter("color");
	String msg = "";
	if(color.equals("blue")){
		msg = "파란색";
	}else if(color.equals("red")){
		msg = "빨간색";
	}else if(color.equals("orange")){
		msg = "오렌지색";
	}else{
		msg = "기타";
		color="white";
	}
%>
<body bgcolor="<%=color%>">
<%=name%>님이 좋아하는 색상은 <%=color%>입니다.<br>

</body>