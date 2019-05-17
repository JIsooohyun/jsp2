<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include는 파일을 복사해서 사용하자.  -->
<!--위에 있는 include와 비슷한 코드이다. -->
<jsp:include page="../temp/css_meta.jsp" />
<!-- 이 코드를 만났을떄 여기로 가서 실행하고 와서 진행하쟈 -->
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.main {
	margin-top: 50px;
	min-height: 800px;
}
</style>
</head>

</head>
<body>
	<jsp:include page="../temp/header_nav.jsp" />
	<div class="row">
		<div class="container main">
			<!-- <form action="./memberJoin.jsp"> -->
			<h2>회원 약관 동의</h2>
			<div class="checkbox">
				<label><input type="checkbox" id="checkAll"> 전체동의</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class="check"> 동의A</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class="check"> 동의B</label>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" class="check"> 동의C</label>
			</div>
			<!-- <button>Join</button> -->
			<input type="button" class="btn btn-default" id="join" value="Join">
			<!-- </form> -->
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
	
	<script type="text/javascript">
	$(function() {
		$('#checkAll').click(function() {
			var c = $(this).prop('checked');
			$('.check').prop('checked', c);
		});

		$('.check').click(function() {
			var c = true;
			$('.check').each(function() {
				if (!$(this).prop('checked')) {
					c = false;
				}
			});
			$('#checkAll').prop('checked', c);
		});

		$("#join").click(function() {
			var c = $('#checkAll').prop('checked');
			if (c) {
				location.href = "./memberJoin.jsp";
			} else {
				alert("약관에 동의");
			}
		});
	});
</script>
</body>
</html>