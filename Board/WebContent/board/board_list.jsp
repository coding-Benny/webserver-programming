<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="board_error.jsp" import="java.util.*,board.*"%>
<jsp:useBean id="login" class="board.Login" />
<!DOCTYPE HTML><html><head>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<script>
	function view(b_id) {
		document.location.href="board_control.jsp?action=view&b_id="+b_id;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:목록화면</title></head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="pageList" scope="request" class="java.util.ArrayList" />
<body>
<div align="center"> 
<H2>게시판:목록화면</H2>
<HR>
<%
	int pageNo = 1; // 시작 페이지는 1페이지
	
	if(request.getParameter("pageNo") != null) {
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
	}
%>
<form>
<table class="table table-striped table-hover">
	<thead class="thead-light">
	  <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
	</thead>
	<%
		BoardBean boardBean = new BoardBean();
		for(Board board : (ArrayList<Board>)datas) {
	%>
  <tr>
    <td><%=board.getB_id() %></td>
	<td><a href="javascript:view(<%=board.getB_id()%>)"><%=board.getB_title() %></a></td>
	<td><%=board.getB_author() %></td>
	<td><%=board.getB_date().substring(0, 11) + board.getB_date().substring(11, 13) + "시 " + board.getB_date().substring(14, 16) + "분" %></td>
  </tr>
	 <%
		}
	 %>
</table>
</form>
<form name=search method=post action=board_control.jsp>
     <select name="action">
         <option value="searchTitle">제목</option>
         <option value="searchAuthor">작성자</option>
         <option value="searchContent">내용</option>
     </select>
     <input type="text" style="width:200px" name="searchData"/>&nbsp;
     <input type="submit" value="검색" class="btn btn-primary"/>
 </form>
</div><br>
<%
	if(pageNo != 1) {
%>
	<a href="board_list?pageNo=<%=pageNo-1 %>" class="btn btn-success btn-arrow-Left">이전</a>
<% 
	} if(boardBean.nextPage(pageNo+1)) {
%>
	<a href="board_list?pageNo=<%=pageNo+1 %>" class="btn btn-success btn-arrow-Left">다음</a>
<%
	}
%>
<input type="button" class="btn btn-secondary" value="로그아웃" style="float: right;" onClick="location.href='board_login_form.html';session.invalidate();">
<input type="button" class="btn btn-light" value="글쓰기" style="float: right;" onClick="location.href='board_form.jsp'">

</body></html>