package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import model.Condition;
import model.Item;

@Controller
public class ItemController {
	
	@Autowired
	private ItemCatalog itemCatalog;
	
	@RequestMapping(value="/item/itemDetail.html")
	public ModelAndView itemDetail(String ID) {
		Item item = this.itemCatalog.getItemDetail(ID);
		ModelAndView mav = new ModelAndView("item/itemDetail");
		mav.addObject("ITEM", item);
		return mav;
	}
	
	@RequestMapping(value="/item/allBbs.html")
	public ModelAndView allList(Integer pageNo,String SEARCH) {
		Integer cnt = itemCatalog.AllItemCount(SEARCH);
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0; int pageCnt = 0;
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt > 0) {
			pageCnt = cnt / 8;
			if(cnt % 8 > 0) pageCnt++;
			startRow = (currentPage - 1) * 8 + 1;
			endRow = currentPage * 8;
		}
		Condition c = new Condition();
		c.setItem_name(SEARCH);
		c.setStartRow(startRow); c.setEndRow(endRow); 
		List<Item> itemList = this.itemCatalog.getAllItemList(c);
		ModelAndView mav = new ModelAndView("item/itemAllList");
		mav.addObject("itemList",itemList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("SEARCH", SEARCH);
		return mav;
	}
	
	@RequestMapping(value="/item/searchItem.html")
	public ModelAndView findItem(Integer pageNo,String CATEGORY,String SEARCH) {
		Condition c = new Condition(); 
		c.setCategory(CATEGORY); c.setItem_name(SEARCH);
		Integer cnt = itemCatalog.findItemCount(c);
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0; int pageCnt = 0;
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt > 0) {
			pageCnt = cnt / 8;
			if(cnt % 8 > 0) pageCnt++;
			startRow = (currentPage - 1) * 8 + 1;
			endRow = currentPage * 8;
		}
		c.setStartRow(startRow); c.setEndRow(endRow); 
		List<Item> itemList = this.itemCatalog.findItemForName(c);
		ModelAndView mav = new ModelAndView("item/itemList");
		mav.addObject("itemList",itemList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("CATEGORY", CATEGORY);
		mav.addObject("SR", "searchResult");
		mav.addObject("SEARCH", SEARCH);
		return mav;
	}
	
	@RequestMapping(value="/item/check.html")
	public ModelAndView idcheck(String ITEM_ID) {
		ModelAndView mav = new ModelAndView("item/itemIdCheck");
		String id = itemCatalog.getItemId(ITEM_ID);
		if(id != null) mav.addObject("DUP","YES");
		else mav.addObject("DUP","NO");
		mav.addObject("ID",ITEM_ID);
		return mav;
	}
	
	@RequestMapping(value="/item/goBbs.html")
	public ModelAndView list(Integer pageNo,String CATE) {
		Integer cnt = itemCatalog.itemCount(CATE);
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0; int pageCnt = 0;
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt > 0) {
			pageCnt = cnt / 8;
			if(cnt % 8 > 0) pageCnt++;
			startRow = (currentPage - 1) * 8 + 1;
			endRow = currentPage * 8;
		}
		Condition c = new Condition();
		c.setStartRow(startRow); c.setEndRow(endRow); c.setCategory(CATE);
		List<Item> itemList = this.itemCatalog.getItems(c);
		ModelAndView mav = new ModelAndView("item/itemList");
		mav.addObject("itemList",itemList);
		mav.addObject("COUNT", pageCnt);
		mav.addObject("CATEGORY", CATE);
		return mav;
	}
	
	@RequestMapping(value="/item/entryItem.html")
	public ModelAndView entry(@Valid Item item, BindingResult br, HttpSession session) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("item/itemEntry");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		MultipartFile multiFile = item.getImage();
		String fileName = null; String path = null; OutputStream os = null;
		if(multiFile != null) {
			fileName = multiFile.getOriginalFilename();
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			System.out.println("업로드 경로:"+path);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8156];
				int read = 0;
				while( (read = bis.read(buffer)) > 0) {
					os.write(buffer, 0, read);
				}
 			}catch(Exception e) {
 				
 			}
			item.setPicture_url(fileName);
		}
		String regDate = "";
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		regDate = regDate + year + "/";
		int month = today.get(Calendar.MONTH);
		if(month < 10) regDate = regDate + "0" + month + "/";
		else regDate = regDate + month + "/";
		int date = today.get(Calendar.DATE);
		if(date < 10) regDate = regDate + "0" + date;
		else regDate = regDate + date;
		item.setReg_date(regDate);
		this.itemCatalog.writeItem(item);
		ModelAndView mav = new ModelAndView("item/itemEntryResult");
		return mav;
	}
	
	@RequestMapping(value="item/goItemEntry.html")
	public ModelAndView goItem() {
		ModelAndView mav = new ModelAndView("item/itemEntry");
		mav.addObject(new Item());
		return mav;
	}
}