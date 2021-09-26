package logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MypageDao;
import model.User;
@Service
public class MypageCatalogImpl implements MypageCatalog {
	@Autowired
	private MypageDao mypageDao;
	
	public void updateUser(User user) {
		this.mypageDao.updateUser(user);

	}

	public void deleteUser(User user) {
		this.mypageDao.deleteUser(user);

	}

	public User getPassword(String password) {
		return this.mypageDao.getPassword(password);
	}

	public User getUserId(String userId) {
		return this.mypageDao.getUserId(userId);
	}

	public User getUser(String idUser) {
		return this.mypageDao.getUser(idUser);
	}

}
