package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import logic.ManagerCatalog;
import model.Condition;
import model.Item;
import model.Order;
import model.Ranking;
import model.Sales;

@Controller
public class ManagerController {
	@Autowired 
	private ManagerCatalog managerCatalog;
	@Autowired
	private ItemCatalog itemCatalog;
	
	@RequestMapping(value="manager/updateDo.html")
	public ModelAndView updateDo(Item item) {
		ModelAndView mav = new ModelAndView("redirect:/manager/itemManage.html");
		this.managerCatalog.updateItem(item);
		return mav;
	}
	@RequestMapping(value="manager/itemUpdate.html")
	public ModelAndView updateItem(String itemId) {
		ModelAndView mav = new ModelAndView("manager/adminpage");
		Item item = this.itemCatalog.getItemDetail(itemId);
		mav.addObject(item);
		mav.addObject("BODY","itemUpdate.jsp");
		return mav;
	}
	@RequestMapping(value="manager/deleteDo.html")
	public ModelAndView deleteDo(Item item) {
		ModelAndView mav = new ModelAndView("redirect:/manager/itemManage.html");
		this.managerCatalog.deleteItem(item);
		mav.addObject("BODY","itemManage.html");
		return mav;
	}
	
	@RequestMapping(value="/manager/itemDelete.html")
	public ModelAndView deleteItem(String itemId) {
		ModelAndView mav = new ModelAndView("manager/adminpage");
		Item item = this.itemCatalog.getItemDetail(itemId);
		mav.addObject(item);
		mav.addObject("BODY","itemDelete.jsp");
		return mav;
	}
	
	@RequestMapping(value="/manager/itemManage.html")
	public ModelAndView managerItemList(Integer pageNo) {
		ModelAndView mav = new ModelAndView("manager/adminpage");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (currentPage * 10);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Item> itemList = managerCatalog.getItemList(cond);
		mav.addObject("ITEMLIST",itemList);
		Integer totalCount = managerCatalog.getItemCount();
		int pageCount = totalCount / 10;
		if(totalCount % 10 > 0) pageCount++;
		mav.addObject("pageCount",pageCount);
		mav.addObject("BODY", "itemManage.jsp");
		return mav;
	}
	
	@RequestMapping(value="manager/salesManage.html")
	public ModelAndView salesList(Integer pageNo, Sales sales) {
		ModelAndView mav = new ModelAndView("manager/adminpage");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (currentPage * 10);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Order> salesList = managerCatalog.getSalesList(cond);
		mav.addObject("SALESLIST", salesList);
		Integer totalCount = managerCatalog.getSalesCount();
		int pageCount = totalCount / 10;
		if(totalCount % 10 > 0) pageCount++;
		int sum = this.managerCatalog.getTotalSales();
		mav.addObject("pageCount", pageCount);
		mav.addObject("SUM",sum);
		mav.addObject("BODY","salesManage.jsp");
		return mav;
	}
	
	@RequestMapping(value="manager/rankingList.html")
	public ModelAndView rankingList(Integer pageNo) {
		ModelAndView mav = new ModelAndView("manager/rankList");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (currentPage * 10);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Ranking> rankingList = managerCatalog.getRankList(cond);
		mav.addObject("RANKLIST", rankingList);
		Integer totalCount = managerCatalog.getSalesCount();
		int pageCount = totalCount / 10;
		if(totalCount % 10 > 0) pageCount++;
		mav.addObject("pageCount", pageCount);
		return mav;
		
	}
	
	@RequestMapping(value="manager/homeRank.html")
	public ModelAndView homeRank(Integer pageNo) {
		ModelAndView mav = new ModelAndView("manager/homeRank");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (currentPage * 10);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Ranking> rankingList = managerCatalog.getRankList(cond);
		mav.addObject("RANKLIST", rankingList);
		Integer totalCount = managerCatalog.getSalesCount();
		int pageCount = totalCount / 10;
		if(totalCount % 10 > 0) pageCount++;
		mav.addObject("pageCount", pageCount);
		return mav;
		
	}
	
	
}
