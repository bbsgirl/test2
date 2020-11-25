package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.PnumberVo;
import com.spring.board.vo.pinkBoardVo;
import com.spring.common.CommonUtil;
import com.sun.net.httpserver.Authenticator.Result;

@Controller
@SessionAttributes("id")
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/pinkmovie/pinkMain.do")
	public String pinkMain() throws Exception{
		System.out.println("hi");
		
		return "pinkmovie/pinkMain";
	}
	
	@RequestMapping(value = "/pinkmovie/pinkGoJoin.do", method = RequestMethod.GET)
	public String pinkGoJoin(PnumberVo pnumberVo , Model model) throws Exception{
		List<PnumberVo> pnumberVos = new ArrayList<PnumberVo>();
		
		pnumberVos= boardService.selectNumber();
		
		model.addAttribute("pnumberVo",pnumberVos);
		
		return "pinkmovie/pinkJoin";
	}
	
	@RequestMapping(value = "/pinkmovie/pinkGoLogin.do", method = RequestMethod.GET)
	public String pinkGoLogin(PnumberVo pnumberVo , Model model) throws Exception{
		List<PnumberVo> pnumberVos = new ArrayList<PnumberVo>();
		
		pnumberVos= boardService.selectNumber();
		
		model.addAttribute("pnumberVo",pnumberVos);
		
		return "pinkmovie/pinkLogin";
	}
	@RequestMapping(value = "/pinkmovie/pinkJoin.do", method = RequestMethod.POST)
	public String pinkJoin(MemberVo memberVo, Model model) throws Exception{
		
		int result = boardService.pinkJoin(memberVo); 
		
		if(result >0) {
			
			model.addAttribute("msg",memberVo.getId()+"님 회원가입 되었습니다");
			return "pinkmovie/GotoMain";
			
		}
		
		return "pinkmovie/pinkMain";
	}
	@RequestMapping(value = "/pinkmovie/pinkLogin.do", method = RequestMethod.POST)
	public String pinkLogin(@RequestParam("id")String id,@RequestParam("pw")String pw,MemberVo memberVo , Model model) throws Exception{
		
		System.out.println("id::::"+id);
		System.out.println("pw::::"+pw);
		if(id != null) {
			System.out.println("아이디 널값이 아니다");
			int result= boardService.pinkLogin1(id);
			System.out.println("result:::"+result);
		
			if(result > 0) {
				System.out.println("아이디가 맞다");
				int result2 = boardService.pinkLogin2(id,pw);
				
				if(result2 > 0) {
					System.out.println("비번이 맞다");
					model.addAttribute("msg", memberVo.getId()+"님이 로그인하셨습니다.");
					model.addAttribute("id",memberVo.getId());
					return "pinkmovie/GotoMain";
				}else {
					System.out.println("비번이 틀렸다");
					model.addAttribute("msg", "비번을 잘못입력하셨습니다.");
					return "pinkmovie/GotoLogin";
				}
				
			}else {
				System.out.println("아이디가 틀렸다");
				
				return "pinkmovie/pinkGotoLogin";
				
			}
			
		}
		
		return "pinkmovie/pinkMain";
	}
	
	@RequestMapping(value = "/pinkmovie/pinkLogOut.do")
	public String pinkLogou(SessionStatus status, Model model) throws Exception{
		
		if(!status.isComplete()) {
			status.setComplete();
			model.addAttribute("msg", "로그아웃 하셨습니다.");
		}
		
		
		return "pinkmovie/GotoMain";
	}
	
	
	@RequestMapping(value = "/pinkmovie/pinkIdck.do", method = RequestMethod.POST)
	@ResponseBody
	public String pinkIdck(Locale locale,MemberVo memberVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		String id = memberVo.getId(); 
		
		int resultCnt = boardService.selectMember(id);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/pinkmovie/{id}/pinkGoSe.do")
	public String pinkSe(MemberVo memberVo
			,Model model
			,@PathVariable("id")String sessionId) throws Exception{
		
		System.out.println("sessionId::"+sessionId);
		model.addAttribute("sessionId",sessionId);
		
		return "pinkmovie/pinkSe";
	}
	
	
	@RequestMapping(value = "/pinkmovie/pinkGoBoard.do")
	public String pinkInsert(@RequestParam(value="pageNo" , required=false, defaultValue="1")String strNum,Model model,PageVo pageVo) throws Exception{
		List<pinkBoardVo> pinkList = new ArrayList<pinkBoardVo>();
		
		int pageNo = Integer.parseInt(strNum);
		pageVo.setPageNo(pageNo);
		
		int totalCnt = 0;
		
		pinkList = boardService.selectPinkList(pageVo);
		totalCnt=boardService.selectPinkCnt();
		
		
		int pageCount = totalCnt/5;
		if(totalCnt%5 > 0) {
			pageCount++;
			System.out.println("pageCount:"+pageCount);
			System.out.println("pageNo::"+pageNo);
		}
		
		System.out.println("pinkList::"+pinkList);
		model.addAttribute("pinkList",pinkList);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount" , pageCount);//페이징의 마지막
		return "pinkmovie/pinkBoard";
	}
	
	
	
	@RequestMapping(value = "/pinkmovie/pinkWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(@RequestParam("sessionId")String id,@RequestParam("Comment")String comment,Locale locale,pinkBoardVo pinkBoardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		pinkBoardVo.setBoardId(id);
		pinkBoardVo.setBoardComment(comment);

		int resultCnt = boardService.pinkWrite(pinkBoardVo);
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/pinkmovie/pinkDelete.do")
	public String pinkDelete(@RequestParam("sessionId")String sessionId,@RequestParam("boardId")String boardId,@RequestParam("delete")int Idx,Model model, pinkBoardVo pinkBoardVo) throws Exception{
		
		System.out.println(boardId);
		System.out.println("sessionId:"+sessionId);
		
			if(boardId.equals(sessionId)) {
				
				pinkBoardVo.setBoardIdx(Idx);
				int resultCnt = boardService.pinkDelete(pinkBoardVo);
				
				model.addAttribute("msg","삭제되었습니다.");
			}else {
			
				model.addAttribute("msg"," 삭제할수없습니다.");
				return "pinkmovie/pinkGoBoard";
			
			}
		return "pinkmovie/delete";
	}
	
	@RequestMapping(value = "/pinkmovie/pinkGoModify.do")
	public String pinkDelete(@RequestParam("sessionId")String sessionId,@RequestParam("boardIdx")int Idx,@RequestParam("boardId")String id,@RequestParam("boardComment")String comment,Model model, pinkBoardVo pinkBoardVo) throws Exception{
		
		if(sessionId.equals(id)) {
		model.addAttribute("comment",comment);
		model.addAttribute("id",id);
		model.addAttribute("idx",Idx);
		}else {
			
			model.addAttribute("msg"," 수정권한이없습니다.");
			return "pinkmovie/pinkGoBoard";
		
		}
		
		return "pinkmovie/pinkModify";
	}
	
	@RequestMapping(value = "/pinkmovie/{idx}/pinkModify.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(@PathVariable("idx")int idx,Locale locale,pinkBoardVo pinkBoardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		System.out.println("idxidxidxidxidx"+idx);
		//출력 확인
		pinkBoardVo.setBoardIdx(idx);
		
		int resultCnt = boardService.pinkModify(pinkBoardVo);
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
}
	

