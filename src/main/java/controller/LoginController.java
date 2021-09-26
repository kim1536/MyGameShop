package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.LoginCatalog;
import model.Admin;
import model.Cart;
import model.CartItem;
import model.Login;
import model.User;

@Scope("session")
@Controller
public class LoginController {
	@Autowired
	private Cart cart;
	
	@Autowired
	private LoginCatalog loginCatalog;
	
	@RequestMapping(value="/login/logout.html")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("home/template");
	}
	
	@RequestMapping(value="/login/newPwdResult.html")
	public ModelAndView newPwd(String USERID, String PWD) {
		User user = new User();
		user.setPassword(PWD); user.setUser_id(USERID);
		this.loginCatalog.newPwd(user);
		ModelAndView mav = new ModelAndView("login/newPwdResult");
		return mav;
	}
	
	@RequestMapping(value="/login/pwdsearch.html")
	public ModelAndView pwdSearch(User user) {
		String pwd = this.loginCatalog.searchPwd(user);
		if(pwd == null) {
			return new ModelAndView("login/pwdNull");
		}
		ModelAndView mav = new ModelAndView("login/newPassword");
		mav.addObject("userId", user.getUser_id());
		return mav;
	}
	
	@RequestMapping(value="/login/gosearchpwd.html")
	public ModelAndView goSearchPwd() {
		ModelAndView mav = new ModelAndView("login/searchPwd");
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping(value="/login/idsearch.html")
	public ModelAndView idSearch(User user) {
		String userId = this.loginCatalog.searchId(user);
		if(userId == null) {
			return new ModelAndView("login/idNull");
		}
		ModelAndView mav = new ModelAndView("login/searchIdResult");
		mav.addObject("userId", userId);
		mav.addObject("userName", user.getUser_name());
		return mav;
	}
	
	@RequestMapping(value="/login/gosearchid.html")
	public ModelAndView goSearchId() {
		ModelAndView mav = new ModelAndView("login/searchId");
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping(value="/login/check.html")
	public ModelAndView idcheck(String USER_ID) {
		ModelAndView mav = new ModelAndView("login/idCheck");
		String id = loginCatalog.getUserId(USER_ID);
		if(id != null) mav.addObject("DUP","YES");
		else mav.addObject("DUP","NO");
		mav.addObject("ID",USER_ID);
		return mav;
	}	
	
	@RequestMapping(value="/login/entry.html")
	public ModelAndView entry(@Valid User user, BindingResult br) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("login/entry");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		String month = user.getMonth();
		String date = user.getDate();
		if(Integer.parseInt(month) < 10) {
			month = "0"+month;
		}
		if(Integer.parseInt(date) < 10) {
			date = "0"+date;
		}
		String birthday = user.getYear()+"/"+month+"/"+date;
		String tel = user.getTel1()+"-"+user.getTel2()+"-"+user.getTel3();
		user.setBirthday(birthday); user.setTel(tel);
		this.loginCatalog.putUser(user);
		ModelAndView mav = new ModelAndView("login/entryResult");
		return mav;
	}
	
	@RequestMapping(value="/login/goentry.html")
	public ModelAndView goEntry() {
		ModelAndView mav = new ModelAndView("login/entry");
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping(value="/login/loginResult.html")
	public ModelAndView login(@Valid Login login, BindingResult br,
			HttpSession session) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("login/login");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		User user = this.loginCatalog.getUser(login);
		Admin admin = this.loginCatalog.getAdmin(login);
		ModelAndView mav = new ModelAndView("home/template");
		if(user != null) {
			mav.addObject("loginUser", user.getUser_id());
			session.setAttribute("USER", user);
			session.setAttribute("USERID", user.getUser_id());
			List<CartItem> cartList = this.cart.getCart(user.getUser_id());
			if(cartList != null) {//장바구니 정보가 있는 경우
				Iterator it = cartList.iterator();
				int i = 0;
				while(it.hasNext()) {
					CartItem ci = (CartItem)it.next();
					this.cart.setCodeList(i, ci.getItem_id());//장바구니에 상품코드를 담는다.
					this.cart.setNumList(i, ci.getQuantity());//장바구니에 상품갯수를 담는다.
					i++;//인덱스 증가
				}
				session.setAttribute("CART", this.cart);//장바구니를 세션에 저장
			}
			return mav;
			
		}else if(admin != null) {
			mav.addObject("loginAdmin", admin.getAdminId());
			session.setAttribute("ADMIN", admin);
			session.setAttribute("ADMINID", admin.getAdminId());
			session.setAttribute("ADMINEMAIL", admin.getEmail());
			return mav;
		}
		if((user == null) && (admin == null)) {
			ModelAndView noLogin = new ModelAndView("login/loginUserNull");
			return noLogin;
		}
		return mav;
	}
	
	@RequestMapping(value="/login/login.html")
	public ModelAndView gologin() {
		ModelAndView mav = new ModelAndView("login/login");
		mav.addObject(new Login());
		return mav;
	}
}
