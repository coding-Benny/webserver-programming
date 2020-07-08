<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="board_error.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 : 작성화면</title>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<h2>게시판 : 작성화면</h2>
<hr>
<form name="form1" method="POST" action="board_control.jsp">
<input type="hidden" name="action" value="insert">
<div class="form-group row">
    <label for="b_title" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="b_title" id="b_title">
    </div>
</div>
<div class="form-group row">
    <label for="b_author" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" name="b_author" id="b_author" value="<%= session.getAttribute("userID") %>">
    </div>
</div>
<div class="form-group row">
    <label for="b_content" class="col-sm-2 col-form-label">내용</label>
    <div class="col-sm-10">
      <textarea class="form-control" name="b_content" id="b_content" rows="3" placeholder="200자 이내로 작성하세요."></textarea>
    </div>
</div>
<input type=submit class="btn btn-primary" value="저장">
<input type=reset class="btn btn-secondary" value="취소">
<input type=button class="btn btn-light" value="목록" onClick="location.href='board_control.jsp?action=list'">
</form>
</div>
</body>
</html>