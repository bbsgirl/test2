package com.min.UFC.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.min.UFC.dto.playerBean;


@Repository
public class playerDao {
	
	
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("#{sql['player.playerflygetAllDate']}")
	public String playerflygetAllDate;
	
	@Value("#{sql['player.playerlightgetAllDate']}")
	public String playerlightgetAllDate;
	
	@Value("#{sql['player.playerheavygetAllDate']}")
	public String playerheavygetAllDate;
	
	@Value("#{sql['player.playerwvgetAllDate']}")
	public String playerwvgetAllDate;
	
	@Value("#{sql['player.registerfly']}")
	public String registerfly;
	
	@Value("#{sql['player.registerwv']}")
	public String registerwv;
	
	@Value("#{sql['player.registerheavy']}")
	public String registerheavy;
	
	@Value("#{sql['player.registerlight']}")
	public String registerlight;
	
	@Value("#{sql['player.playersearch']}")
	public String playersearch;
	
	public playerBean playersearch(String grade , String n) {
		
		System.out.println("g"+grade);
		System.out.println("n"+n);
		
		playerBean result = jdbcTmp.queryForObject(playersearch, new String[] {grade , n} , new playerMapper());
		
		System.out.println(result+"::::result");
		
		return result;
	}
	
	public int registerlight(playerBean playerBean) {
		int result=0;
		result = jdbcTmp.update(registerlight,  playerBean.getName(), playerBean.getAge(), playerBean.getNationality(), playerBean.getHeight(), playerBean.getWeight(), playerBean.getWin(), playerBean.getLose());
		
		return result;
	}
	
	
	public int registerheavy(playerBean playerBean) {
		int result=0;
		result = jdbcTmp.update(registerheavy,  playerBean.getName(), playerBean.getAge(), playerBean.getNationality(), playerBean.getHeight(), playerBean.getWeight(), playerBean.getWin(), playerBean.getLose());
		
		return result;
	}
	
	public int registerwv(playerBean playerBean) {
		int result= 0;
		result = jdbcTmp.update(registerwv,  playerBean.getName(), playerBean.getAge(), playerBean.getNationality(), playerBean.getHeight(), playerBean.getWeight(), playerBean.getWin(), playerBean.getLose());
		
		return result;
	}
	
	
	public int registerfly(playerBean playerBean) {
		int result = 0;
		
		result= jdbcTmp.update(registerfly, playerBean.getName(), playerBean.getAge(), playerBean.getNationality(), playerBean.getHeight(), playerBean.getWeight(), playerBean.getWin(), playerBean.getLose());
		
		return result;
		
	}
	
	
	public playerBean[] playerflygetAllDate(playerBean playerBean) {
		
		return	jdbcTmp.query(playerflygetAllDate, new playerMapper()).toArray(new playerBean[0]);
		
	}
	
	public playerBean[] playerlightgetAllDate(playerBean playerBean) {
		
		return	jdbcTmp.query(playerlightgetAllDate, new playerMapper()).toArray(new playerBean[0]);
		
	}
	
	public playerBean[] playerheavygetAllDate(playerBean playerBean) {
		
		return	jdbcTmp.query(playerheavygetAllDate, new playerMapper()).toArray(new playerBean[0]);
		
	}

	public playerBean[] playerwvgetAllDate(playerBean playerBean) {
	
	return	jdbcTmp.query(playerwvgetAllDate, new playerMapper()).toArray(new playerBean[0]);
	
}
	
	class playerMapper implements RowMapper<playerBean>{

