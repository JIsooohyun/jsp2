<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("member", null); //세션에 들어가 있는 멤버를 null로 처리
	//session.removeAttribute("member"); //멤버라는 키와 그 안에 있는 전부를 지울것이다.
	//session.removeValue("member");//속성명은 남겨두고 속명밸류를 지울것이다.
	session.invalidate();//세션을 유지하는 시간을 0으로 만든다. 
	response.sendRedirect("../index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>