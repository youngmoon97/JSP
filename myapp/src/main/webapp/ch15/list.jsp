<%@page import="ch15.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="ch15.UtilMgr"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ch15.BoardMgr"/>
<%
	int totalRecord = 0;	// 총 게시물 수
	int numPerPage = 10;	// 페이지 당 게시물 개수(5,10,20,30)
	int pagePerBlock = 15;	// 페이지 모음 블록
	int totalPage = 0;		// 총 페이지 개수
	int totalBlock = 0;		// 총 블럭 개수
	int nowPage = 1;		// 현재 페이지
	int nowBlock = 1;		// 현재 블록
	
	// 요청된 numPerPage 처리
	
	// 검색에 필요한 변수
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord")!=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	// 검색 후에 다시 reset 요청
	
	totalRecord = mgr.getTotalCount(keyField, keyWord);
	//out.print(totalRecord);
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}
	// sql문에 들어가는 start, cnt선언
	int start = (nowPage*numPerPage)-numPerPage;
	int cnt = numPerPage;
	
	// 전체 페이지 개수
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	// 전체 블록 개수
	totalBlock = (int)Math.ceil((double)totalRecord/pagePerBlock);
	// 현재 블럭 개수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
	//out.println("totalPage : "+totalPage+"<br>");
	//out.println("totalBlock : "+totalBlock+"<br>");
	//out.println("nowBlock : "+nowBlock+"<br>");
%>
<!DOCTYPE html>
<html>
<head>
	<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function block(block){
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}	
	function paging(page){
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC" >
<div align="center"><br/>
<h2>JSP Board</h2><br/>
<table>
	<tr>
		<td width="600">
		Total : <%=totalRecord%>Articles(<font color="red">
		<%=nowPage+"/"+totalPage%>Pages</font>)
		</td>
	</tr>
</table>
<table>
	<tr>
		<td align="center" colspan="2">
			<%
			Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt);
			int listSize = vlist.size();
			if(vlist.isEmpty()){
				out.println("등록된 게시물이 없습니다.");
			}else{
			%>
			<table cellspacing="0">
				<tr align="center" bgcolor="#D0D0D0">
					<td width="100">번 호</td>
					<td width="250">제 목</td>
					<td width="100">이 름</td>
					<td width="150">날 짜</td>
					<td width="100">조회수</td>
				</tr>
				<%
					for(int i=0;i<numPerPage;i++){
						if(i==listSize)break;
						BoardBean bean = vlist.get(i);
						int num = bean.getNum();
						String subject = bean.getSubject();
						String name = bean.getName();
						String regdate = bean.getRegdate();
						int depth = bean.getDepth();
						int count = bean.getCount();
						String filename = bean.getFilename();
				%>
				<tr align="center">
					<td><%=totalRecord-start-i %></td>
					<td align="left"><%=subject %></td>
					<td><%=name %></td>
					<td><%=regdate %></td>
					<td><%=count %></td>					
				</tr>
				<% }//--for%>
			</table>
			<%	}//--if-else%>
			
		</td>
	</tr>
	<tr>
		<td colspan="2"><br><br></td>
	</tr>
	<tr>
		<td>
		<!-- 페이징 및 블럭 Start -->
		<!-- 이전블럭 -->
		<%if(nowBlock>1){ %>
			<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>
		<%} %>
		<!-- 페이징 -->
		<%
			int pageStart = (nowBlock-1)*pagePerBlock+1;
			int pageEnd = (pageStart+pagePerBlock)<totalPage ?
					pageStart+pagePerBlock:totalPage+1;
			for(;pageStart<pageEnd;pageStart++){
		%>
		<a href="javascript:paging('<%=pageStart %>')">
		<%if(nowPage==pageStart){ %><font color="blue"><%} %>
			[<%=pageStart %>]
		<%if(nowPage==pageStart){ %></font><%} %>
		</a>
		<%  }%>
		<!-- 다음블럭 -->
		<%if(totalBlock>nowBlock){ %>
			<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>
		<%} %>
		<!-- 페이징 및 블럭 End -->
		</td>
		<td align="right">
			<a href="post.jsp" >[글쓰기]</a>
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</tr>
</table>

<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num">
</form>
</div>
</body>
</html>