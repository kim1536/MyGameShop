package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Admin;
import model.Login;
import model.User;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSession session;
	private final String NAME = "mapper.loginMapper.";
	
	public void putUser(User user) {
		this.session.insert(NAME+"putUser",user);
	}

	public String getUserId(String USER_ID) {
		return this.session.selectOne(NAME+"getUserId", USER_ID);
	}

	public String searchId(User user) {
		return this.session.selectOne(NAME+"searchId",user);
	}

	public String searchPwd(User user) {
		return this.session.selectOne(NAME+"searchPwd", user);
	}

	public User getUser(Login login) {
		return this.session.selectOne(NAME+"getUser", login);
	}

	public Admin getAdmin(Login login) {
		return this.session.selectOne(NAME+"getAdmin",login);
	}

	public void newPwd(User user) {
		this.session.update(NAME+"newPwd", user);
	}

}
