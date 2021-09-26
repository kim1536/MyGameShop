package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Item;

@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	private SqlSession session;
	private final String NAME = "mapper.itemMapper.";
		
	public Integer findItemCount(Condition cond) {
		return session.selectOne(NAME+"findItemCount", cond);
	}

	public Integer AllItemCount(String item_name) {
		return session.selectOne(NAME+"AllItemCount", item_name);
	}

	public List<Item> getAllItemList(Condition cond) {
		return session.selectList(NAME+"getAllItemList",cond);
	}

	public List<Item> getItemList(Condition cond) {
		return session.selectList(NAME+"getItemList",cond);
	}

	public Integer getItemCount(String category) {
		return this.session.selectOne(NAME+"getItemCount",category);
	}

	public Item getItemDetail(String item_id) {
		return session.selectOne(NAME+"getItemDetail",item_id);
	}

	public String getItemId(String item_id) {
		return this.session.selectOne(NAME+"getItemId", item_id);
	}

	public List<Item> findItemTitle(Condition cond) {
		return this.session.selectList(NAME+"findItemTitle",cond);
	}

	public void putItem(Item item) {
		session.insert(NAME+"putItem",item);
	}

}
