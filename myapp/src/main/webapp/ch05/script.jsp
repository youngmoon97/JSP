<!-- /ch05/script.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 선언문(Declataion) 
	다른 페이지에서 사용불가함으로 활용가치가 떨어진다.
 	메소드를 쓸려면 자바에서 선언해야한다.
 	페이지와 페이지 사이에 공유가 안됌
 -->
<%!
		//필드 선언
		String dec = "선언문 변수";
		//메소드 선언
		public String decMethod(){
			return dec;
		}
%>
<!-- 스크립트릿(Scriptlet) : Survice메소드 안에 만들어진다. 
	그래서 메소드를 사용할 수 없다.-->
<%

	String scriptlet = "스크립트릿";
	out.println("내장객체를 이용한 출력 : "+dec+"<p>");
%>
<!-- 표현문(Expression) -->
선언문1 : <%=dec %><p>
선언문2 : <%=decMethod() %><p>
선언문3 : <%=scriptlet %><p>
<%
	String comment="앙주석띠";
%>
<!-- JSP 주석1 <%=comment %> -->
<%-- JSP 주석2 : <%=comment %> --%>
<% 
	//한 줄 주석
	/* 여러 줄 및 부분 주석*/
%>
<!-- HTML 주석 -->