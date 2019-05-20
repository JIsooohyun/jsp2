<%@page import="com.sh.util.DBConnector"%>
<%@page import="com.sh.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sh.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeDAO noticeDAO = new NoticeDAO();
	int curPage = 1;
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {

	}
	String search = request.getParameter("search");
	if(search==null){
		search="";
	}
	String kind = request.getParameter("kind");
	if(kind==null){
		kind="title";
	}else if(kind.equals("t")){
		kind="title";
	}else if(kind.equals("c")){
		kind="contents";
	}else if(kind.equals("w")){
		kind="writer";
	}else{
		kind="title";
	}
	int perPage = 10;
	int startRow = (curPage - 1) * perPage + 1; // rownum 1번부터
	int lastRow = curPage * perPage; // 10까지 가져오게 설정 페이지 안에 들어오는 숫자가 

	//1. 총글의 갯수
	int totalCount = noticeDAO.getTotalCount(kind, search);//103개

	//2. 총페이지의 갯수
	int totalPage = totalCount / perPage; //103/10 -> totalPage = 10개
	if (totalCount % perPage != 0) { //103%10 나머지 3이니까 총 페이지갯수는 11개
		totalPage++;
	}

	//3. 한블럭당 번호가 몇개씩 보일건가
	int perBlock = 5; //1 2 3 4 5 [다음] 6 7 8 9 10

	//4. 총 block 수
	int totalBlock = totalPage / perBlock;//11/5 totalBlock=2;
	if (totalPage % perBlock != 0) { //나머지가 1이므로 
		totalBlock++; //totalBlock = 3;
	}

	// 5. curPage를 이용해서 현재 Block번호 찾기
	int curBlock = curPage / perBlock; //ex) 8/5 => 1
	if (curPage % perBlock != 0) {
		curBlock++; //curBlock = 2;
	}
	//startNum과 lastNum은 페이지 번호가 시작하고 끝나는 부분을 말한다.
	//6. curBlock에서 startNum과 lastNum찾기
	int startNum = (curBlock - 1) * perBlock + 1; //(1*5)+1= 6;
	int lastNum = curBlock * perBlock; // 2*5 = 10;
	if (startNum < 1) {
		startNum = 1;
	}
	if (curBlock == totalBlock) {
		lastNum = totalPage;
	}
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(kind, search, startRow, lastRow);
%>

<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp"%>
<style type="text/css">
.main {
	min-height: 800px;
}
</style>
<body>
	<%@ include file="../temp/header_nav.jsp"%>
	<div class="container main">
		<div class="row">
			<h1>Notice List</h1>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<td>NO</td>
					<td>Title</td>
					<td>Writer</td>
					<td>Reg_date</td>
					<td>Hit</td>
				</tr>
				<%
					for (NoticeDTO noticeDTO : ar) {
				%>
				<tr>
					<td class="num"><%=noticeDTO.getNum()%></td>
					<td class="title" id="<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle()%></td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%></td>
					<td><%=noticeDTO.getHit()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="row">
			<form action="./noticeList.jsp">
				<select name="kind">
					<option value="t">제목</option>
					<option value="w">작성자</option>
					<option value="c">내용</option>
				</select> <input type="text" name="search">
				<button>search</button>
			</form>
		</div>

		<div>
			<%
				if (curBlock > 1) {
			%>
			<a href="./noticeList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a>
			<%
				}
			%>
			<%
				for (int i = startNum; i <= lastNum; i++) {
			%>
			<a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a>
			<%
				}
			%>
			<%
				if (curBlock < totalBlock) {
			%>
			<a href="./noticeList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
			<%
				}
			%>
		</div>
		<div>
			<form id="frm" action="./noticeSelect.jsp">
				<input type="hidden" name="num" class="inp">
			</form>
		</div>
		<%if(memberDTO!=null && memberDTO.getId().equals("admin")){%>
		<div class="row">
			<a class="btn btn-primary" href="./noticeWrite.jsp">Write</a>
		</div>
		<%}%>
	</div>
	<%@ include file="../temp/footer.jsp"%>
	<script type="text/javascript">
		$('.title').click(function() {
			var a = $(this).attr('id');
			$('.inp').val(a);
			$('#frm').submit();
		});
	</script>
</body>
</html>