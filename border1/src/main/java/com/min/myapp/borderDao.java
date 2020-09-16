package com.min.myapp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository//무조건 설정
public class borderDao {
	
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("#{sql['border.insert']}")
	private String insert;
	
	@Value("#{sql['border.delete']}")
	private String delete;
	
	@Value("#{sql['border.update']}")
	private String update;
	
	@Value("#{sql['border.get']}")
	private String get;
	
	@Value("#{sql['border.getList']}")
	private String getList;
	
	@Value("#{sql['border.getCount']}")
	private String getCount;
	
	
	public int insert(Bean bean) {
		int result =0;
		result = jdbcTmp.update(insert, bean.getName(), bean.getContent());
		return result;
	}
	
	public int delete(int idx) {
		return jdbcTmp.update(delete, idx);
	}
	
	public int update(Bean bean) {
		return jdbcTmp.update(update,bean.getContent(),bean.getIdx());//순서땜에 안됨
	}
	
	public int getCount() {//페이지만들때
		return jdbcTmp.queryForInt(getCount);
	}

	public Bean get(int idx) {
		Bean bean = jdbcTmp.queryForObject(get, new Integer[] {idx},new BorderMapper());
		
		return bean;
	}
	
	public Bean[] getList(int start, int count) {//페이지목록
		
		Bean[] bean= jdbcTmp.query(getList, new Integer[] {start,count}, new BorderMapper()).toArray(new Bean[0]);
	
		return bean;
	}
	
	
	
	class BorderMapper implements RowMapper<Bean>{//select할때 사용

		@Override
		public Bean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			Bean bean =new Bean(rs.getInt("idx"),rs.getString("name"),rs.getString("content"),rs.getDate("date1"));
			
			return bean;
		}

		
		
	}
	
	
	
	
	
}
