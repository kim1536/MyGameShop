package controller;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ItemCatalog;
import logic.OrderCatalog;
import model.Admin;
import model.Cart;
import model.CartItem;
import model.Condition;
import model.Item;
import model.Order;
import model.User;

@Controller
@Scope("session")
public class CartController {
	@Autowired
	private Cart cart;
	@Autowired
	private OrderCatalog orderCatalog;
	@Autowired
	private ItemCatalog itemCatalog;
	
	
	@RequestMapping(value="/mypage/orderList.html")
	public ModelAndView myOrder(HttpSession session, Integer SEQNO, Integer PAGE_NUM) {
		if(PAGE_NUM == null) PAGE_NUM = 1;
		ModelAndView mav = new ModelAndView("mypage/myPage");
		User user = (User)session.getAttribute("USER");//세션에서 계정을 찾는다.
		if(SEQNO != null) {
			int rownum = this.orderCatalog.selectRownum(SEQNO);
			int page = rownum / 5;
			if(rownum % 5 != 0) page++;
			PAGE_NUM = page;
		}
		int currentPage = PAGE_NUM;	int totalPageCount = 0;
		int startRow = 0; int endRow = 0;
		int count = this.orderCatalog.getOrderCount();
		if(count > 0) {
			totalPageCount  =count / 5;
			if(count % 5 > 0) totalPageCount++;
			startRow = (currentPage - 1) * 5 + 1;
			endRow = currentPage * 5;
			if(endRow > count) endRow = count;
		}
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Order> order = this.orderCatalog.selectOrder(user.getUser_id());//DB에서 장바구니 정보 검색
		List<Order> orderList = this.orderCatalog.findAll(cond);
		mav.addObject("Order",order);
		mav.addObject("count",count);
		mav.addObject("startRow",startRow); mav.addObject("endRow",endRow);
		mav.addObject("OrderList", orderList);
		mav.addObject("currentPage",currentPage); 
		mav.addObject("pageCount",totalPageCount);
		mav.addObject("BODY","orderList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/cart/Cartbuy.html")
	public ModelAndView buy(Order order,HttpSession session, int TOTAL) {
		User user = (User)session.getAttribute("USER");
		String condition = "상품준비 중";
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
		List<CartItem> cartList = cart.getCart(user.getUser_id());
		Iterator it = cartList.iterator();
		while(it.hasNext()) {
			CartItem ci = (CartItem)it.next();
			Integer seqno = this.orderCatalog.getMaxOrderId();
			if(seqno == null) seqno = 1;
			else seqno++;
			order.setSeqno(seqno); order.setUser_id(user.getUser_id());
			order.setItem_id(ci.getItem_id()); order.setQuantity(ci.getQuantity());
			order.setTotal_price(ci.getPrice() * ci.getQuantity());
			order.setCondition(condition);
			order.setOrder_date(regDate);
			this.orderCatalog.putOrder(order);
		}
		this.cart.deleteAll(user.getUser_id());
		ModelAndView mav = new ModelAndView("cart/orderResult");
		return mav;
	}
	
	@RequestMapping(value="/cart/goCartBuy.html")
	public ModelAndView goCartBuy(int TOTAL, HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cartBuy");
		User user = (User)session.getAttribute("USER");
		List<CartItem> cartList = cart.getCart(user.getUser_id());
		mav.addObject("CART",cartList);
		mav.addObject("TOTAL",TOTAL);
		mav.addObject(new Order());
		return mav;
	}
	
	@RequestMapping(value="/cart/buy.html")
	public ModelAndView buy(Order order, HttpSession session) {
		User user = (User)session.getAttribute("USER");
		Integer seqno = this.orderCatalog.getMaxOrderId();
		if(seqno == null) seqno = 1; 
		else seqno++;
		String user_id = user.getUser_id();
		Integer total_price = this.itemCatalog.getItemDetail(order.getItem_id()).getPrice() 
				* order.getQuantity();
		String condition = "상품준비 중";
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
		order.setSeqno(seqno);
		order.setUser_id(user_id);
		order.setTotal_price(total_price);
		order.setCondition(condition); 
		order.setOrder_date(regDate);
		this.orderCatalog.putOrder(order);
		ModelAndView mav = new ModelAndView("cart/orderResult");
		mav.addObject("TOTALPRICE", total_price);
		session.setAttribute("ORDER", order);
		return mav;
	}
	
	@RequestMapping(value="/cart/goBuy.html")
	public ModelAndView goBuy(String CODE, String QUANTITY, HttpSession session) {
		User user = (User)session.getAttribute("USER");
		if(user == null) {
			ModelAndView mav = new ModelAndView("mypage/nologin");
			return mav;
		}else {
		ModelAndView mav = new ModelAndView("cart/buy");
		mav.addObject("CODE", CODE);
		mav.addObject("QUANTITY",QUANTITY);
		Item item = this.itemCatalog.getItemDetail(CODE);
		Integer price = item.getPrice() * Integer.parseInt(QUANTITY);
		Integer totalprice = price + 500;
		mav.addObject("PRICE",price);
		mav.addObject("TOTALPRICE",totalprice);
		mav.addObject(new Order());
		return mav;
		}
	}
	
	@RequestMapping(value="/cart/modify.html")
	public ModelAndView modify(String CODE, Integer NUM, String BTN,
			HttpSession session) {
		User user = (User)session.getAttribute("USER");//세션에서 계정을 찾는다.
		Admin admin = (Admin)session.getAttribute("ADMIN");
		Cart cart = (Cart)session.getAttribute("CART");//세션에서 장바구니를 찾는다.
		if(cart == null) System.out.println("cart is null");
		if(BTN.equals("수정")) {
			cart.modifyItem(CODE, NUM, user.getUser_id());
		}else if(BTN.equals("삭제")) {
			cart.deleteItem(CODE, user.getUser_id());
		}
		return new ModelAndView("redirect:/cart/show.html");
	}
	
	@RequestMapping(value="/cart/cartListView.html")
	public ModelAndView myCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/myPage");
		User user = (User)session.getAttribute("USER");//세션에서 계정을 찾는다.
		Admin admin = (Admin)session.getAttribute("ADMIN");
		if(user == null && admin == null) {//로그인 안 한 경우
			mav = new ModelAndView("login/mainNoLogin");
			return mav;
		}
		List<CartItem> cartList = cart.getCart(user.getUser_id());//DB에서 장바구니 정보 검색
		int totalAmount = 0;//총액 계산을 위한 변수 선언
		if(cartList.size() > 0) {//상품이 있는 경우에만 계산한다.
			Iterator it = cartList.iterator();
			while(it.hasNext()) {
				CartItem ci = (CartItem)it.next();
				int total = ci.getPrice() * ci.getQuantity();//가격 * 갯수
				totalAmount = totalAmount + total;
			}
		}
		mav.addObject("TOTAL",totalAmount);
		mav.addObject("CARTLIST",cartList);
		mav.addObject("BODY","cartListView.jsp");
		return mav;
	}
	
