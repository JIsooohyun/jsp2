<%@page import="com.sh.member.MemberDAO"%>
<%@page import="com.sh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!-- 위에 있는 포워드랑 같은 소스코드이다.  -->
<jsp:useBean id="memberDTO" class="com.sh.member.MemberDTO" scope="page"/><!-- MemberDTO memberDTO = new MemberDTO();대신 사용 -->
<!--class="com.sh.member.MemberDTO"를   id="m"로 사용한다. -->
<jsp:setProperty property="*" name="memberDTO" /> <!-- requset.getParameter을 대신 매핑해서 사용해준다.  -->

<!-- memberDTO.setId(request.getParameter("id"));을 대신해서 사용 name에다가 참조변수명 -->
<%
	MemberDAO memberDAO = new MemberDAO();

	int result = memberDAO.memberJoin(memberDTO);
	String msg = "Join Fail";
	if (result > 0) {
		msg = "Join success";
	}
	//데이터를 살려서 가야하기 때문에 포워딩으로 간다.
	request.setAttribute("message", msg); //꺼내는 이름과 동일한 이름을 사용한다.
	request.setAttribute("path", "../index.jsp");

	//RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");

	//view.forward(request, response);
%>

<jsp:forward page="../common/test/result.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h1>MemberJoinProcess 회원가입처리</h1>
	</div>
</body>
</html>