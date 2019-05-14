<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.main {
	min-height: 800px;
}
</style>
<meta charset="UTF-8">
<title>Point Write</title>
<%@ include file="../temp/css_meta.jsp"%>
</head>
<body>
	<%@ include file="../temp/header_nav.jsp"%>

	<div class="container">
		<div class="row">
			<form action="./pointWriteProcess.jsp">
				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
				</div>
				<div class="form-group">
					<label for="kor">Kor:</label>
					<input type="text" class="form-control" id="kor" placeholder="Enter KOR" name="kor">
				</div>
				<div class="form-group">
					<label for="Eng">Eng :</label>
					<input type="text" class="form-control" id="eng" placeholder="Enter Eng" name="eng">
				</div>
				<div class="form-group">
					<label for="Math">Math:</label>
					<input type="text" class="form-control" id="math" placeholder="Enter Math" name="math">
				</div>
				<button type="submit" class="btn btn-danger">write</button>
			</form>
		</div>
	</div>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>