package board;

public class Login {
	
	
	// 멤버변수 선언
	private String userid;
	private String passwd;
	
	final String _userid = null;
	final String _passwd = null;
	
	public Login() {
		
	}
	
	public Login(String userid, String passwd) {
		this.userid = userid;
		this.passwd = passwd;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	
}

