<%@page import="com.sh.util.DBConnector"%>
<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> ar = noticeDAO.selectList();
%>

<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp" %>
<style type="text/css">
	.main{
		min-height: 800px;
	}
</style>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container main">
	<div class="row">
		<h1>Notice List</h1>
	</div>
	<div>
		<table class="table table-hover">
			<tr>
				<td> NO </td> <td> Title </td> <td> Writer </td> <td>Reg_date</td> <td>Hit</td>  
			</tr>
			<% for (NoticeDTO noticeDTO : ar) { %>
			<tr>
				<td> <%=noticeDTO.getNum() %> </td> 
				<td><a href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle() %></a></td> 
				<td> <%=noticeDTO.getWriter() %></td>
				<td> <%=noticeDTO.getReg_date() %></td>
				<td> <%=noticeDTO.getHit() %></td>
			</tr>
			<%} %>
		</table>
	</div>
	
	<div class="row">
		<a class="btn btn-primary" href="./noticeWrite.jsp">Write</a>
	</div>
</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>