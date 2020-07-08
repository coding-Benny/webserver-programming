<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  errorPage="board_error.jsp" import="board.*,java.util.*"%>
<!DOCTYPE HTML>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bb" class="board.BoardBean"/> 
<jsp:useBean id="board" class="board.Board"/>
<jsp:useBean id="login" class="board.Login" />
<jsp:setProperty name="board" property="*"/> 
<% 
// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");	// 파라미터에 따른 요청 처리
	String userID = session.getAttribute("userID").toString(); // 현재 로그인 사용자
	String userPasswd = session.getAttribute("userPasswd").toString(); // 현재 로그인 비밀번호
	
	// 게시판 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<Board> datas = bb.getDBList();
		request.setAttribute("datas", datas);
        pageContext.forward("board_list.jsp");
	}	
	// 게시판 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(bb.insertDB(userID, board)) {
			response.sendRedirect("board_control.jsp?action=list");
		}
		else
			throw new Exception("DB 입력오류");
	}	
	// 게시글 보기 요청인 경우
	else if(action.equals("view")) {
		Board bboard = bb.getDB(board.getB_id());
		
		request.setAttribute("bb", bboard);
		pageContext.forward("board_content.jsp");
	}	
	// 게시판 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		Board bboard = bb.getDB(board.getB_id());
		if(request.getParameter("b_author").equals(userID)) { // 관리자는 || "admin".equals(userID)
			if(!request.getParameter("passwd").equals(userPasswd)) {
				out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
			}
			else {
				request.setAttribute("bb", bboard);
				pageContext.forward("board_edit_form.jsp");
			}
		}
		else {
			out.println("<script>alert('작성자만 수정할 수 있습니다!!!');history.go(-1);</script>");
		}
	}	
	// 게시글 업데이트 요청인 경우
	else if(action.equals("update")) {
			if(bb.updateDB(userID, board)) {
				response.sendRedirect("board_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}	
	// 게시글 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(request.getParameter("b_author").equals(userID)) { // 관리자는 || "admin".equals(userID)
			if(!request.getParameter("passwd").equals(userPasswd)) {
				out.println("<script>alert('비밀번호 오류입니다!!!');history.go(-1);</script>");
			}
			else {
				if(bb.deleteDB(board.getB_id())) {
					response.sendRedirect("board_control.jsp?action=list");
				}
				else
					throw new Exception("DB 삭제 오류");
			}
		}
		else {
			out.println("<script>alert('작성자만 삭제할 수 있습니다!!!');history.go(-1);</script>");
		}
	}
	// 작성자로 게시글 검색 요청하는 경우
	else if(action.equals("searchAuthor")) {
		String searchData = request.getParameter("searchData");
		ArrayList<Board> datas = bb.getDBList();
		ArrayList<Board> searchResults = new ArrayList<Board>();
		for(Board result : (ArrayList<Board>) datas) {
			if(result.getB_author().equals(searchData)) {
				searchResults.add(result);
			}
		}
		request.setAttribute("searchResults", searchResults);
		pageContext.forward("board_search_result.jsp");
	}
	// 제목으로 게시글 검색 요청하는 경우
	else if(action.equals("searchTitle")) {
		String searchData = request.getParameter("searchData");
		ArrayList<Board> datas = bb.getDBList();
		ArrayList<Board> searchResults = new ArrayList<Board>();
		for(Board result : (ArrayList<Board>) datas) {
			if(result.getB_title().contains(searchData)) {
				searchResults.add(result);
			}
		}
		request.setAttribute("searchResults", searchResults);
		pageContext.forward("board_search_result.jsp");
	}
	// 내용으로 게시글 검색 요청하는 경우
	else if(action.equals("searchContent")) {
		String searchData = request.getParameter("searchData");
		//ArrayList<Board> datas = bb.getDBList();
		ArrayList<Board> datas = bb.searchResultList(searchData);
		ArrayList<Board> searchResults = new ArrayList<Board>();
		for(Board result : (ArrayList<Board>) datas) {
			if(result.getB_content().contains(searchData)) {
				searchResults.add(result);
			}
		}
		request.setAttribute("searchResults", searchResults);
		pageContext.forward("board_search_result.jsp");
	}
	// 회원가입 요청인 경우
	else if(action.equals("join")) {
		response.sendRedirect("board_register.jsp");
	}  // 로그인 요청인 경우
	else if(action.equals("login")) {
		ArrayList<Board> datas = bb.getDBList();
		response.sendRedirect("board_login.jsp");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>