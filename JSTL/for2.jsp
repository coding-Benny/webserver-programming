<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합 구하기</title>
</head>
<body bgcolor="#FFFFFF">
<h3>1부터 100까지의 합</h3>
<form>
<select name="sel">
	<option>-</option>
	<option ${param.sel=='총합'? 'selected':'' }>총합</option>
	<option ${param.sel=='짝수'? 'selected':'' }>짝수</option>
	<option ${param.sel=='홀수'? 'selected':'' }>홀수</option>
</select>
<input type=submit value="선택">
</form>
<hr>
<c:choose>
	<c:when test="${param.sel=='총합' }" >
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${sum + i }" />
		</c:forEach>
		총합 : ${sum }
	</c:when>
	<c:when test="${param.sel=='짝수' }">
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="2" end="100" step="2">
		<c:set var="sum" value="${sum + i }" />
		</c:forEach>
		짝수의 합 : ${sum }
	</c:when>
	<c:when test="${param.sel=='홀수' }">
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum + i }" />
		</c:forEach>
		홀수의 합 : ${sum }
	</c:when>
	<c:otherwise>
		총합, 짝수의 합, 홀수의 합 중에 선택하세요
	</c:otherwise>
</c:choose>
</body>
</html>