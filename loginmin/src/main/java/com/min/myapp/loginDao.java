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
	
	@Value("#{sql['login.insert']}")
	private String insert;
	
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
	
	public int update(String content , int no) {
		return jdbcTmp.update(update, content, no);
	}
	
	
	public int delete(int no) {
		
		return jdbcTmp.update(delete, no);
	}
	
	
	public int b_insert(beanDto beanDto,boardminDto boardminDto) {
		
		return jdbcTmp.update(b_insert, beanDto.getId(), boardminDto.getContent());
		
	}
	
	public int insert(beanDto beanDto) {
		int result =0;
		result = jdbcTmp.update(insert, beanDto.getId(), beanDto.getPw(), beanDto.getName());
		
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
