<%@page import="com.sh.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.idCheck(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		<%if(result==0){%>
			var ch = true;
		<%} else{%>
			var ch = false;
		<%}%>
		
		$('#btn').click(function() {
			if(ch){
				var id = $('#id').val();
				opener.document.getElementById('id').value=id;//나를열어준애.문서.
				opener.document.getElementById('idConfirm').value=1;
				self.close();
			}else{
				alert('중복확인!');
			}
		});
		
		$('#id').change(function() {
			ch=false;
		});
	});
</script>
</head>
<body>
	<h3>ID 중복확인</h3>
	<form action="./idcheck.jsp">
		<input type="text" name="id" id="id" value="<%=id%>">
		<button>중복확인</button>
		<%if(result==0){%>
		<input type="button" value="사용" id="btn">
		<%} %>
	</form>
</body>
</html>