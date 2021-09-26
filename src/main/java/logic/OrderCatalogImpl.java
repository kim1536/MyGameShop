package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OrderDao;
import model.Condition;
import model.Order;

@Service
public class OrderCatalogImpl implements OrderCatalog{
	@Autowired
	private OrderDao orderDao;
	
	public Integer getMaxOrderId() {
		return this.orderDao.getMaxOrderId();
	}

	public void putOrder(Order order) {
		this.orderDao.putOrder(order);
	}

	public List<Order> selectOrder(String user_id) {
		return this.orderDao.selectOrder(user_id);
	}

	public List<Order> findAll(Condition cond) {
		return this.orderDao.findAll(cond);
	}

	public Integer getOrderCount() {
		return this.orderDao.getOrderCount();
	}

	public Integer selectRownum(Integer seqno) {
		return this.orderDao.selectRownum(seqno);
	}
	
}
