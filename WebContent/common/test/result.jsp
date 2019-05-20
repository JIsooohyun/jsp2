<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("message"); //이름이 message인 속성의 값을 구한다. 
	String path = (String)request.getAttribute("path");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=path%>";
</script> 
</head>
<body>

</body>
</html>