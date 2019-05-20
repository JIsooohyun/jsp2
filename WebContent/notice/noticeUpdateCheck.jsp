<%@page import="com.sh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	if(memberDTO!=null && memberDTO.getId().equals("admin")){
		RequestDispatcher view = request.getRequestDispatcher("./noticeUpdate.jsp");
		view.forward(request, response);
	}else{
		request.setAttribute("message", "Login");
		request.setAttribute("path", "../member/memberLogin.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	}
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