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
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private borderDao dao;
	
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
	public String main(@RequestParam(value="pageNum", required=false, defaultValue="1")String strNum, Model model) {
		int pageNum =Integer.parseInt(strNum);
		System.out.println(pageNum+"pageNum");
		int borderPerPage=10;
		
		Bean[] list=dao.getList((pageNum-1)*borderPerPage, borderPerPage);
		
		model.addAttribute("list",list);
		int count = dao.getCount();
		int pageCount = count/borderPerPage;
		if(count%borderPerPage > 0) {
			pageCount++;
		}
		
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageNum",pageNum);
		
		
		return "main";
	}
	
	@RequestMapping("/goInsert")
	public String insert() {
		
		return "insert";
	}
	
	@RequestMapping("/insert")
	public String insert(Bean bean) {
		
		
		dao.insert(bean);
		
		return "redirect:main";
		
	}
	
	@RequestMapping("/update")
	public String update(Bean bean) {
		
		dao.update(bean);
		return "redirect:main";
	}
	
	@RequestMapping("/get")//프로젝트 / 뒤부터 주소줄 읽어드리는곳
	public String get(int idx, Model model) {//
		model.addAttribute("bean",dao.get(idx));
		return "update";//수정 눌렀을때 idx를 가져와서 update에 뿌려주는것만한다
	}
	
	@RequestMapping("/delete")
	public String delete(int idx) {
		
		dao.delete(idx);
		return "redirect:main";
		
	}
	
}
