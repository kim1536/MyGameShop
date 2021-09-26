package logic;

import model.User;

public interface MypageCatalog {
	User getPassword(String password);
	User getUserId(String userid);
	User getUser(String idUser);//user정보를 가져온다.
	void updateUser(User user);//회원 정보 수정
	void deleteUser(User user);//회원 정보  삭제
}
