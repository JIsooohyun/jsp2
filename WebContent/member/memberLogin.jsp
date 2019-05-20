<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie [] cookies = request.getCookies();
	String rid = "";
	for(Cookie c : cookies){
		if(c.getName().equals("check")){
			rid=c.getValue();
		}
	}
%>
<jsp:include page="../temp/css_meta.jsp"/>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	.main{
		margin-top : 20px;
		min-height: 800px;
	}
</style>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp"/>
<div class="row">
<div class="container main">
  <h2>Login Form</h2>
  <form action="./memberLoginProcess.jsp" method="post">
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" value="<%=rid%>">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</div>
<jsp:include page="../temp/footer.jsp"/>
</body>
</html>