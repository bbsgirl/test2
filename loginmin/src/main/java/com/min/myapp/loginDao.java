package com.min.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class loginDao {
	
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("#{sql['login.insert']}")
	private String insert;
	
	public int insert(beanDto beanDto) {
		int result =0;
		result = jdbcTmp.update(insert, beanDto.getId(), beanDto.getPw(), beanDto.getName());
		
		return result;		
		
	}

}
