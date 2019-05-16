<%@page import="com.sh.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sh.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PointDAO pointDAO = new PointDAO();
/*curPage		startPage		lastPage
1			1				20
2			21				40
3			41				60*/
	int curPage=1;
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));	
	}catch(Exception e){
		
	}
	String search = request.getParameter("search");
	String kind = request.getParameter("kind");
	if(search==null){
		search="";
	}
	if(kind==null){
		kind="";
	}
	System.out.println("kind"+kind);
	System.out.println("search"+search);
	
	int perPage=10;
	int startRow = (curPage-1)*perPage+1;  
	int lastRow=curPage*perPage;
	
	//1.총글의 갯수
	int totalCount =  pointDAO.getTotalCount();
	//2.총페이지의 갯수
	int totalPage = totalCount/perPage;
	if(totalCount%perPage!=0){
		totalPage++;
	}
	//3.한블럭당 번호가 몇개씩 보일건가
	//block당 숫자의 갯수
	int perBlock=5;
	
	//4. 총 block수        
	int totalBlock = totalPage/perBlock;
	if(totalPage%perBlock!=0){
		totalBlock++;
	}
	
	//5. curPage를 이용해서 현재 block번호 찾기
	int curBlock=curPage/perBlock;  //curBlock은 현재 블럭이다. 
	if(curPage%perBlock!=0){
		curBlock++;
	}
	
	//6. curBlock에서 startNum과 lastNum찾기
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	if(startNum<1){
		startNum=1;
	}
	/* if(lastNum>totalPage){
		lastNum=totalPage;
	} */
	
	//7.curBlock이 마지막 block일 때 lastNum 다시 대입
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
	ArrayList<PointDTO> ar = pointDAO.selectList(search,startRow, lastRow);
	
%>
	
<title>Point</title>
<%@ include file="../temp/css_meta.jsp" %>
<style type="text/css">
	.main{
		min-height: 800px;
	}
</style>

</head>
<body>
	<%@ include file="../temp/header_nav.jsp" %>
  
  <div class="container main">
  	<div class="row">
  		<h1>Point Page</h1>
	</div>
	<div class="row">
		<table class="table table-hover">
  			<tr>
  				<td> 번호 </td> <td>이름</td> <td>국어</td><td>영어</td><td>수학</td><td>총점</td><td>평균</td>
  			</tr>
  			
  			<% for(PointDTO pointDTO : ar){%>
  			<tr>
  				<td><%=pointDTO.getNum()%></td> 				
  				<td><a href="./pointSelect.jsp?num=<%=pointDTO.getNum()%>"><%=pointDTO.getName()%></a></td>
  				<td><%=pointDTO.getKor() %></td>
  				<td><%=pointDTO.getEng() %></td>
  				<td><%=pointDTO.getMath()%></td>
  				<td><%=pointDTO.getTotal()%></td>
  				<td><%=pointDTO.getAvg()%></td>
  			</tr>
  			<%} %>
  		</table>
	</div>
	<div class="row">
			<form action="./point.jsp">
				<select name="kind">
					<option value="t">제목</option>
					<option value="w">작성자</option>
					<option value="c">내용</option>
				</select> <input type="text" name="search">
				<button>search</button>
			</form>
		</div>
	<div class="row">
	<%if(curBlock>1){ %>
		<a href="./point.jsp?curPage=<%=startNum-1%>">[이전]</a>
	<%} %>
		<%for(int i=startNum; i<=lastNum; i++) {%>
			<a href="./point.jsp?curPage=<%=i%>"><%=i%></a>
		<%}%>
	<%if(curBlock<totalBlock){ %>
		<a href="./point.jsp?curPage=<%=lastNum+1%>">[다음]</a>
	<%} %>
	</div>
  	<div class="row">
  		<a class="btn btn-primary" href="./pointWrite.jsp">Write</a>
  	</div>
  </div>
    <!-- Footer -->

	<%@ include file="../temp/footer.jsp" %>
</body>
</html>