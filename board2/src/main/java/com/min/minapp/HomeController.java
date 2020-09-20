package com.min.minapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */

@SessionAttributes({"id","gender"})//이렇게 보내도된다

@Controller
public class HomeController {
	
	@Autowired
	private boardDao dao;
	
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
	public String main(Model model) {
		
		boardBean[] list = dao.getAll();
		model.addAttribute("list",list);
		
		return "main";
		
		
	}
	
	@RequestMapping("/goregister")//회원가입하러가기
	public String register() {
		return "register";
		
	}
	
	
	@RequestMapping("/register")
	public String register(memberBean memberBean) {
		
		dao.register(memberBean);
		
			
		return "redirect:main";
		
	}
	
	
	@RequestMapping("/gologin")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(memberBean memberBean,Model model) {
		memberBean result=dao.login(memberBean);// 한줄가져온것을 int나 bean에 담을수잇는데 지금은 빈에 담앗다 
		String go = "gologin";//기본으로 고로그인으로 간다
		
		if(result.getId()==null) {
			System.out.println("로그인 실패");
		}else {
			go="redirect:main";//빠져나가면서 들어간다
			System.out.println("로그인 성공");
			model.addAttribute("id",result.getId());//각각보낸다
			model.addAttribute("gender",result.getGender());
		}
		return go;
	}
	
	@RequestMapping("/goinsert")
	public String insert() {
		
		return "insert";
	}
	
	
	@RequestMapping("/insert")
	public String insert(memberBean memberBean, boardBean boardBean, Model model) {
		
		
		dao.insert(memberBean, boardBean);
		
		
		
		return "redirect:main";
	}
	
	
	@RequestMapping("/delete")
	public String delete(boardBean boardBean) {
		
		dao.delete(boardBean);
		return "redirect:main";
	}
	
	@RequestMapping("/gomodify")
	public String modify(boardBean boardBean, Model model) {
		
		model.addAttribute("bean",boardBean);
		return "modify";
	}
	
	
	@RequestMapping("/modify")
	public String modify(boardBean boardBean) {
		
		dao.modify(boardBean);
		return "redirect:main";
	}
	
	
}


















