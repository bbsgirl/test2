package com.min.UFC.dao;
/*
package com.min.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import project.min.controller.DBConnectionMgr;
import project.min.dto.GameBean;
import project.min.dto.MypageCart;
import project.min.dto.TicketBean;

public class TicketDao {
	DataSource ds;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int result = 0;
	
	public TicketDao(){
		
		InitialContext initialContext = null;
		try {
			initialContext = new InitialContext();
			
			ds = (DataSource) initialContext.lookup(
				     "java:comp/env/jdbc/dbcp"
				);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int ticketInsert(TicketBean bean){
		String sql="insert into ticket values(null,?,?,?,default)";
		
		try {
			con = ds.getConnection();
			pstmt =con.prepareStatement(sql);
			
			
			
			pstmt.setString(1, bean.getT_user());
			pstmt.setInt(2, bean.getT_name());
			pstmt.setInt(3, bean.getP_num());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con);
		}
		return result;
	}
	
	public Vector<TicketBean> ticketAll(String id){
		Vector<TicketBean> v = new Vector<TicketBean>();
		
		String sql = "select * from ticket where t_user=?";
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TicketBean bean = new TicketBean();
				bean.setT_user(rs.getString(2));
				bean.setT_name(rs.getInt(3));
				bean.setP_num(rs.getInt(4));
				bean.setT_pd(rs.getString(5));
				v.add(bean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			freeConn(pstmt, con, rs);
		}
		
		return v;
	}
	
	
public void freeConn(PreparedStatement pstmt, Connection con,ResultSet rs){
		
		
		
		try {
			if(pstmt != null) 
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(con != null) 
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(rs != null) 
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
		
		public void freeConn(PreparedStatement pstmt, Connection con){
			
			
			try {
				if(pstmt != null) 
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con != null) 
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
}

*/