package logic;

import java.util.List;

import model.Condition;
import model.Order;
import model.Qna;

public interface OrderCatalog {
	Integer getMaxOrderId();//가장 큰 일련번호 검색
	void putOrder(Order order);
	List<Order> selectOrder(String user_id);
	List<Order> findAll(Condition cond);
	Integer getOrderCount();
	Integer selectRownum(Integer seqno);
}
