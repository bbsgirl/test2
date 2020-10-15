package com.min.myapp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class boardDao3 {
	
	@Autowired
	private JdbcTemplate jdbcTmp;

	@Value("#{sql['board3.register']}")
	private String register;
	
	@Value("#{sql['boardinsert3.insert']}")
	private String insert;
	
	@Value("#{sql['board3.registerck']}")
	private String registerck;
	
	@Value("#{sql['board3.login']}")
	private String login;
	
	public memberdto3 login(memberdto3 memberdto3) {
		 memberdto3 result= jdbcTmp.queryForObject(login, new String[] {memberdto3.getId() ,memberdto3.getPw()}, new MemberMapper() );
		System.out.println("result+"+result);
		return result;
		
	}
	
	public int registerck(String id) {
		int result = 0;
		
		return result = jdbcTmp.queryForInt(registerck, id);
	}
	
	public int register(memberdto3 memberdto3) {
		int result =0;
		
		result = jdbcTmp.update(register, memberdto3.getId(), memberdto3.getPw(), memberdto3.getName(), memberdto3.getEmail1()+"@"+memberdto3.getEmail2(), memberdto3.getGender());
		
		return result;
		
	}
	
	public int insert(boardinsertDto boardinsertDto) {
		
		int result = jdbcTmp.update(insert, boardinsertDto.getId(), boardinsertDto.getDate());
		return result;
	}
	
	class MemberMapper implements RowMapper<memberdto3>{

		@Override
		public memberdto3 mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			memberdto3 memberdto3 = new memberdto3(rs.getInt("idx"), rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getString("email"), rs.getString("gender"), rs.getString("gender"));
			
			return memberdto3;
		}
		
	}
	
	
}
