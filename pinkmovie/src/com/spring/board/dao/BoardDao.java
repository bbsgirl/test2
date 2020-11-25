package com.spring.board.dao;

import java.util.List;


import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.PnumberVo;
import com.spring.board.vo.pinkBoardVo;

public interface BoardDao {

	public int pinkJoin(MemberVo memberVo) throws Exception;

	public int pinkIdck(MemberVo memberVo) throws Exception;

	public List<PnumberVo> selectNumber() throws Exception;

	public int pinkLogin1(MemberVo memberVo) throws Exception;

	public int pinkLogin2(MemberVo memberVo) throws Exception;

	public int pinkinsert(pinkBoardVo pinkBoardVo) throws Exception;

	public List<pinkBoardVo> selectPinkList(PageVo pageVo) throws Exception;

	public int selectPinkCnt()throws Exception;

	public int pinkWrite(pinkBoardVo pinkBoardVo) throws Exception;

	public int pinkDelete(pinkBoardVo pinkBoardVo) throws Exception;

	public int pinkModify(pinkBoardVo pinkBoardVo) throws Exception;


}
