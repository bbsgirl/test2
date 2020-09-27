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
	public String main(@RequestParam(value="pageNum", required=false, defaultValue="1")String strNum, Model model) {
		int pageNum =Integer.parseInt(strNum);
		System.out.println(pageNum+"::::pageNum");
		
		int borderPerPage=3;
		
		//������ ��������
		boardBean[] list = dao.getAll((pageNum-1)*borderPerPage, borderPerPage);//������ ���°�
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
	
	@RequestMapping("/goregister")//ȸ������ ������ �̵�
	public String register() {
		return "register";
		
	}
	
	
	@RequestMapping("/register")//ȸ������ ���
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
	
	
	
	
	
	@RequestMapping("/gologin")//�α��������� �̵�
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/login")//�α��� 
	public RedirectView login(memberBean memberBean,Model model) {
		memberBean result=dao.login(memberBean);// ���ٰ����°��� int�� bean�� �������մµ� ������ �� ��Ѵ� 
		String go = "gologin";//�⺻���� ��α������� ����
		
		if(result.getId()==null) {
			System.out.println("�α��� ����");
		}else {
			
			System.out.println("�α��� ����");
			model.addAttribute("id",result.getId());//����������
			model.addAttribute("gender",result.getGender());// �α����Ҷ� �����ش�
			
			
		}
		RedirectView rv = new RedirectView("main");//�������� ����
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
		RedirectView rv = new RedirectView("main");//�������� ����
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


















