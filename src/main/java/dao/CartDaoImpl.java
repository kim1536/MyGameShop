package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CartItem;
@Repository
public class CartDaoImpl implements CartDao {
	@Autowired
	private SqlSession session;
	public void insertCart(CartItem item) {
		session.insert("mapper.cartMapper.putCart",item);
	}
	public void deleteCart(CartItem item) {
		session.delete("mapper.cartMapper.deleteCart",item);
	}
	public void updateCart(CartItem item) {
		session.update("mapper.cartMapper.updateCart",item);
	}
	public Integer getMaxCartId() {
		return session.selectOne("mapper.cartMapper.getMaxSeqnoCart");
	}
	public List<CartItem> selectCart(String id) {
		return session.selectList("mapper.cartMapper.getCart",id);
	}
	public void deleteAll(String user_id) {
		session.delete("mapper.cartMapper.deleteAll",user_id);
	}

}
