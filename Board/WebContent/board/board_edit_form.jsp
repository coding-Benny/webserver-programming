<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="board_error.jsp" import="board.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판:수정화면</title>
</head>
<jsp:useBean id="bb" scope="request" class="board.Board" />
<body>
<div align="center">
<H2>게시판:수정화면 </H2>
<HR>
<form name="editform" method="POST" action="board_control.jsp">
<input type="hidden" name="action" value="update">
<input type="hidden" name="b_id" value="<%=bb.getB_id()%>">

  <div class="form-group row">
    <label for="b_title" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="b_title" id="b_title" value="<%=bb.getB_title() %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="b_author" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext form-control-sm" name="b_author" id="b_author" value="<%=bb.getB_author() %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="b_content" class="col-sm-2 col-form-label">내용</label>
    <div class="col-sm-10">
      <textarea class="form-control" name="b_content" id="b_content" rows="3"><%=bb.getB_content() %></textarea>
    </div>
  </div>

<br>

<div align=right>
	<input type="submit" class="btn btn-primary" value="저장">
	<input type="reset" class="btn btn-secondary" value="취소">
</div>
</form>
</div>
</body>
</html>