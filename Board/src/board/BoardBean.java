package board;

import java.sql.*;
import java.util.ArrayList;

/**
 * File : BoardBean.java
 * Desc : 게시판 프로그램 DAO 클래스
 * @author 이정현(sjeonghyeonz@gmail.com)
 */

public class BoardBean {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	/* mySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb?useSSL=false&serverTimezone=Asia/Seoul";
	
	// DB연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "jh0210");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 수정된 게시글 내용 갱신을 위한 메서드
	public boolean updateDB(String userID, Board board) {
		connect();
		
		String sql = "update board set b_title=?, b_author=?, b_date=?, b_content=? where b_id=?";
		
		try {
			board.setB_date(getDate());
			board.setB_author(userID);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_author());
			pstmt.setString(3, board.getB_date());
			pstmt.setString(4, board.getB_content());
			pstmt.setInt(5, board.getB_id());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	// 특정 게시글 삭제 메서드
	public boolean deleteDB(int gb_id) {
		connect();
		
		String sql = "delete from board where b_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	// 현재 시간을 가져오는 메서드
	public String getDate() {
		String sql = "select now()";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getString(1);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	// 신규 게시판 게시글 추가 메서드
	public boolean insertDB(String userID, Board board) {
		connect();
		
		String sql = "insert into board(b_title, b_author, b_date, b_content) values(?,?,?,?)";
		
		try {
			board.setB_date(getDate());
			board.setB_author(userID);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_author());
			pstmt.setString(3, board.getB_date());
			pstmt.setString(4, board.getB_content());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	// 특정 게시글 가져오는 메서드
	public Board getDB(int gb_id) {
		connect();
		
		String sql = "select * from board where b_id=?";
		Board board = new Board();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			board.setB_id(rs.getInt("b_id"));
			board.setB_title(rs.getString("b_title"));
			board.setB_author(rs.getString("b_author"));
			board.setB_date(rs.getString("b_date"));
			board.setB_content(rs.getString("b_content"));
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return board;
	}
	
	// 전체 게시글 수 세는 메서드
	public int countTotalPost() {
		connect();
		
		String sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int totalPost = rs.getInt(1);
			return totalPost;
		} catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 내용 검색 메서드
	public ArrayList<Board> searchResultList(String keyword) {
		connect();
		ArrayList<Board> datas = new ArrayList<Board>();
		
		String sql = "select * from board where b_content like '%" + keyword +"%' order by b_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				
				board.setB_id(rs.getInt("b_id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_author(rs.getString("b_author"));
				board.setB_date(rs.getString("b_date"));
				board.setB_content(rs.getString("b_content"));
				datas.add(board);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	// 전체 게시판 목록을 가져오는 메서드
	public ArrayList<Board> getDBList() {
		connect();
		ArrayList<Board> datas = new ArrayList<Board>();
		
		String sql = "select * from board order by b_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				
				board.setB_id(rs.getInt("b_id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_author(rs.getString("b_author"));
				board.setB_date(rs.getString("b_date"));
				board.setB_content(rs.getString("b_content"));
				datas.add(board);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	public int getNext() {
		String sql = "select b_id from board order by b_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// 페이지별 게시글 리스트 가져오는 메서드
	public ArrayList<Board> getPageList(int pageNo) {
		connect();
		ArrayList<Board> datas = new ArrayList<Board>();
		
		String sql = "select * from board where b_id < ? order by b_id desc LIMIT 10";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNo -1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				
				board.setB_id(rs.getInt("b_id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_author(rs.getString("b_author"));
				board.setB_date(rs.getString("b_date"));
				board.setB_content(rs.getString("b_content"));
				datas.add(board);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

	public boolean nextPage(int pageNo) {
		connect();
		
		String sql = "select * from board where b_id < ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNo -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		return false;
	}
	// 신규 회원 정보 추가 메서드
	public boolean join(Login account) {
		connect();
		
		String sql = "insert into user_info(userid, passwd) values(?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account.getUserid());
			pstmt.setString(2, account.getPasswd());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public int login(String userid, String passwd) {
		connect();
		String sql = "select passwd from user_info where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(passwd)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디 없음
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return -2; // 데이터베이스 오류
	}
}
