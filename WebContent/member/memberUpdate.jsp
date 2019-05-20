<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../temp/css_meta.jsp" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../temp/header_nav.jsp" />
	<h3>Update Page</h3>
	<jsp:useBean id="member" class="com.sh.member.MemberDTO"
		scope="session" />
	<form action="./memberUpdateProcess.jsp">
	<div>
		<div>
			<input type="hidden" id="id" name="id" value="<jsp:getProperty property="id" name="member" />">
		</div>
		<div>
			Name : <input type="text" name="name" id="name"
				value="<jsp:getProperty property="name" name="member"/>">
		</div>
		<div>
			Phone : <input type="text" name="phone" id="phon"
				value="<jsp:getProperty property="phone" name="member"/>">
		</div>
		<div>
			Email : <input type="email" name="email"
				value="<jsp:getProperty property="email" name="member"/>">
		</div>
		<div>
			Age : <input type="text" name="age" value="<jsp:getProperty property="age" name="member"/>">
		</div>
		<div> 
			Password : <input type="password" name="pw" id="pw" value="<jsp:getProperty property="pw" name="member"/>">
		</div>

	</div>
	<button>Update</button>
	</form>
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>