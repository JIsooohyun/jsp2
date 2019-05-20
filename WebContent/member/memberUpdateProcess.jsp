<%@page import="com.sh.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberDTO" class="com.sh.member.MemberDTO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.memberUpdate(memberDTO);
	
	if(result>0){
		response.sendRedirect("./memberMyPage.jsp");
		session.setAttribute("member", memberDTO);
	}else{
		//포워딩한다. 
		request.setAttribute("message", "Update Fail");
		request.setAttribute("path", "./memberMyPage.jsp");
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
<div class="row">
<h1> MemberUpdateProcess 회원수정처리</h1>
</div>
</body>
</html>