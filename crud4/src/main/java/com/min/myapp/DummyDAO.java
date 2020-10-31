package com.min.myapp;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DummyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public DummyDTO selectTest() throws Exception{
		return sqlSession.selectOne("com.min.selectTest");
		
		
	}
	

}
