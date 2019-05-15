<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	NoticeDAO noticeDAO =  new NoticeDAO();
	
	int result = noticeDAO.update(noticeDTO);
	String msg="Update fail";
	if(result>0){
		msg="update Success";
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