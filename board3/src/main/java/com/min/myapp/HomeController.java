package com.min.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"id","gender"})
@Controller
public class HomeController {
	
	@Autowired
	private boardDao3 dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/main")
	public String main() {
		
		
		
		return "main";
	}
	
	@RequestMapping("gologin")
	public String login() {
		return "login";
	}
	
	@RequestMapping("login")
	public RedirectView login(memberdto3 memberdto3, Model model) {
		memberdto3 result = dao.login(memberdto3);
		String go = "gologin";
		
		if(result.getId()==null) {
			System.out.println("로그인 실패");
		}else {
			System.out.println("로그인 성공");
			
			System.out.println("resut.getId():"+result.getId());
			System.out.println("resut.getGender():"+result.getGender());
			model.addAttribute("id", result.getId());
			model.addAttribute("gender", result.getGender());
		}
		
		RedirectView rv = new RedirectView("main");
		rv.setExposeModelAttributes(false);
		
		
		return rv;
	}
	
	@RequestMapping("/goinsert")
	public String insert() {
		return "insert";
	}
	
	@RequestMapping("/insert")
	public String insert(boardinsertDto boardinsertDto, Model model) {
		
		dao.insert(boardinsertDto);
		
		model.addAttribute("m", boardinsertDto);
		
		return "redirect:main";
	}
	
	
	@RequestMapping("/goregister")
	public String register() {
		
		return "register";
	}
	
	@RequestMapping("/register")
	public String register(memberdto3 memberdto3) {
		
		dao.register(memberdto3);
		
		return "redirect:main";
	}
	
	@ResponseBody
	@RequestMapping("/registerck")
	public String registerck(@RequestParam("id") String id) {
		
		System.out.println("idck"+id);
		int result = dao.registerck(id);
		System.out.println(result);
		
		String str="no";
		if(result == 0) {
			str = "yes";
		}
		JSONObject json = new JSONObject();
		json.put("result" , str);
		
		return json.toString();
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
