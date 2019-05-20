
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.sh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	//MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp"/>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp"/>

<h1>My Page</h1>
<jsp:useBean id="member" class="com.sh.member.MemberDTO" scope="session"/>
<h1> ID : <jsp:getProperty property="id" name="member"/><%--이름은 usebean에 있는 id와 같은걸로 써준다.<%--<%=memberDTO.getId()--%></h1></div>    <%--주석이다~~ --%>
<h1>Name :<jsp:getProperty property="name" name="member"/><%-- <%=memberDTO.getName() %> --%></h1>
<h1>Phone :<jsp:getProperty property="phone" name="member"/><%-- <%=memberDTO.getPhone() %> --%></h1>
<h1>Email :<jsp:getProperty property="email" name="member"/><%-- <%=memberDTO.getEmail() %> --%></h1>
<h1>Age :<jsp:getProperty property="age" name="member"/><%-- <%=memberDTO.getAge() %> --%></h1>

<div>
<a href="./memberUpdate.jsp">Update</a>
<a href="./memberDeleteProcess.jsp">Delete</a>
</div>
<jsp:include page="../temp/footer.jsp"/>
</body>
</html>