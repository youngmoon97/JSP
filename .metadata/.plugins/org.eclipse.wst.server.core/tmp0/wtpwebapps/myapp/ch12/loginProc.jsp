<!-- ch12/loginProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//DB에 왔다 갔다 가정하고~
	boolean result = true;
	String msg = "로그인 실패하였습니다.";
	String url = "login.jsp";
	if(result){
		msg = "로그인되었습니다.";
		url = "loginOk.jsp";
		session.setAttribute("idKey", id); // id를 저장해라
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>