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
		response.sendRedirect("../index.jsp");//리다이렉트로 페이지 이동하기 기본값 : response.sendRedirect("이동할 페이지")
	
	}else{
		request.setAttribute("message", "Delete Fail");// 이름이 message인 속성의 값을 Delete Fail이란 value로 지정한다. 
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