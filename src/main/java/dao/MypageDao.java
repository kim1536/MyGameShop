package dao;

import model.User;

public interface MypageDao {
	User getPassword(String password);
	User getUserId(String userId);
	User getUser(String idUser);//user정보를 가져온다.
	void updateUser(User user);//회원 정보 수정
	void deleteUser(User user);//회원 정보  삭제
	
}
