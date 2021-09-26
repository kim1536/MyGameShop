package dao;

import java.util.List;

import model.CartItem;

public interface CartDao {
	void insertCart(CartItem item);//장바구니정보를 DB에 삽입
	void deleteCart(CartItem item);//삭제
	void updateCart(CartItem item);//변경
	Integer getMaxCartId();//가장 큰 일련번호 검색
	List<CartItem> selectCart(String id);//계정으로 장바구니 정보 검색
	void deleteAll(String user_id);
}