		@Override
		public playerBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			//¿Ã∞≈ ª©∏‘¿Ω
			playerBean playerBean = new playerBean(rs.getString("name"), rs.getString("age"), rs.getString("Nationality"), rs.getString("Height"), rs.getInt("Weight"), rs.getInt("win"), rs.getInt("lose"));
			return  playerBean;
		}
		
	}
	/*
	 * DataSource ds; Connection con = null; PreparedStatement pstmt = null;
	 * ResultSet rs; int result = 0;
	 * 
	 * public playerDao(){
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
	 * public int playerflyinsertData(playerBean bean){
	 * 
	 * 
	 * String sql="insert into playerfly values(?,?,?,?,?,?,?)";
	 * 
	 * try { con = ds.getConnection();
	 * 
	 * pstmt =con.prepareStatement(sql); pstmt.setString(1, bean.getName());
	 * pstmt.setString(2, bean.getAge()); pstmt.setString(3, bean.getNationality());
	 * pstmt.setString(4, bean.getHeight()); pstmt.setInt(5, bean.getWeight());
	 * pstmt.setInt(6, bean.getWin()); pstmt.setInt(7, bean.getLose());
	 * 
	 * result=pstmt.executeUpdate();
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally{ freeConn(pstmt,con); }
	 * 
	 * 
	 * 
	 * return result; }
	 * 
	 * public Vector<playerBean> playerflygetAllDate(){ Vector<playerBean> v= new
	 * Vector<playerBean>();
	 * 
	 * String sql = "select * from playerfly order by win desc";
	 * 
	 * try { con= ds.getConnection();
	 * 
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()){ playerBean bean = new playerBean();
	 * 
	 * bean.setName(rs.getString(1)); bean.setAge(rs.getString(2));
	 * bean.setNationality(rs.getString(3)); bean.setHeight(rs.getString(4));
	 * bean.setWeight(rs.getInt(5)); bean.setWin(rs.getInt(6));
	 * bean.setLose(rs.getInt(7));
	 * 
	 * v.add(bean); }
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { freeConn(pstmt, con, rs); }
	 * 
	 * return v; }
	 * 
	 * public Vector<playerBean> playersear(String g,String n){ Vector<playerBean>
	 * v= new Vector<playerBean>();
	 * 
	 * 
	 * System.out.println("dao : "+g); System.out.println("dao : "+n);
	 * 
	 * String sql = "select * from ? where NAME = ?"; String sql =
	 * "select * from "+g+" where NAME = '"+ n +"' ";
	 * System.out.println("sql : "+sql); try { con= ds.getConnection();
	 * 
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()){ playerBean bean = new playerBean();
	 * 
	 * bean.setName(rs.getString(1)); bean.setAge(rs.getString(2));
	 * bean.setNationality(rs.getString(3)); bean.setHeight(rs.getString(4));
	 * bean.setWeight(rs.getInt(5)); bean.setWin(rs.getInt(6));
	 * bean.setLose(rs.getInt(7));
	 * 
	 * v.add(bean); }
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { freeConn(pstmt, con, rs); }
	 * 
	 * return v; }
	 * 
	 * 
	 * 
	 * public int playerlightinsertData(playerBean bean){
	 * 
	 * 
	 * String sql="insert into playerlight values(?,?,?,?,?,?,?)";
	 * 
	 * try { con = ds.getConnection();
	 * 
	 * pstmt =con.prepareStatement(sql);
	 * 
	 * 
	 * pstmt.setString(1, bean.getName()); pstmt.setString(2, bean.getAge());
	 * pstmt.setString(3, bean.getNationality()); pstmt.setString(4,
	 * bean.getHeight()); pstmt.setInt(5, bean.getWeight()); pstmt.setInt(6,
	 * bean.getWin()); pstmt.setInt(7, bean.getLose());
	 * 
	 * result=pstmt.executeUpdate();
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally{ freeConn(pstmt,con); }
	 * 
	 * 
	 * 
	 * return result; }
	 * 
	 * public Vector<playerBean> playerlightgetAllDate(){ Vector<playerBean> v= new
	 * Vector<playerBean>();
	 * 
	 * String sql = "select * from playerlight order by win desc"; try { con=
	 * ds.getConnection();
	 * 
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()){ playerBean bean = new playerBean();
	 * 
	 * bean.setName(rs.getString(1)); bean.setAge(rs.getString(2));
	 * bean.setNationality(rs.getString(3)); bean.setHeight(rs.getString(4));
	 * bean.setWeight(rs.getInt(5)); bean.setWin(rs.getInt(6));
	 * bean.setLose(rs.getInt(7));
	 * 
	 * v.add(bean); }
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { freeConn(pstmt, con, rs); }
	 * 
	 * return v; }
	 * 
	 * public int playerheavyinsertData(playerBean bean){
	 * 
	 * 
	 * String sql="insert into playerheavy values(?,?,?,?,?,?,?)";
	 * 
	 * try { con = ds.getConnection();
	 * 
	 * pstmt =con.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, bean.getName()); pstmt.setString(2, bean.getAge());
	 * pstmt.setString(3, bean.getNationality()); pstmt.setString(4,
	 * bean.getHeight()); pstmt.setInt(5, bean.getWeight()); pstmt.setInt(6,
	 * bean.getWin()); pstmt.setInt(7, bean.getLose());
	 * 
	 * result=pstmt.executeUpdate();
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally{ freeConn(pstmt,con); }
	 * 
	 * 
	 * 
	 * return result; }
	 * 
	 * public Vector<playerBean> playerheavygetAllDate(){ Vector<playerBean> v= new
	 * Vector<playerBean>();
	 * 
	 * String sql = "select * from playerheavy order by win desc"; try { con=
	 * ds.getConnection();
	 * 
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()){ playerBean bean = new playerBean();
	 * bean.setName(rs.getString(1)); bean.setAge(rs.getString(2));
	 * bean.setNationality(rs.getString(3)); bean.setHeight(rs.getString(4));
	 * bean.setWeight(rs.getInt(5)); bean.setWin(rs.getInt(6));
	 * bean.setLose(rs.getInt(7));
	 * 
	 * 
	 * v.add(bean); }
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { freeConn(pstmt, con, rs); }
	 * 
	 * return v; }
	 * 
	 * public int playerwvinsertData(playerBean bean){
	 * 
	 * 
	 * String sql="insert into playerwv values(?,?,?,?,?,?,?)";
	 * 
	 * try { con = ds.getConnection();
	 * 
	 * pstmt =con.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, bean.getName()); pstmt.setString(2, bean.getAge());
	 * pstmt.setString(3, bean.getNationality()); pstmt.setString(4,
	 * bean.getHeight()); pstmt.setInt(5, bean.getWeight()); pstmt.setInt(6,
	 * bean.getWin()); pstmt.setInt(7, bean.getLose());
	 * 
	 * 
	 * result=pstmt.executeUpdate();
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally{ freeConn(pstmt,con); }
	 * 
	 * 
	 * 
	 * return result; }
	 * 
	 * public Vector<playerBean> playerwvgetAllDate(){ Vector<playerBean> v= new
	 * Vector<playerBean>();
	 * 
	 * String sql = "select * from playerwv order by win desc"; try { con=
	 * ds.getConnection();
	 * 
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()){ playerBean bean = new playerBean();
	 * bean.setName(rs.getString(1)); bean.setAge(rs.getString(2));
	 * bean.setNationality(rs.getString(3)); bean.setHeight(rs.getString(4));
	 * bean.setWeight(rs.getInt(5)); bean.setWin(rs.getInt(6));
	 * bean.setLose(rs.getInt(7));
	 * 
	 * v.add(bean); }
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { freeConn(pstmt, con, rs); }
	 * 
	 * return v; }
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
