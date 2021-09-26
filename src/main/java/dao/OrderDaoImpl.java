package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Order;

@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SqlSession session;
	
	
	public List<Order> findAll(Condition cond) {
		return session.selectList("mapper.orderMapper.getOrderList",cond );
	}

	public Integer getOrderCount() {
		return session.selectOne("mapper.orderMapper.getSeqnoCount");
	}

	public Integer selectRownum(Integer seqno) {
		return session.selectOne("mapper.orderMapper.selectRownumBySeqno",seqno);
	}

	public Integer getMaxOrderId() {
		return session.selectOne("mapper.orderMapper.getMaxSeqnoOrder");
	}

	public void putOrder(Order order) {
		session.insert("mapper.orderMapper.putOrder",order);
	}

	public List<Order> selectOrder(String user_id) {
		return session.selectList("mapper.orderMapper.getOrder",user_id);
	}

}
