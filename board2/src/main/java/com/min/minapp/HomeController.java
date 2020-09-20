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

@SessionAttributes({"id","gender"})//�̷��� �������ȴ�

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
	
	@RequestMapping("/goregister")//ȸ�������Ϸ�����
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
		memberBean result=dao.login(memberBean);// ���ٰ����°��� int�� bean�� �������մµ� ������ �� ��Ѵ� 
		String go = "gologin";//�⺻���� ��α������� ����
		
		if(result.getId()==null) {
			System.out.println("�α��� ����");
		}else {
			go="redirect:main";//���������鼭 ����
			System.out.println("�α��� ����");
			model.addAttribute("id",result.getId());//����������
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


















