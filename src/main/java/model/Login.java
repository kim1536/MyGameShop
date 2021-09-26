package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Login {
	@NotEmpty(message="아이디는 반드시 입력해야 합니다.")
	private String id;
	@NotEmpty(message="비밀번호는 반드시 입력해야 합니다.")
	private String password;
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
}
