package com.min.UFC.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.min.UFC.dto.MemberBean;


@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	
	@Value("#{sql['member.login']}")
	public String login;
	
	@Value("#{sql['member.join']}")
	public String join; 
	
	@Value("#{sql['member.check']}")
	public String check;
	
	
	 public MemberBean login(MemberBean memberBean) {
	
	 MemberBean aa =jdbcTmp.queryForObject(login, new String[] {memberBean.getId(), memberBean.getPw()}, new MemberMapper());
	 // aa.setPw(""); °ªÀÌ ºó°ªÀ¸·Î °£´Ù...
	  System.out.println(aa+"result");
	  return aa;
	 }
	 
	 public int join(MemberBean memberBean) {
		 int result= 0;
		  result = jdbcTmp.update(join, memberBean.getId(), memberBean.getPw(), memberBean.getName(), memberBean.getAge(), memberBean.getGender());
		 return result;
	 }
	 
	 public int check(String id) {
		 int result = 0;
		 return result = jdbcTmp.queryForInt(check, id);
	 }
	 
	 
	 
	 
	 class MemberMapper implements RowMapper<MemberBean>{

		@Override
		public MemberBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//ÀÌ°Å »©¸ÔÀ½
			MemberBean MemberBean = new MemberBean(rs.getInt("idx") , rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getInt("age"), rs.getString("gender"),rs.getString("admin"));
			return  MemberBean;
		}
		
	 }
	
	
	/*
	 * DataSource ds; Connection con = null; PreparedStatement pstmt = null;
	 * ResultSet rs; int result = 0;
	 * 
	 * public MemberDao(){
	 * 
	 * InitialContext initialContext = null; try { initialContext = new
	 * InitialContext();
	 * 
	 * ds = (DataSource) initialContext.lookup( "java:comp/env/jdbc/dbcp" ); } catch
	 * (NamingException e) { // TODO Auto-generated catch block e.printStackTrace();
	 * }
	 * 
	 * }
	 * 
	 * 
	 * public Vector<MemberBean> getAllData(){ Vector<MemberBean> v = new
	 * Vector<MemberBean>(); String sql = "select * from member"; try { con =
	 * ds.getConnection(); pstmt = con.prepareStatement(sql); rs =
	 * pstmt.executeQuery();
	 * 
	 * while(rs.next()){ MemberBean bean = new MemberBean();
	 * bean.setIdx(rs.getInt(1)); bean.setId(rs.getString(2));
	 * bean.setPw(rs.getString(3)); bean.setName(rs.getString(4));
	 * bean.setAge(rs.getInt(5)); bean.setGender(rs.getString(6));
	 * bean.setAdmin(rs.getString(7)); v.add(bean); } } catch (Exception e) {
	 * e.printStackTrace(); }finally { freeConn(pstmt,con, rs); } return v; }
	 * 
	 * public int memberInsert(MemberBean bean){ String sql =
	 * "insert into member values(null,?,?,?,?,?,default)"; try { con =
	 * ds.getConnection(); pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * bean.getId()); pstmt.setString(2, bean.getPw()); pstmt.setString(3,
	 * bean.getName()); pstmt.setInt(4, bean.getAge()); pstmt.setString(5,
	 * bean.getGender()); result = pstmt.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); }finally { freeConn(pstmt,con); } return result; }
	 * 
	 * public boolean memberlogin(String id ,String pw){ boolean result = false;
	 * String sql = "select * from member where id = ? and pw = ?"; try { con =
	 * ds.getConnection(); pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * id); pstmt.setString(2, pw); rs = pstmt.executeQuery(); if(rs.next()){
	 * result=true; } } catch (Exception e) { e.printStackTrace(); }finally {
	 * freeConn(pstmt,con, rs); } return result; }
	 * 
	 * public Vector<MemberBean> memberSearch(String id){ Vector<MemberBean> v = new
	 * Vector<MemberBean>(); String sql = "select * from member where id = ?"; try {
	 * con = ds.getConnection(); pstmt = con.prepareStatement(sql);
	 * pstmt.setString(1, id); rs = pstmt.executeQuery(); while(rs.next()){
	 * MemberBean bean = new MemberBean(); bean.setIdx(rs.getInt(1));
	 * bean.setId(rs.getString(2)); bean.setPw(rs.getString(3));
	 * bean.setName(rs.getString(4)); bean.setAge(rs.getInt(5));
	 * bean.setGender(rs.getString(6)); bean.setAdmin(rs.getString(7)); v.add(bean);
	 * } } catch (Exception e) { e.printStackTrace(); }finally { freeConn(pstmt,con,
	 * rs); } return v; }
	 * 
	 * public int memberUpdate(String id, String pw){ int result = 0; Connection con
	 * = null; PreparedStatement pstmt = null; String sql =
	 * "Update member set pw = ? where id = ?"; try { con = ds.getConnection();
	 * pstmt = con.prepareStatement(sql); pstmt.setString(1, pw); pstmt.setString(2,
	 * id); result = pstmt.executeUpdate(); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }finally {
	 * freeConn(pstmt,con); } return result; }
	 * 
	 * public boolean memberCheck(String id){ boolean result = false; String sql =
	 * "select * from member where id = ?"; try { con = ds.getConnection(); pstmt =
	 * con.prepareStatement(sql); pstmt.setString(1, id); rs = pstmt.executeQuery();
	 * if(rs.next()){ result=true; }else{ result=false; } } catch (Exception e) {
	 * e.printStackTrace(); }finally { freeConn(pstmt,con, rs); } return result; }
	 * 
	 * public String memberId(String name){ String result = null; String sql =
	 * "select id from member where name = ?"; try { con = ds.getConnection(); pstmt
	 * = con.prepareStatement(sql); pstmt.setString(1, name); rs =
	 * pstmt.executeQuery(); if(rs.next()){ result = rs.getString("id"); } } catch
	 * (Exception e) { e.printStackTrace(); }finally { freeConn(pstmt,con, rs); }
	 * return result; }
	 * 
	 * public String memberPw(String id, String name){ String result = null; String
	 * sql = "select pw from member where id = ? and name = ?"; try { con =
	 * ds.getConnection(); pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * id); pstmt.setString(2, name); rs = pstmt.executeQuery(); if(rs.next()){
	 * result = rs.getString("pw"); } } catch (Exception e) { e.printStackTrace();
	 * }finally { freeConn(pstmt,con, rs); } return result; }
	 * 
	 * public void freeConn(PreparedStatement pstmt, Connection con,ResultSet rs){
	 * 
	 * 
	 * 
	 * try { if(pstmt != null) pstmt.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } try { if(con != null) con.close(); } catch
	 * (SQLException e) { e.printStackTrace(); } try { if(rs != null) rs.close(); }
	 * catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * 
	 * }
	 * 
	 * public void freeConn(PreparedStatement pstmt, Connection con){
	 * 
	 * 
	 * try { if(pstmt != null) pstmt.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } try { if(con != null) con.close(); } catch
	 * (SQLException e) { e.printStackTrace(); }
	 * 
	 * 
	 * }
	 */
}
