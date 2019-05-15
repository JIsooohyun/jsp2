<%@page import="com.sh.point.PointDAO"%>
<%@page import="com.sh.point.PointDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	PointDAO pointDAO = new PointDAO();
	
	PointDTO pointDTO = pointDAO.selectOne(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Point Select</title>
<%@ include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
	<div class="container">
	<table class="table table-hover">
		<tr>
  			<td> 번호 </td> <td>이름</td> <td>국어</td><td>영어</td><td>수학</td><td>총점</td><td>평균</td>
  		</tr>
  		<%if(pointDTO!=null){%>
  		<tr>
  			<td><%=pointDTO.getNum()%></td>
  			<td><%=pointDTO.getName() %></td>
  			<td><%=pointDTO.getKor() %></td>
  			<td><%=pointDTO.getEng() %></td>
  			<td><%=pointDTO.getMath() %></td>
  			<td><%=pointDTO.getTotal()%></td>
  			<td><%=pointDTO.getAvg() %></td>
  		</tr>
	</table>
			<div class="container">
				<a href="./pointUpdate.jsp?num=<%=pointDTO.getNum()%>">Update</a>
				<a href="./pointDelete.jsp?num=<%=pointDTO.getNum()%>">DELETE</a>
				<button class="btn" title="pointUpdate">Update</button>
				<button class="btn" title="pointDelete">Delete</button>
			</div>
		<%}else{ %>
			<h1>번호가 없다.</h1>
		<% } %>
	</div>

	
<%@ include file="../temp/footer.jsp" %>
</body>
</html>