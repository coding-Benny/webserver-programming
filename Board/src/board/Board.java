package board;

/**
 * File : Board.java
 * Desc : 게시판 프로그램 DO 클래스
 * @author 이정현 (sjeonghyeonz@gmail.com)
 */

public class Board {
	// 멤버변수 관련
	private int b_id;
	private String b_title;
	private String b_author;
	private String b_date;
	private String b_content;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_author() {
		return b_author;
	}
	public void setB_author(String b_author) {
		this.b_author = b_author;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
}
