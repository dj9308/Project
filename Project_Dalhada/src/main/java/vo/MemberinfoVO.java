package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberinfoVO {
	private String id ;
	private String password;
	private String image_path;
	private String birth;
	private String email;
	private String my_words;
	private String pwdchk;
	private MultipartFile image;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMy_words() {
		return my_words;
	}
	public void setMy_words(String my_words) {
		this.my_words = my_words;
	}
	public String getPwdchk() {
		return pwdchk;
	}
	public void setPwdchk(String pwdchk) {
		this.pwdchk = pwdchk;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	
}
