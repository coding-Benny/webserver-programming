<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.io.PrintWriter, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPasswd = null;
	if(request.getParameter("accountId") != null) {
		userID = request.getParameter("accountId");
	}
	if(request.getParameter("accountPasswd") != null) {
		userPasswd = request.getParameter("accountPasswd");
	}
	if(userID == null || userPasswd == null) {
		out.println("<script>alert('입력이 안 된 항목이 있습니다.');history.go(-1);</script>");
		return;
	}
	BoardBean boardBean = new BoardBean();
	int result = boardBean.login(userID, userPasswd);
	if(result == 1) {
		session.setAttribute("userID", userID);
		session.setAttribute("userPasswd", userPasswd);
		out.println("<script>document.location.href='board_list.jsp'</script>");
		return;
	}
	else if(result == 0) {
		out.println("<script>alert('잘못된 비밀번호입니다.');history.go(-1);</script>");
		return;
	}
	else if(result == -1) {
		out.println("<script>alert('존재하지 않는 아이디입니다.');history.go(-1);</script>");
		return;
	}
	else if(result == -2) {
		out.println("<script>alert('데이터베이스 오류가 발생했습니다.');history.go(-1);</script>");
		return;
	}
	response.sendRedirect("board_control.jsp?action=list");
%>