package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Item;
import model.Order;
import model.Ranking;
@Repository
public class MangerDaoImpl implements ManagerDao {

	@Autowired
	private SqlSession session;
	private final String NAME = "mapper.managerMapper.";
	
	public List<Item> getItemList(Condition cond) {
		return this.session.selectList(NAME+ "getItemList", cond);
	}

	public Integer getItemCount() {
		return this.session.selectOne(NAME+"getItemCount");
	}

	public void deleteItem(Item item) {
		session.delete(NAME+"deleteItem", item.getItem_id());
		
	}

	public void updateItem(Item item) {
		session.update(NAME+"updateItem",item);
		
	}
	
	public List<Order> getSalesList(Condition cond) {
		return session.selectList(NAME+"getSalesList", cond);
	}

	public Integer getSalesCount() {
		return session.selectOne(NAME+"getSalesCount");
	}

	public Integer getTotalSales() {
		return session.selectOne(NAME+"getTotalSales");
	}

	public List<Ranking> getRankList(Condition cond) {
		return session.selectList(NAME+"getRanking", cond);
	}
	

}
