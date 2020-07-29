<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch05 : include action 테스트</title>
</head>
<body>
<h2>forward_action.jsp에서 footer.jsp 호출</h2>
<hr>
forward_action.jsp에서 출력한 메세지 입니다.<br>
<jsp:forward page="footer.jsp">
<jsp:param name="start" value="1" />
<jsp:param name="last" value="100" />
</jsp:forward>
</body>
</html>