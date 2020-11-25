package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.PnumberVo;
import com.spring.board.vo.pinkBoardVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public int pinkJoin(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.pinkJoin(memberVo);
	}

	@Override
	public int selectMember(String id) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = new MemberVo();
		memberVo.setId(id);
		
		return boardDao.pinkIdck(memberVo);
	}

	@Override
	public List<PnumberVo> selectNumber() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectNumber();
	}

	@Override
	public int pinkLogin1(String id) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = new MemberVo();
		
		memberVo.setId(id);
		
		return boardDao.pinkLogin1(memberVo);
	}

	@Override
	public int pinkLogin2(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = new MemberVo();
		
		memberVo.setId(id);
		memberVo.setPw(pw);
		return boardDao.pinkLogin2(memberVo);
	}


	@Override
	public int pinkRequest(String id, String comment) throws Exception {
		// TODO Auto-generated method stub
		pinkBoardVo pinkBoardVo = new pinkBoardVo();
		pinkBoardVo.setBoardId(id);
		pinkBoardVo.setBoardComment(comment);
		return boardDao.pinkinsert(pinkBoardVo);
	}

	@Override
	public List<pinkBoardVo> selectPinkList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectPinkList(pageVo);
	}

	@Override
	public int selectPinkCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectPinkCnt();
	}

	@Override
	public int pinkWrite(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.pinkWrite(pinkBoardVo);
	}

	@Override
	public int pinkDelete(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		
	
		return boardDao.pinkDelete(pinkBoardVo);
	}

	@Override
	public int pinkModify(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.pinkModify(pinkBoardVo);
	}

	
}
