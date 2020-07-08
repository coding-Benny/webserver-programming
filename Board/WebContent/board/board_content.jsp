<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="board_error.jsp" import="board.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<jsp:useBean id="bb" scope="request" class="board.Board" />
<script type="text/javascript">
	function delcheck(b_id, b_author) {
		result = confirm("정말로 삭제하시겠습니까 ?");

		if(result == true){
			pwd = prompt('삭제하려면 비밀번호를 입력하세요');
			document.location.href="board_control.jsp?action=delete&b_id="+b_id+"&b_author="+b_author+"&passwd="+pwd;
		}
		else
			return;
	}
	function editcheck(b_id, b_author) {
		pwd = prompt('수정하려면 비밀번호를 입력하세요');
		document.location.href="board_control.jsp?action=edit&b_id="+b_id+"&b_author="+b_author+"&passwd="+pwd;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:게시글보기</title>
</head>
<body>
<div align="center">
<H2>게시판:게시글보기</H2>
<HR>
<form name=content method=post action=board_control.jsp>
<input type=hidden name="b_id" value="<%=bb.getB_id()%>">
<input type=hidden name="action" value="update">

<table class="table">
  <tr>
    <th style="width: 10%">제목</th>
    <td><%=bb.getB_title()%></td>
  </tr>
  <tr>
    <th style="width: 10%">작성자</th>
    <td><%=bb.getB_author() %></td>
  </tr>
    <tr>
    <th style="width: 10%">내용</th>
    <td><%=bb.getB_content() %></td>
  </tr>
  <tr>
    <td colspan=2 align=right>
    	<input type="button" class="btn btn-primary" value="수정" onClick="editcheck('<%=bb.getB_id()%>', '<%=bb.getB_author()%>')">
     	<input type="button" class="btn btn-danger" value="삭제" onClick="delcheck('<%=bb.getB_id()%>', '<%=bb.getB_author()%>')">
     	<input type="button" class="btn btn-secondary" value="목록" onClick="location.href='board_control.jsp?action=list'">
    </td>
</tr>
</table>
</form>

</div>
</body>
</html>