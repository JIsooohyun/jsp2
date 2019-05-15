<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDAO noticeDAO = new NoticeDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	int result = noticeDAO.delete(num);
	
	String msg = "Delete Fail";
	
	if(result>0){
		msg = "Delete Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("<%=msg%>");
location.href="./noticeList.jsp";
</script>
</body>
</html>