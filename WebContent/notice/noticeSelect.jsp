<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	//response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
	
	
%>
<%@ include file="../temp/css_meta.jsp" %>
<title>Insert title here</title>
<style type="text/css">
	.main{
		min-height: 800px;
	}
</style>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container main">
	<div class="row">
		<table class="table table-hover">
		<tr>
			<td> NO </td> <td> Title </td> <td>Contents</td> <td> Writer </td> <td>Reg_date</td><td>Hit</td>  
		</tr>
		<%if(noticeDTO!=null) {%>
		<tr>
			<td> <%=noticeDTO.getNum() %></td>
			<td> <%=noticeDTO.getTitle() %></td>
			<td> <%=noticeDTO.getContents() %></td>
			<td> <%=noticeDTO.getWriter() %></td>
			<td> <%=noticeDTO.getReg_date() %></td>
			<td> <%=noticeDTO.getHit() %></td>
		</tr>
		</table>
		<%} %>
		<%if(memberDTO !=null && memberDTO.getId().equals("admin")){ %>
		<div class="container">
			<a href = "./noticeUpdateCheck.jsp?num=<%=noticeDTO.getNum() %>"> UPDATE</a>
			<a href="./noticeDelete.jsp?num=<%=noticeDTO.getNum()%>">DELTE</a>
		</div>
		<%} %>
	</div>
</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>