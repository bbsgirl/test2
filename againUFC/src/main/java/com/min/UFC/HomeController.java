package com.min.UFC;

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

import com.min.UFC.dao.MemberDao;
import com.min.UFC.dao.playerDao;
import com.min.UFC.dto.MemberBean;
import com.min.UFC.dto.playerBean;


/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"id","name","age","gender","admin","check"})
@Controller
public class HomeController {
	
	@Autowired
	MemberDao M_dao;
	
	@Autowired
	playerDao P_dao;
	
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
	
	@RequestMapping("/mainpage")
	public String main() {
		
		return "mainpage";
	}
	
	@RequestMapping("/gologin")
	public String login() {
		
		return "loginpage";
	}
	
	@RequestMapping("/login")
	public String login(MemberBean memberBean,Model model) {
		MemberBean result = M_dao.login(memberBean);
		String go = "gologin";
		
		
		if(result.getId()==null) {
			System.out.println("로그인 실패");
		}else {
			
			if(result.getAdmin().equals("admin")){
				System.out.println("맞음");
				model.addAttribute("admin", "(관리자) ");
				
			}else {
				System.out.println("아님");
			}
			
			System.out.println("로그인 성공");
			model.addAttribute("id",result.getId());
			model.addAttribute("name",result.getName());
			model.addAttribute("age",result.getAge());
			model.addAttribute("gender",result.getGender());
			//모델만 쓰자
		}	
		return "mainpage";
	}
	
	@RequestMapping("/gojoin")
	public String join() {
		
		return "joinpage";
	}
	
	@RequestMapping("/join")
	public String join(MemberBean memberBean) {
		
		M_dao.join(memberBean);
		
		return "redirect:mainpage";
	}
	
	@RequestMapping("gologout")
	public String logout() {
		
		return "mainpage";
	}
	
	@ResponseBody
	@RequestMapping("logincheck")
	public String logincheck(@RequestParam("id") String id, Model model) {
		
		System.out.println(id+"id");
		int result = M_dao.check(id);
		System.out.println(result);
		String str="NO";
		if(result == 0){
			str="YES";
		}
		JSONObject json = new JSONObject();	
		json.put("result", str);
		
		return json.toString();
	}
	
	@RequestMapping("gomemberMyPage")
	public String memberMyPage() {
		
		return "membermypage";
	}
	
	@RequestMapping("goadmin")
	public String goadmin() {
		
		return "admin";
	}
	
	@RequestMapping("goadmin2")
	public String goadmin2() {
		
		return "flyplayer";
	}
	
	@RequestMapping("registerfly")
	public String registerfly(playerBean playerBean) {
		
		P_dao.registerfly(playerBean);
		
		return "flyplayer";
	}
	
	
	@RequestMapping("golightplayer")
	public String lightplayer() {
		
		return "lightplayer";
	}
	
	@RequestMapping("registerlight")
	public String registerlight(playerBean playerBean){
		P_dao.registerlight(playerBean);
		
		return "lightplayer";
	}
	
	@RequestMapping("goheavyplayer")
	public String heavyplayer() {
	
		return "heavyplayer";
	}
	
	
	@RequestMapping("registerheavy")
	public String registerheavy(playerBean playerBean) {
		
		P_dao.registerheavy(playerBean);
		
		return "heavyplayer";
	}
	
	
	@RequestMapping("gowvplayer")
	public String wvplayer() {
		
		return "wvplayer";
	}
	
	@RequestMapping("registerwv")
	public String registerwv(playerBean playerBean) {
		
		P_dao.registerwv(playerBean);
		
		return "wvplayer";
		
	}
	
	@RequestMapping("playersearch")
	public String playersearch(String grade , String n ,playerBean playerBean , Model model) {
		
		System.out.println(grade+"::grade");
		System.out.println(n+":::n");
		playerBean result = P_dao.playersearch(grade , n);
		
		System.out.println(result+"::result");
		
		model.addAttribute("playername", result.getName());
		model.addAttribute("playerage", result.getAge());
		model.addAttribute("playernationlity", result.getNationality());
		model.addAttribute("playerheight", result.getHeight());
		model.addAttribute("playerweight", result.getWeight());
		model.addAttribute("playerwin", result.getWin());
		model.addAttribute("playerlose", result.getLose());
		
		return "profile2";
	}
	
	
	@RequestMapping("rank")
	public String rank(playerBean playerBean , Model model) {
		playerBean[] playerfly = P_dao.playerflygetAllDate(playerBean);
		playerBean[] playerlight = P_dao.playerlightgetAllDate(playerBean);
		playerBean[] playerheavy = P_dao.playerheavygetAllDate(playerBean);
		playerBean[] playerwv = P_dao.playerwvgetAllDate(playerBean);
		
		System.out.println(playerfly+":playerfly");
		
		model.addAttribute("playerfly" , playerfly);
		model.addAttribute("playerlight" , playerlight);
		model.addAttribute("playerheavy" , playerheavy);
		model.addAttribute("playerwv" , playerwv);
		
		
		return "projectranking";
	}
	
	
	
	@RequestMapping("Match")
	public String match() {
		
		return "ticket";
		
	}
	
	
}
