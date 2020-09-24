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
		  									//			���������̴�		���̵�� ����� �����ͼ� �ִ°Ŷ�                              ��������
		  memberBean aa =jdbcTmp.queryForObject(login, new String[] {memberBean.getId(),memberBean.getPw()}, new MemberMapper());
		 // aa.setPw(""); ���� ������ ����...
		  //������ �������½��̴�
		  System.out.println(aa+"result");
		  return aa;
	  
		  
	}
	  
	
	public int register(memberBean memberBean) {//id pw name gender�� �Ѿ�´� 
		int result = 0;// ��Ʈ�� 
		result = jdbcTmp.update(register, memberBean.getId(), memberBean.getPw() ,memberBean.getName() , memberBean.getGender());
		return result;//��ϿϷ�
	}
	
	public int insert(memberBean memberBean, boardBean boardBean) {
		
		return jdbcTmp.update(insert, memberBean.getId() , memberBean.getGender() ,boardBean.getContent());// ��¥�� �ȳ־ �ȴ�
	}

	//������ ��ü�� ��������
	public boardBean[] getAll(int start , int count) {
		
		//query�� ��ü�� �����´�
		//queryforint�� int ���·� �����´�
		//queryforobject�� ���ٰ����ö� ����Ѵ�
		
		boardBean [] bean =jdbcTmp.query(boardBean, new Integer[] {start, count}, new boardMapper()).toArray(new boardBean[0]);
		
		return bean;
		
	}
	
	public int getCount() {//���������鶧
		return jdbcTmp.queryForInt(getCount);
	}
	
	
	class boardMapper implements RowMapper<boardBean>{

		@Override
		public boardBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//�̰� ������
			boardBean boardBean = new boardBean(rs.getInt("no"), rs.getString("id"),rs.getString("gender") , rs.getString("content"), rs.getDate("day"));
			return  boardBean;
		}
		
	}
	class MemberMapper implements RowMapper<memberBean>{

		@Override
		public memberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//�̰� ������
			memberBean memberBean = new memberBean(rs.getInt("idx"), rs.getString("id"),rs.getString("pw") , rs.getString("name"), rs.getString("gender"));
			return  memberBean;
		}
		
	}

}
