package dao;

import java.util.List;

import model.Condition;
import model.Item;
import model.Order;
import model.Ranking;

public interface ManagerDao {
	List<Item> getItemList(Condition cond);
	Integer getItemCount();
	void deleteItem(Item item);
	void updateItem(Item item);
	
	List<Order> getSalesList(Condition cond);
	Integer getSalesCount();
	Integer getTotalSales();
	
	List<Ranking> getRankList(Condition cond);
	
}
