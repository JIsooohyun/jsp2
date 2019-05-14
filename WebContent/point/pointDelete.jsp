<%@page import="com.sh.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	PointDAO pointDAO = new PointDAO();
	
	int result = pointDAO.delete(num);
	
	String msg="Delete Fail";
	
	if(result>0){
		msg="Delete Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="./point.jsp";
</script>
</body>
</html>