package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;

@Controller
public class MainController {

	@RequestMapping(value="/home/template.html")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("/home/template");
		return mav;
	}
}
