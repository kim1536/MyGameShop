package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.MypageCatalog;
import model.User;

@Controller
public class MyPageControllre {
	@Autowired
	private MypageCatalog mypageCatalog;
	
	@RequestMapping(value="/mypage/updateDo.html")
	public ModelAndView updateDo(User user) {
		ModelAndView mav = new ModelAndView("redirect:/login/logout.html");
		String tel1 = user.getTel1(); 
		String tel2 = user.getTel2(); 
		String tel3 = user.getTel3();
		String tel = tel1+"/" + tel2 + "/" + tel3;
		user.setTel(tel);
		this.mypageCatalog.updateUser(user);
		return mav;
	}
		
	@RequestMapping(value="/mypage/updateUserDo.html")
	public ModelAndView updateRedy(String userid, String PWD, HttpSession session) {
			User user = (User)session.getAttribute("USER");
			ModelAndView mav = new ModelAndView("mypage/myPage");
			if(user.getPassword().equals(PWD)) {//암호가 일치하는 경우
				mav.addObject("BODY","updateUserDate.jsp");
				mav.addObject(new User());
				return mav;
			}else {
				mav.addObject("BODY","mydata.jsp");
				return mav;
			}
	}
	
	@RequestMapping(value="/mypage/modify.html")
	public ModelAndView modify(HttpSession session) {
		User user = (User)session.getAttribute("USER");
		String userId = user.getUser_id();
		ModelAndView mav = new ModelAndView("mypage/myPage");
		mav.addObject("userId",userId);
		mav.addObject("BODY", "updateUser.jsp");
		return mav;
	}
	
	@RequestMapping(value="/mypage/deleteUserDo.html")
	public ModelAndView deleteDo(String userid, String PWD, HttpSession session) {
		User user = (User)session.getAttribute("USER");
		ModelAndView mav = new ModelAndView("mypage/userdeleteRead");
		if(user.getPassword().equals(PWD)) {//암호가 일치하는 경우
			this.mypageCatalog.deleteUser(user);//DB에서 해당 user 삭제
			session.invalidate();
			mav.addObject("QSEQNO","ok");
			return mav;
		}else {
			mav.addObject("QSEQNO","nok");
			return mav;
		}
	}
	
	@RequestMapping(value="/mypage/delete.html")
	public ModelAndView delete(HttpSession session) {
		User user = (User)session.getAttribute("USER");
		String userId = user.getUser_id();
		ModelAndView mav = new ModelAndView("mypage/myPage");
		mav.addObject("userId",userId);
		mav.addObject("BODY", "deleteUser.jsp");
		return mav;
	}
	
	@RequestMapping(value="/mypage/myData.html")
	public ModelAndView mydata() {
		ModelAndView mav = new ModelAndView("mypage/myPage");
		mav.addObject("BODY","mydata.jsp");
		return mav;
	}
	
	@RequestMapping(value="/mypage/myPage.html")
	public ModelAndView form(HttpSession session) {
		User user = (User)session.getAttribute("USER");
		if(user == null) {
			ModelAndView mav = new ModelAndView("mypage/nologin");
			return mav;
		}else {
		ModelAndView mav = new ModelAndView("mypage/myPage");
		mav.addObject("mypage/myPage");
		return mav;
		}
	}

}
