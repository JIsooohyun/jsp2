<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#idcheck').keyup(function() {
			if($('#idcheck').val().length>9){
				$('#idck').html("10글자 미만 입력해주세요")
			}else{
				$('#idck').html("OK");
			}
		});
		$('#check').click(function() {
			if($('#idcheck').val()==""){
				alert("아이디를 입력해주세요");
			}else{
				alert("중복확인 완료");
			}
		});
		$('#use').click(function() {
			var id = $('#idcheck').val();
			
			if(id.length>10){
				alert("10글자 미만 입력해주세요");	
			}else{
				//opener.document.getElementById('id').value=id;
				opener.document.jj.id.value = id;//나를열어준애.문서.
				opener.document.jj.different.checked = true;//타고타고 들어가서 찾았씁니다. 
				close();
			}
		});
	});
</script>
</head>
<body>
	<h3>ID 중복확인</h3>
	<form action="./jauery7.html" name="gem">
		<div>
			<input type="text" id="idcheck" placeholder="Enter ID"> 
			<div id="idck"> </div>
			<input type="button" value="중복확인" id="check"> 
			<input type="button" value="사용" id="use">
		</div>
	</form>
</body>
</html>