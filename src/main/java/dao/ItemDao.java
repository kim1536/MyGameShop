package dao;

import java.util.List;

import model.Condition;
import model.Item;

public interface ItemDao {
	List<Item> getItemList(Condition cond);
	void putItem(Item item);
	Integer getItemCount(String category);
	String getItemId(String item_id);
	List<Item> findItemTitle(Condition cond);
	Integer findItemCount(Condition cond);
	Integer AllItemCount(String item_name);
	List<Item> getAllItemList(Condition cond);
	Item getItemDetail(String item_id);
}
