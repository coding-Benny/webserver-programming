<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="board_error.jsp" import="java.util.*,board.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<script type="text/javascript">
	function view(b_id) {
		document.location.href="board_control.jsp?action=view&b_id="+b_id;
	}
</script>
<meta charset="UTF-8">
<title>게시판 : 검색결과</title>
</head>
<jsp:useBean id="searchResults" scope="request" class="java.util.ArrayList" />
<body>
<div align=center>
<h2>게시판 : 검색결과</h2>
<hr>
<table class="table table-striped table-hover">
	<thead class="thead-light">
	  <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
	</thead>
	<%
		for(Board board : (ArrayList<Board>) searchResults) {
	%>
  <tr>
    <td><%=board.getB_id() %></td>
	<td><a href="javascript:view(<%=board.getB_id()%>)"><%=board.getB_title() %></a></td>
	<td><%=board.getB_author() %></td>
	<td><%=board.getB_date() %></td>
  </tr>
	 <%
		}
	 %>
</table>
<input type="button" class="btn btn-success" value="이전" onClick="history.go(-1);">
</div>
</body>
</html>