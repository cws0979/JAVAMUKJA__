package spring.model.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
    private String  id       ;  
    private String  passwd   ;
    private String  mname    ;
    private String  email    ;
    private String  zipcode  ;
    private String  address  ;
    private String  fname    ;
    private String  grade    ;
    private String  nickname ;
    private MultipartFile fnameMF;
    
	public MemberDTO() {
		super();
	}
	

	public MemberDTO(String id, String passwd, String mname, String email, String zipcode, String address, String fname,
			String grade, String nickname, MultipartFile fnameMF) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.mname = mname;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.fname = fname;
		this.grade = grade;
		this.nickname = nickname;
		this.fnameMF = fnameMF;
	}


	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", mname=" + mname + ", email=" + email + ", zipcode="
				+ zipcode + ", address=" + address + ", fname=" + fname + ", grade=" + grade + ", nickname=" + nickname
				+ ", fnameMF=" + fnameMF + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public MultipartFile getFnameMF() {
		return fnameMF;
	}

	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
    
}
