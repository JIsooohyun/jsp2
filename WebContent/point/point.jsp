<%@page import="com.sh.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sh.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PointDAO pointDAO = new PointDAO();
	ArrayList<PointDTO> ar = pointDAO.selectList();
	
%>
	
<title>Point</title>
<%@ include file="../temp/css_meta.jsp" %>
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
  		<h1>Point Page</h1>
	</div>
	<div class="row">
		<table class="table table-hover">
  			<tr>
  				<td> 번호 </td> <td>이름</td> <td>국어</td><td>영어</td><td>수학</td><td>총점</td><td>평균</td>
  			</tr>
  			
  			<% for(PointDTO pointDTO : ar){%>
  			<tr>
  				<td><%=pointDTO.getNum()%></td> 				
  				<td><a href="./pointSelect.jsp?num=<%=pointDTO.getNum()%>"><%=pointDTO.getName()%></a></td>
  				<td><%=pointDTO.getKor() %></td>
  				<td><%=pointDTO.getEng() %></td>
  				<td><%=pointDTO.getMath()%></td>
  				<td><%=pointDTO.getTotal()%></td>
  				<td><%=pointDTO.getAvg()%></td>
  			</tr>
  			<%} %>
  			
  		</table>
	</div>
  	<div class="row">
  		<a class="btn btn-primary" href="./pointWrite.jsp">Write</a>
  	</div>
  </div>
    <!-- Footer -->

	<%@ include file="../temp/footer.jsp" %>
</body>
</html>