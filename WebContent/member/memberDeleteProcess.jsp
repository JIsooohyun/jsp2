<%@page import="com.sh.member.MemberDTO"%>
<%@page import="com.sh.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 	response.setCharacterEncoding("utf-8");
 	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
 	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.memberDelete(memberDTO.getId());
	if(result>0){
		session.invalidate();
		response.sendRedirect("../index.jsp");
	
	}else{
		request.setAttribute("message", "Delete Fail");
		request.setAttribute("path", "../index.jsp");
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