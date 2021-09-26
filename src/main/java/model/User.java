package model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
	@NotEmpty(message="아이디는 반드시 입력해야 합니다.")
	private String user_id;
	@NotEmpty(message="비밀번호는 반드시 입력해야 합니다.")
	private String password;
	@NotEmpty(message="이름은 반드시 입력해야 합니다.")
	private String user_name;
	private String birthday;
	@Email(message="형식이 알맞지 않습니다.")
	private String email;
	@NotEmpty(message="주소는 반드시 입력해야 합니다.")
	private String address;
	private String tel;
	
	private String year;
	private String month;
	private String date;
	
	@NotEmpty(message="전화번호는 반드시 입력해야 합니다.")
	private String tel1;
	@NotEmpty(message="전화번호는 반드시 입력해야 합니다.")
	private String tel2;
	@NotEmpty(message="전화번호는 반드시 입력해야 합니다.")
	private String tel3;
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String brithday) {
		this.birthday = brithday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
