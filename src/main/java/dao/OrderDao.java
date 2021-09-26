package dao;

import java.util.List;

import model.Condition;
import model.Order;

public interface OrderDao {
	List<Order> findAll(Condition cond);
	Integer getOrderCount();
	Integer selectRownum(Integer seqno);
	Integer getMaxOrderId();//가장 큰 일련번호 검색
	void putOrder(Order order);
	List<Order> selectOrder(String user_id);
}
