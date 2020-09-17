package com.min.myapp;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;



@Repository
public class loginDao {
	
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("#{sql['login.insert']}")//쿼리문이 담기것을 다시 인설트에담는다
	private String insert;//인설트의 밑에 담긴다 jdbctmp의 업데이트안에
	
	@Value("#{sql['login.login']}")
	private String login;
	
	
	@Value("#{sql['login.b_insert']}")
	private String b_insert;
	
	@Value("#{sql['login.boardminDto']}")
	private String boardminDto;
	
	@Value("#{sql['login.delete']}")
	private String delete;
	
	@Value("#{sql['login.update']}")
	private String update;
	
	public int update(String content , int no) {//받은것을 보내고 다시 리턴 
		return jdbcTmp.update(update, content, no);//안에는 쿼리랑 
	}
	
	
	public int delete(int no) {//값을 받은걸 리턴한다
		
		return jdbcTmp.update(delete, no);
	}
	
	
	public int b_insert(beanDto beanDto,boardminDto boardminDto) {
		
		return jdbcTmp.update(b_insert, beanDto.getId(), boardminDto.getContent());
		
	}
	
	public int insert(beanDto beanDto) {
		int result =0;
		result = jdbcTmp.update(insert, beanDto.getId(), beanDto.getPw(), beanDto.getName());
		//안에는 쿼이문 아이디 비번 이름이 담긴다 
		
		return result;		
		
	}
	
	public int login(beanDto beanDto) {
		
		return jdbcTmp.update(login,beanDto.getId());
	}
	
	public boardminDto[] getAll() {
		
		return jdbcTmp.query(boardminDto, new BorderMapper()).toArray(new boardminDto[0]);
	}
	
	
	class BorderMapper implements RowMapper<boardminDto>{//select할때 사용

		@Override
		public boardminDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			boardminDto bean =new boardminDto(rs.getInt("no"),rs.getString("id"),rs.getString("content"),rs.getDate("day"));
			
			return bean;
		}
		
	}

}
