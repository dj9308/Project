package vo;

public class MemberinfoVO {
	private String mid ;
	private String pw;
	private String email;
	private String phone;
	private String pwdchk;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwdchk() {
		return pwdchk;
	}
	public void setPwdchk(String pwdchk) {
		this.pwdchk = pwdchk;
	}
	@Override
	public String toString() {
		return "MemberinfoVO [mid=" + mid + ", pw=" + pw + ", email=" + email + ", phone=" + phone + ", pwdchk="
				+ pwdchk + "]";
	}
	
	
}
