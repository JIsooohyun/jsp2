<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../temp/css_meta.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container">
	<div class="container">
		<div class="row">
			<form action="./noticeWriteProcess.jsp">
				<div class="form-group">
					<label for="title">Title : </label> 
					<input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
				</div>
				<div class="form-group">
					<label for="contents">Contents : </label> <br>
					<textarea rows="5" cols="" name="contents" id="contents"></textarea>
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label>
					<input type="text" class="form-control" id="writer" readonly="readonly" value="<%=memberDTO.getId()%>" name="writer">
				</div>
				<button type="submit" class="btn btn-danger">write</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>