<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean scope="page" id="bb" class="jspbook.ch12.Bank1Bean" />
<jsp:useBean scope="page" id="bb2" class="jspbook.ch12.Bank2Bean" />
<%
	if(request.getMethod().equals("POST")) {
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		if(sender.equals("user1")) {
			if(receiver.equals("user2")) {
				if(bb.transfer(Integer.parseInt(request.getParameter("bal"))))
					out.println("<script>alert('user2에게 정상이체 되었습니다.')</script>");
				else
					out.println("<script>alert('수용한도를 초과했습니다.')</script>");
			}
			else {
				out.println("<script>alert('본인에게 이체할 수 없습니다.')</script>");
			}
		}
		else if(sender.equals("user2")) {
			if(receiver.equals("user1")) {
				if(bb2.transfer(Integer.parseInt(request.getParameter("bal"))))
					out.println("<script>alert('user1에게 정상이체 되었습니다.')</script>");
				else
					out.println("<script>alert('수용한도를 초과했습니다.')</script>");
			}
			else {
				out.println("<script>alert('본인에게 이체할 수 없습니다.')</script>");
			}
		}
	}
	bb.getData();
	bb2.getData();
%>
<html>
<head>
<meta charset="UTF-8">
<title>ch12 : 트랜잭션 테스트</title>
</head>
<body>
<div align="center">
<h3>계좌현황</h3>
<hr>
<table border=1 cellpadding=5 cellspacing=0>
<tr>
<td>Bank1</td>
<td>이름 : <%=bb.getAname() %></td>
<td>잔액 : <%=bb.getBalance() %></td>
</tr>
<tr>
<td>Bank2</td>
<td>이름 : <%=bb2.getAname() %></td>
<td>잔액 : <%=bb2.getBalance() %></td>
</tr>
</table><hr>
<form name=form1 method=post>
<select name="sender">
	<option>user1</option>
	<option>user2</option>
</select> →
<select name="receiver">
	<option>user1</option>
	<option>user2</option>
</select>
이체 금액 : <input type=text name=bal width=200 size=5><br>
<input type=submit value="이체실행" name="B1">
<input type=reset value="다시입력" name="B2">
</form>
</div>
</body>
</html>