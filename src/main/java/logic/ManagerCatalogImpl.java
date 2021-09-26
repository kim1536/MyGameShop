package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ManagerDao;
import model.Condition;
import model.Item;
import model.Order;
import model.Ranking;
@Service
public class ManagerCatalogImpl implements ManagerCatalog {
	@Autowired
	private ManagerDao managerDao;
	
	public List<Item> getItemList(Condition cond) {
		return this.managerDao.getItemList(cond);
	}

	public Integer getItemCount() {
		return this.managerDao.getItemCount();
	}

	public void deleteItem(Item item) {
		this.managerDao.deleteItem(item);
		
	}

	public void updateItem(Item item) {
		this.managerDao.updateItem(item);
		
	}

	public List<Order> getSalesList(Condition cond) {		
		return this.managerDao.getSalesList(cond);
	}

	public Integer getSalesCount() {
		return this.managerDao.getSalesCount();
	}

	public Integer getTotalSales() {
		return this.managerDao.getTotalSales();
	}

	public List<Ranking> getRankList(Condition cond) {
		return this.managerDao.getRankList(cond);
	}
	
	
}
