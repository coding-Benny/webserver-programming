<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>JSP FORM 결과</title>
</head>
<body>
	<div align="center">
		<h2>JSP FORM 결과</h2>
		<hr>
		<table border=1 cellspacing="1" cellpadding="5">
			<tr>
				<td>이름</td>
				<td><%=request.getParameter("name")%></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><%=request.getParameter("password")%></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=request.getParameter("gender")%></td>
			</tr>
			<tr>
				<td>좋아하는 스포츠</td>
				<td>
					<%
						String favoriteSports[] = request.getParameterValues("sports");
					for (String sports : favoriteSports) {
						out.println(sports + "<br>");
					}
					%>
				</td>
			</tr>
			<tr>
				<td>좋아하는 과일</td>
				<td>
					<%
						String favoriteFruits[] = request.getParameterValues("fruits");
					for (String fruits : favoriteFruits) {
						out.println(fruits + "<br>");
					}
					%>
				</td>
			</tr>
			<tr>
				<td>좋아하는 음악</td>
				<td><%=request.getParameter("music")%></td>
			</tr>
			<tr>
				<td>기타 제안 사항</td>
				<td><%=request.getParameter("suggestion")%></td>
			</tr>
		</table>
		<hr>
		<h2>request 테스트 결과 - 2</h2>
		<table border=0>
			<tr>
				<td>1. 클라이언트 IP 주소 : <%=request.getRemoteAddr()%><br> 2.
					요청 메서드 : <%=request.getMethod()%><br> <%
 	Cookie cookie[] = request.getCookies();
 %> 3. <%=cookie[0].getName()%>에 설정된 쿠키값 : <%=cookie[0].getValue() %><br>
					4. 프로토콜 : <%= request.getProtocol() %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>