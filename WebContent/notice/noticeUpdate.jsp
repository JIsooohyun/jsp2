<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
%>
<%@ include file="../temp/css_meta.jsp" %>
<title>Insert title here</title>
<style type="text/css">
	.main{
		min-height: 800px;
	}
</style>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container main">
	<div class="container">
		<div class="row">
			<form action="./noticeUpdateProcess.jsp" method="post">
				<input type="hidden" name="num" value="<%=noticeDTO.getNum()%>">
				<input type="hidden" name="reg_date" value="<%=noticeDTO.getReg_date() %>">
				<div class="form-group">
					<label for="title">Title : </label> 
					<input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="<%=noticeDTO.getTitle()%>">
				</div>
				<div class="form-group">
					<label for="contents">Contents : </label> <br>
					<textarea rows="" cols="" name="contents" id="contents"><%=noticeDTO.getContents()%></textarea>
				</div>
				<button type="submit" class="btn  btn-danger">UPDATE</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>