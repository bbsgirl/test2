package com.min.minapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

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
	public String main(@RequestParam(value="pageNum", required=false, defaultValue="1")String strNum, Model model) {
		int pageNum =Integer.parseInt(strNum);
		System.out.println(pageNum+"::::pageNum");
		
		int borderPerPage=3;
		
		//가로의 갯수나열
		boardBean[] list = dao.getAll((pageNum-1)*borderPerPage, borderPerPage);//쿼리에 들어가는것
		model.addAttribute("list",list);
		
		int count = dao.getCount();
		int pageCount =count/borderPerPage;
		if(count%borderPerPage > 0) {
			pageCount++;
		}
		
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("pageNum", pageNum);
		
		
		
		return "main";
		
		
	}
	
	@RequestMapping("/goregister")//회원가입 페이지 이동
	public String register() {
		return "register";
		
	}
	
	
	@RequestMapping("/register")//회원가입 등록
	public String register(memberBean memberBean) {
		
		dao.register(memberBean);
		
			
		return "redirect:main";
		
	}
	
	
	@ResponseBody
	@RequestMapping("registercheck")
	public String registercheck(@RequestParam("id") String id) {
		
		System.out.println("idck"+id);
		int result = dao.registerck(id);
		System.out.println(result);
		
		String str = "no";
		if(result == 0) {
			str ="yes";
		}
		JSONObject json = new JSONObject();
		json.put("result" , str);
		
		return json.toString();
		
	}
	
	
	
	
	
	@RequestMapping("/gologin")//로그인페이지 이동
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/login")//로그인 
	public RedirectView login(memberBean memberBean,Model model) {
		memberBean result=dao.login(memberBean);// 한줄가져온것을 int나 bean에 담을수잇는데 지금은 빈에 담앗다 
		String go = "gologin";//기본으로 고로그인으로 간다
		
		if(result.getId()==null) {
			System.out.println("로그인 실패");
		}else {
			
			System.out.println("로그인 성공");
			model.addAttribute("id",result.getId());//각각보낸다
			model.addAttribute("gender",result.getGender());// 로그인할때 보내준다
			
			
		}
		RedirectView rv = new RedirectView("main");//메인으로 간다
		rv.setExposeModelAttributes(false);
		
		return rv;
	}
	
	@RequestMapping("/goinsert")
	public String insert() {
		
		return "insert";
	}
	
	
	@RequestMapping("/insert")
	public RedirectView insert(memberBean memberBean, boardBean boardBean, Model model) {
		
		
		
		dao.insert(memberBean, boardBean);
		RedirectView rv = new RedirectView("main");//메인으로 간다
		rv.setExposeModelAttributes(false);
				
		return rv;
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


















