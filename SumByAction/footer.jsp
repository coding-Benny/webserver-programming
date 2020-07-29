<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch05 : footer.jsp</title>
</head>
<body>
footer.jsp에서 출력한 메세지입니다.
<hr>
<%= request.getParameter("start") %>,
<%= request.getParameter("last") %>

<%
	int start = Integer.parseInt(request.getParameter("start"));
	int last = Integer.parseInt(request.getParameter("last"));
	int sum = 0;
	for(int i=start; i<=last; i++) {
		sum += i;
	}
	out.println(start + "부터 " + last + "까지의 합 : " + sum);
%>
</body>
</html>