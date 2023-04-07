<!-- 메일 전송 프로세스.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="mail.MailSend"/>
<%
		//전송 성공 및 실패 -> mailSend.jsp로 응답
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		boolean result = mgr.sendPwd(id, email);
		String msg = "메일 전송 실패";
		if(result) msg = "메일 전송 성공";
%>
<script>
	alert("<%=msg%>");
	location.href = "mailSend.jsp";
</script>