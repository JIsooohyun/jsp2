<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 4가지 정보
	String user="user03";
	String password = "user03";
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String driver ="oracle.jdbc.driver.OracleDriver";
	
	//2. 드라이버 로딩
	Class.forName(driver);
	//3. 로그인
	Connection conn = DriverManager.getConnection(url, user, password);
	//4.sql문
	String sql = "select * from point where num = ?";
	//5.미리보내기
	PreparedStatement st = conn.prepareStatement(sql);
	
	//6.?셋팅
	st.setInt(1, Integer.parseInt(request.getParameter("num")));
	
	ResultSet rs = st.executeQuery();
	
	rs.next();
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
			<form action="./updateProcess.jsp?num=<%=rs.getInt("num")%>&name=<%=rs.getString("name")%>&kor=<%=rs.getString("kor")%>&eng=<%=rs.getString("eng")%>&math=<%=rs.getString("math")%>">
			<input type="hidden" name="num" value="<%=rs.getInt("num")%>">
				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" class="form-control" id="name"  name="name" value="<%=rs.getString("name")%>">
				</div>
				<div class="form-group">
					<label for="kor">Kor:</label>
					<input type="text" class="form-control" id="kor" name="kor" value="<%=rs.getString("kor")%>">
				</div>
				<div class="form-group">
					<label for="Eng">Eng :</label>
					<input type="text" class="form-control" id="eng" value="<%=rs.getString("eng")%>" name="eng">
				</div>
				<div class="form-group">
					<label for="Math">Math:</label>
					<input type="text" class="form-control" id="math" value="<%=rs.getString("math")%>" name="math">
				</div>
				<button type="submit" class="btn btn-danger">update</button>
			</form>
		</div>
	</div>
	<%
		rs.close();
		st.close();
		conn.close();
	%>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>