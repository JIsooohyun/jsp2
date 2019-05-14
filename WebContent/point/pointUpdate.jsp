<%@page import="com.sh.point.PointDTO"%>
<%@page import="com.sh.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 4가지 정보
	int num = Integer.parseInt(request.getParameter("num"));

	PointDAO pointDAO = new PointDAO();
	
	PointDTO pointDTO = pointDAO.selectOne(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Point Update</title>
<%@ include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container">
		<div class="row">
			<form action="./updateProcess.jsp?num=<%=pointDTO.getNum()%>&name=<%=pointDTO.getName()%>&kor=<%=pointDTO.getKor()%>&eng=<%=pointDTO.getEng()%>&math=<%=pointDTO.getMath()%>">
			<input type="hidden" name="num" value="<%=pointDTO.getNum()%>">
				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" class="form-control" id="name"  name="name" value="<%=pointDTO.getName()%>">
				</div>
				<div class="form-group">
					<label for="kor">Kor:</label>
					<input type="text" class="form-control" id="kor" name="kor" value="<%=pointDTO.getKor()%>">
				</div>
				<div class="form-group">
					<label for="Eng">Eng :</label>
					<input type="text" class="form-control" id="eng" value="<%=pointDTO.getEng()%>" name="eng">
				</div>
				<div class="form-group">
					<label for="Math">Math:</label>
					<input type="text" class="form-control" id="math" value="<%=pointDTO.getMath()%>" name="math">
				</div>
				<button type="submit" class="btn btn-danger">update</button>
			</form>
		</div>
	</div>
	
<%@ include file="../temp/footer.jsp" %>
</body>
</html>