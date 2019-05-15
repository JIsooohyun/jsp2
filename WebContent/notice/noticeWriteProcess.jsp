<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	noticeDTO.setWriter(request.getParameter("writer"));
	int result = noticeDAO.insert(noticeDTO);
	String msg="Insert fail";
	if(result>0){
		msg="Insert Success";
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
	alert("<%=msg %>");
	location.href="./noticeList.jsp";
	</script>
</body>
</html>