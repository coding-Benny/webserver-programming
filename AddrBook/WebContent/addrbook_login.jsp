<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.addrbook.*, java.io.PrintWriter" %>
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
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 항목이 있습니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	AddrBean addrBean = new AddrBean();
	int result = addrBean.login(userID, userPasswd);
	if(result == 1) {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("document.location.href = 'addrbook_list.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 비밀번호입니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	else if(result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	response.sendRedirect("addrbook_control.jsp?action=list");
%>