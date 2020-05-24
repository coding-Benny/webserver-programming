<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.PrintWriter, jspbook.addrbook.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPasswd = null;
	if(request.getParameter("userid") != null) {
		userID = request.getParameter("userid");
	}
	if(request.getParameter("passwd") != null) {
		userPasswd = request.getParameter("passwd");
	}
	if(userID == null || userPasswd == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	AddrBean addrBean = new AddrBean();
	boolean result = addrBean.join(new Login(userID, userPasswd));
	if(!result) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		return;
	}
	response.sendRedirect("addrbook_control.jsp?action=list");
%>
