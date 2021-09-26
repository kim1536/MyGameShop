package logic;

import java.util.List;

import model.Condition;
import model.Item;

public interface ItemCatalog {
	void writeItem(Item item);
	List<Item> getItems(Condition cond);
	Integer itemCount(String category);
	String getItemId(String item_id);
	List<Item> findItemForName(Condition cond);
	Integer findItemCount(Condition cond);
	Integer AllItemCount(String item_name);
	List<Item> getAllItemList(Condition cond);
	Item getItemDetail(String item_id);
}
