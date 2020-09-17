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
		//값을 보내기 위해서는 model이 필요하다
		
		//메인 뿌린다 
		boardminDto[] list = dao.getAll();
		System.out.println(list.length+"*****");
		model.addAttribute("list",list);
		
		return "main";
	}
	//회원가입========================================
	@RequestMapping("/goInsert")//주소줄에 치며는 넘어간다 
	public String insert() {
		return "insert";//인설트라는 jsp로
	}
	@RequestMapping("/insert")//거기서 치고 값을 넘긴다 
	public String insert(beanDto beanDto) {//폼에 담긴것 담는다
		dao.insert(beanDto);
		return "redirect:main";//담는거만한다
	}
	//게시물등록====================================
	@RequestMapping("/gob_insert")
	public String b_insert() {
		return "b_insert";
	}
	@RequestMapping("/b_insert")//값이 넘어오니까 
	public String b_insert(beanDto beanDto ,boardminDto boardminDto) {
		dao.b_insert(beanDto, boardminDto);
		return "redirect:main";
	}
	//로그인=====================================
	@RequestMapping("/gologin")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/login")//세션까지 만들엇다 
	public String login(beanDto beanDto , Model model) {
		
//		model.addAttribute("login",dao.get(new beanDto(String id)));
		model.addAttribute("id", beanDto.getId());
		//위에 세션이랑 연결되어있다
		
		return "redirect:main";
	}
	//삭제======================================
	@RequestMapping("/delete")//삭제는 넘버 숫자만 받아온다
	public String delete(int no) {// a href로한것을 받아온다  그숫자를 삭제하기위해서
		
		dao.delete(no);
		
		return "redirect:main";
	}
	//수정=======================================
	@RequestMapping("/goupdate")//여기로 오는건 수정하기위해서 일단 값을 가져오는곳이다
	//수정도 수정하는것에서 다른곳에서 옮겨서 거기서 수정하고 다시 그값을 보낸ㄴ다
	public String update(boardminDto boardminDto, Model model) {//가져온값을 모델에 담아서 수정jsp로 보낸다 
		model.addAttribute("bean",boardminDto);
		return "update";
	}
	@RequestMapping("/update")//받은것을 다시 보낸다 
	public String update(String content , int no) {
		dao.update(content, no);
		return "redirect:main";
	}
	
}
