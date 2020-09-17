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
	public String home(Locale locale, Model model) {//���� ������Ʈ�� ��������
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		return "home";
	}
	
	
	@RequestMapping("/main")
	public String main(Model model) {
		//���� ������ ���ؼ��� model�� �ʿ��ϴ�
		
		//���� �Ѹ��� 
		boardminDto[] list = dao.getAll();
		System.out.println(list.length+"*****");
		model.addAttribute("list",list);
		
		return "main";
	}
	//ȸ������========================================
	@RequestMapping("/goInsert")//�ּ��ٿ� ġ��� �Ѿ�� 
	public String insert() {
		return "insert";//�μ�Ʈ��� jsp��
	}
	@RequestMapping("/insert")//�ű⼭ ġ�� ���� �ѱ�� 
	public String insert(beanDto beanDto) {//���� ���� ��´�
		dao.insert(beanDto);
		return "redirect:main";//��°Ÿ��Ѵ�
	}
	//�Խù����====================================
	@RequestMapping("/gob_insert")
	public String b_insert() {
		return "b_insert";
	}
	@RequestMapping("/b_insert")//���� �Ѿ���ϱ� 
	public String b_insert(beanDto beanDto ,boardminDto boardminDto) {
		dao.b_insert(beanDto, boardminDto);
		return "redirect:main";
	}
	//�α���=====================================
	@RequestMapping("/gologin")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/login")//���Ǳ��� ������� 
	public String login(beanDto beanDto , Model model) {
		
//		model.addAttribute("login",dao.get(new beanDto(String id)));
		model.addAttribute("id", beanDto.getId());
		//���� �����̶� ����Ǿ��ִ�
		
		return "redirect:main";
	}
	//����======================================
	@RequestMapping("/delete")//������ �ѹ� ���ڸ� �޾ƿ´�
	public String delete(int no) {// a href���Ѱ��� �޾ƿ´�  �׼��ڸ� �����ϱ����ؼ�
		
		dao.delete(no);
		
		return "redirect:main";
	}
	//����=======================================
	@RequestMapping("/goupdate")//����� ���°� �����ϱ����ؼ� �ϴ� ���� �������°��̴�
	//������ �����ϴ°Ϳ��� �ٸ������� �Űܼ� �ű⼭ �����ϰ� �ٽ� �װ��� ��������
	public String update(boardminDto boardminDto, Model model) {//�����°��� �𵨿� ��Ƽ� ����jsp�� ������ 
		model.addAttribute("bean",boardminDto);
		return "update";
	}
	@RequestMapping("/update")//�������� �ٽ� ������ 
	public String update(String content , int no) {
		dao.update(content, no);
		return "redirect:main";
	}
	
}
