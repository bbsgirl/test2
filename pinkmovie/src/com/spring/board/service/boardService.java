package com.spring.board.service;

import java.util.List;


import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.PnumberVo;
import com.spring.board.vo.pinkBoardVo;

public interface boardService {

	public int pinkJoin(MemberVo memberVo) throws Exception;

	public int selectMember(String string) throws Exception;

	public List<PnumberVo> selectNumber() throws Exception;

	public int pinkLogin1(String id) throws Exception;

	public int pinkLogin2(String id, String pw) throws Exception;

	public int pinkRequest(String id, String comment) throws Exception;

	public List<pinkBoardVo> selectPinkList(PageVo pageVo) throws Exception;

	public int selectPinkCnt() throws Exception;

	public int pinkWrite(pinkBoardVo pinkBoardVo) throws Exception;

	public int pinkDelete(pinkBoardVo pinkBoardVo)throws Exception;

	public int pinkModify(pinkBoardVo pinkBoardVo) throws Exception;



}
