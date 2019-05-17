<%@page import="com.sh.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberDTO" class="com.sh.member.MemberDTO"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	MemberDAO memberDAO = new MemberDAO();
	memberDTO =  memberDAO.memberLogin(memberDTO);
	
	//포워딩과 리다이렉트 둘 다 사용하기 
	if(memberDTO!=null){
		/* RequestDispatcher view = request.getRequestDispatcher("../index.jsp");
		view.forward(request, response);
		이렇게 사용하면 주소가 이상해지면서 나중에 망가진다. 그래서 리다이렉트로 보낸다.*/
		session.setAttribute("member",memberDTO);//키는 내맘대로 만든다. (키, 밸류)
		response.sendRedirect("../index.jsp");
	}else{
		request.setAttribute("message", "Login Fail");
		request.setAttribute("path", "./memberLogin.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);//페이지 이동시 request, response를 생성할 때 process에서 값을 받고 
		//또 그 값을 result로 넘겨서 응답받을 것을 받기 위해서 두개다  forward방식으로 보낸다. 
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
<h1> MemberLoginProcess 로그인처리</h1>
</div>
</body>
</html>