package logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LoginDao;
import model.Admin;
import model.Login;
import model.User;

@Service
public class LoginCatalogImpl implements LoginCatalog {
	@Autowired
	private LoginDao loginDao;
	
	public void putUser(User user) {
		this.loginDao.putUser(user);
	}

	public String getUserId(String USER_ID) {
		return this.loginDao.getUserId(USER_ID);
	}

	public String searchId(User user) {
		return this.loginDao.searchId(user);
	}

	public String searchPwd(User user) {
		return this.loginDao.searchPwd(user);
	}

	public void newPwd(User user) {
		this.loginDao.newPwd(user);
	}

	public User getUser(Login login) {
		return this.loginDao.getUser(login);
	}

	public Admin getAdmin(Login login) {
		return this.loginDao.getAdmin(login);
	}

}
