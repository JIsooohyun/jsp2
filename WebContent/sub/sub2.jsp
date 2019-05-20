<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자바에서 제공하는 클래스
	Cookie c = new Cookie("test", "testValue");
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Sub2 Page</h1>
	<a href="./sub1.jsp"> Go Sub1</a>
</body>
</html>