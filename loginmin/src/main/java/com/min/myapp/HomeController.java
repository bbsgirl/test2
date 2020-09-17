package com.min.myapp;

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
@SessionAttributes("id")
@Controller
public class HomeController {
	@Autowired
	private loginDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {//모델은 리퀘스트라 생각하자
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		return "home";
	}
	
	
	@RequestMapping("/main")
	public String main(Model model) {
		
		//메인 뿌린다 
		boardminDto[] list = dao.getAll();
		System.out.println(list.length+"*****");
		model.addAttribute("list",list);
		
		return "main";
	}
	//회원가입========================================
	@RequestMapping("/goInsert")
	public String insert() {
		return "insert";
	}
	@RequestMapping("/insert")
	public String insert(beanDto beanDto) {
		dao.insert(beanDto);
		return "redirect:main";
	}
	//게시물등록====================================
	@RequestMapping("/gob_insert")
	public String b_insert() {
		return "b_insert";
	}
	@RequestMapping("/b_insert")
	public String b_insert(beanDto beanDto ,boardminDto boardminDto) {
		dao.b_insert(beanDto, boardminDto);
		return "redirect:main";
	}
	//로그인=====================================
	@RequestMapping("/gologin")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(beanDto beanDto , Model model) {
		
//		model.addAttribute("login",dao.get(new beanDto(String id)));
		model.addAttribute("id", beanDto.getId());
		//위에 세션이랑 연결되어있다
		
		return "redirect:main";
	}
	//삭제======================================
	@RequestMapping("/delete")
	public String delete(int no) {
		
		dao.delete(no);
		
		return "redirect:main";
	}
	//수정=======================================
	@RequestMapping("/goupdate")
	public String update(boardminDto boardminDto, Model model) {
		model.addAttribute("bean",boardminDto);
		return "update";
	}
	@RequestMapping("/update")
	public String update(String content , int no) {
		dao.update(content, no);
		return "redirect:main";
	}
	
}
