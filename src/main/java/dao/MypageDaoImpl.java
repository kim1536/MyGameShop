package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;
@Repository
public class MypageDaoImpl implements MypageDao {
	

	@Autowired
	private SqlSession session;

	public void updateUser(User user) {
		this.session.update("mapper.mypageMapper.updateUser",user);
	}

	public User getPassword(String password) {
		return this.session.selectOne("mapper.mypageMapper.getPassword",password);
	}

	public User getUserId(String userId) {
		return this.session.selectOne("mapper.mypageMapper.getUserId",userId);
	}

	public void deleteUser(User user) {
		this.session.delete("mapper.mypageMapper.deleteUser",user.getUser_id());
		
	}

	public User getUser(String idUser) {
		return this.session.selectOne("mapper.mypageMapper.getUser", idUser);
	}

	
	
	
}
