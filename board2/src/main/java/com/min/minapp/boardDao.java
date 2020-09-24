package com.min.minapp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;



@Repository
public class boardDao {
		
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("#{sql['board.register']}")
	public String register;
	
	@Value("#{sql['board.login']}")
	public String login;
	 
	@Value("#{sql['board.insert']}")
	public String insert;

	@Value("#{sql['board.delete']}")
	public String delete;

	@Value("#{sql['board.modify']}")
	public String modify;
	
	@Value("#{sql['board.boardBean']}")
	public String boardBean;
	
	@Value("#{sql['border.getCount']}")
	private String getCount;
	
	
	public int delete(boardBean boardBean) {
		
		return jdbcTmp.update(delete, boardBean.getNo());
	}
	
		
	public int modify(boardBean boardBean) {
		
		return jdbcTmp.update(modify,boardBean.getContent(),boardBean.getNo());
	}
	
	
	public memberBean login(memberBean memberBean) {
		  									//			문자형식이다		아이디와 비번을 가져와서 넣는거라서                              맵퍼형식
		  memberBean aa =jdbcTmp.queryForObject(login, new String[] {memberBean.getId(),memberBean.getPw()}, new MemberMapper());
		 // aa.setPw(""); 값이 빈값으로 간다...
		  //한줄을 가져오는식이다
		  System.out.println(aa+"result");
		  return aa;
	  
		  
	}
	  
	
	public int register(memberBean memberBean) {//id pw name gender가 넘어온다 
		int result = 0;// 인트로 
		result = jdbcTmp.update(register, memberBean.getId(), memberBean.getPw() ,memberBean.getName() , memberBean.getGender());
		return result;//등록완료
	}
	
	public int insert(memberBean memberBean, boardBean boardBean) {
		
		return jdbcTmp.update(insert, memberBean.getId() , memberBean.getGender() ,boardBean.getContent());// 날짜는 안넣어도 된다
	}

	//보더를 전체를 가져오기
	public boardBean[] getAll(int start , int count) {
		
		//query는 전체를 가져온다
		//queryforint는 int 형태롤 가져온다
		//queryforobject는 한줄가져올때 사용한다
		
		boardBean [] bean =jdbcTmp.query(boardBean, new Integer[] {start, count}, new boardMapper()).toArray(new boardBean[0]);
		
		return bean;
		
	}
	
	public int getCount() {//페이지만들때
		return jdbcTmp.queryForInt(getCount);
	}
	
	
	class boardMapper implements RowMapper<boardBean>{

		@Override
		public boardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//이거 빼먹음
			boardBean boardBean = new boardBean(rs.getInt("no"), rs.getString("id"),rs.getString("gender") , rs.getString("content"), rs.getDate("day"));
			return  boardBean;
		}
		
	}
	class MemberMapper implements RowMapper<memberBean>{

		@Override
		public memberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//이거 빼먹음
			memberBean memberBean = new memberBean(rs.getInt("idx"), rs.getString("id"),rs.getString("pw") , rs.getString("name"), rs.getString("gender"));
			return  memberBean;
		}
		
	}

}
