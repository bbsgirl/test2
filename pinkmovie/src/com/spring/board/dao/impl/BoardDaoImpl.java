package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.PnumberVo;
import com.spring.board.vo.pinkBoardVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int pinkJoin(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.pinkJoin", memberVo);
	}
	@Override
	public int pinkIdck(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.pinkIdck",memberVo);
	}
	@Override
	public List<PnumberVo> selectNumber() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectNumber");
	}
	@Override
	public int pinkLogin1(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.pinkLogin1",memberVo);
	}
	@Override
	public int pinkLogin2(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.pinkLogin2",memberVo);
	}
	@Override
	public int pinkinsert(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("id:::::"+pinkBoardVo.getBoardId());
		System.out.println("comment~~~"+pinkBoardVo.getBoardComment());
		System.out.println("idx~~~!!!"+pinkBoardVo.getBoardIdx());
		return sqlSession.selectOne("board.pinkInsert",pinkBoardVo);
	}
	@Override
	public List<pinkBoardVo> selectPinkList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.pinkList",pageVo);
	}
	@Override
	public int selectPinkCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.PinkCnt");
	}
	@Override
	public int pinkWrite(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("pinkBoardVo.getBoardId():::"+pinkBoardVo.getBoardId());//여기까지 온다
		System.out.println("pinkBoardVo.getBoardcomment:::"+pinkBoardVo.getBoardComment());
		System.out.println("pinkBoardVo.getBoardidx:::"+pinkBoardVo.getBoardIdx());
		return sqlSession.insert("board.pinkWrite", pinkBoardVo);
		//insert , update , selectList , selectOne
	}
	@Override
	public int pinkDelete(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.pinkDelete",pinkBoardVo);
	}
	@Override
	public int pinkModify(pinkBoardVo pinkBoardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.pinkModify", pinkBoardVo);
	}
	
	
	
}