	@RequestMapping(value="/cart/show.html")
	public ModelAndView show(HttpSession session) {
		User user = (User)session.getAttribute("USER");//세션에서 계정을 찾는다.
		Admin admin = (Admin)session.getAttribute("ADMIN");
		if(user == null && admin == null) {//로그인 안 한 경우
			ModelAndView mav = new ModelAndView("login/mainNoLogin");
			return mav;
		}
		List<CartItem> cartList = cart.getCart(user.getUser_id());//DB에서 장바구니 정보 검색
		int totalAmount = 0;//총액 계산을 위한 변수 선언
		if(cartList.size() > 0) {//상품이 있는 경우에만 계산한다.
			Iterator it = cartList.iterator();
			while(it.hasNext()) {
				CartItem ci = (CartItem)it.next();
				int total = ci.getPrice() * ci.getQuantity();//가격 * 갯수
				totalAmount = totalAmount + total;
			}
		}
		ModelAndView mav = new ModelAndView("mypage/myPage");
		mav.addObject("TOTAL",totalAmount);
		mav.addObject("CARTLIST",cartList);
		mav.addObject("BODY","cartListView.jsp");
		return mav;
	}
	
	@RequestMapping(value="/cart/addCart.html")
	public ModelAndView addCart(String CODE, String QUANTITY, HttpSession session) {
		User user = (User)session.getAttribute("USER");//세션에서 계정을 찾는다.
		Admin admin = (Admin)session.getAttribute("ADMIN");
		if(user == null && admin == null) {//로그인 하지 않은 경우
			ModelAndView mav = new ModelAndView("login/noLogin");
			return mav;
		}
		Cart cart = (Cart)session.getAttribute("CART");//세션에서 카트를 찾는다.
		if(cart == null) cart = this.cart;
		else if(cart != null) System.out.println("cart is not null");
		Integer quantity = Integer.parseInt(QUANTITY);
		cart.addCart(CODE, quantity, user.getUser_id());
		session.setAttribute("CART", cart);//카트를 세션에 저장
		ModelAndView mav = new ModelAndView("cart/addCartResult");
		mav.addObject("NUM",quantity); mav.addObject("CODE",CODE);
		return mav;
	}

}
