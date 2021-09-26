package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemDao;
import model.Condition;
import model.Item;

@Service
public class ItemCatalogImpl implements ItemCatalog {
	@Autowired
	private ItemDao itemDao;
	
	
	public Integer findItemCount(Condition cond) {
		return this.itemDao.findItemCount(cond);
	}

	public Integer AllItemCount(String item_name) {
		return this.itemDao.AllItemCount(item_name);
	}

	public List<Item> getAllItemList(Condition cond) {
		return this.itemDao.getAllItemList(cond);
	}

	public Item getItemDetail(String item_id) {
		return this.itemDao.getItemDetail(item_id);
	}

	public String getItemId(String item_id) {
		return this.itemDao.getItemId(item_id);
	}

	public List<Item> findItemForName(Condition cond) {
		return this.itemDao.findItemTitle(cond);
	}

	public void writeItem(Item item) {
		this.itemDao.putItem(item);
	}

	public List<Item> getItems(Condition cond) {
		return this.itemDao.getItemList(cond);
	}

	public Integer itemCount(String category) {
		return this.itemDao.getItemCount(category);
	}

}
