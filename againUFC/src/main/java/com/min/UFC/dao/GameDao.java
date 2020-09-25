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


import project.min.dto.GameBean;
import project.min.dto.TicketBean;
import project.min.dto.playerBean;


public class GameDao {
	DataSource ds;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int result = 0;
	
	public GameDao(){
		
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
	
	public Vector<GameBean> allgetData(){
		Vector<GameBean> v= new Vector<GameBean>();
		String sql = "select * from game";
		
		try {
			con= ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				GameBean bean = new GameBean();
				bean.setIdx(rs.getInt(1));
				bean.setG_name(rs.getString(2));
				bean.setG_time(rs.getString(3));
				bean.setG_date(rs.getString(4));
				bean.setG_place(rs.getString(5));
				bean.setG_player1(rs.getString(6));
				bean.setG_player2(rs.getString(7));
				bean.setT_ticket(rs.getInt(8));
				bean.setT_price(rs.getInt(9));
				bean.setG_img(rs.getString(10));
				bean.setG_weight(rs.getString(11));
				bean.setIsfinish(rs.getString(12));
				v.add(bean);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn( pstmt,con, rs);
		}
		
		
		return v;
		}//end of allgetData
	
public int gameInsert(GameBean bean){
	
		
		String sql="insert into game values(null,?,?,?,?,?,?,?,?,?,?,default)";
		
		try {
			con = ds.getConnection();
			pstmt =con.prepareStatement(sql);
			
			
			pstmt.setString(1, bean.getG_name());
			pstmt.setString(2, bean.getG_time());
			pstmt.setString(3, bean.getG_date());
			pstmt.setString(4, bean.getG_place());
			pstmt.setString(5, bean.getG_player1());
			pstmt.setString(6, bean.getG_player2());
			pstmt.setInt(7, bean.getT_ticket());
			pstmt.setInt(8, bean.getT_price());
			pstmt.setString(9, bean.getG_img());
			pstmt.setString(10, bean.getG_weight());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt, con);
		}
		return result;
	}//end of gameInsert


	public Vector<playerBean> gamecombox(String w){
		Vector<playerBean> v =new Vector<playerBean>();
		
		System.out.println("gamecombox: "+w);
		String sql = "select * from "+w;
		
		
		try {
			con= ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				playerBean bean = new playerBean();
				bean.setName(rs.getString(1));
				v.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			freeConn( pstmt,con, rs);
		}
		
		return v;
	}//end of gamecombox
	
	public GameBean gameUpdate(int idx){
		GameBean bean = new GameBean();
		String sql = "select * from game where idx=?";
		try {
			con= ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setIdx(rs.getInt(1));
				bean.setG_name(rs.getString(2));
				bean.setG_time(rs.getString(3));
				bean.setG_date(rs.getString(4));
				bean.setG_place(rs.getString(5));
				bean.setG_player1(rs.getString(6));
				bean.setG_player2(rs.getString(7));
				bean.setT_ticket(rs.getInt(8));
				bean.setT_price(rs.getInt(9));
				bean.setG_img(rs.getString(10));
				bean.setG_weight(rs.getString(11));
				bean.setIsfinish(rs.getString(12));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn( pstmt,con, rs);
		}
		return bean;
	}//end of gameUpdate

	public int gameUpdateOk(GameBean bean) {
		int result=0;
		
		String sql="update game set g_name=?,g_time=?,g_date=?,g_place=?,g_player1=?,g_player2=?,t_ticket=?,t_price=?,g_img=? where idx=?";
		
		try {
			con = ds.getConnection();
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, bean.getG_name());
			pstmt.setString(2, bean.getG_time());
			pstmt.setString(3, bean.getG_date());
			pstmt.setString(4, bean.getG_place());
			pstmt.setString(5, bean.getG_player1());
			pstmt.setString(6, bean.getG_player2());
			pstmt.setInt(7, bean.getT_ticket());
			pstmt.setInt(8, bean.getT_price());
			pstmt.setString(9, bean.getG_img());
			pstmt.setInt(10, bean.getIdx());
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con);
		}
		return result;
	}//end of gameUpdateOk

	public int gameDelete(int idx) {
		int result = 0;
		String sql = "delete from game where idx=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con);
		}
		return result;
	}//end of gameDelete
	
	public GameBean gameSelect(int idx){
		GameBean bean = new GameBean();
		String sql = "select g_player1,g_player2,g_weight from game where idx=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean.setG_player1(rs.getString(1));
				bean.setG_player2(rs.getString(2));
				bean.setG_weight(rs.getString(3));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bean;
	}//end of gameSelect
	public int winCount(String name, String weight){
		int result=0;
		String sql = "select win from "+weight+" where name=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn( pstmt,con, rs);
		}
		
		return result;
	}
	public int loseCount(String name, String weight){
		int result=0;
		String sql = "select lose from "+weight+" where name=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn( pstmt,con, rs);
		}
		
		return result;
	}

	public int winnerSet(String winner, String weight, int win) {
		String sql = "update "+weight+" set win=? where name=?";
		int result=0;
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, win);
			pstmt.setString(2, winner);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt, con);
		}
		return result;
	}

	public int loserSet(String loser, String weight, int lose) {
		String sql = "update "+weight+" set lose=? where name=?";
		int result=0;
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, lose);
			pstmt.setString(2, loser);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt, con);
		}
		return result;
	}

	public int endGame(int idx) {
		String sql = "update game set isfinish='finish' where idx=?";
		int result=0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt, con);
		}
		return result;
	}

	public int getNticket(int idx) {
		int tNum=0;
		String sql="select sum(p_num) from ticket WHERE t_name="+idx;
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println(rs.getInt(1));
				tNum=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con,rs);
		}
		
		return tNum;
	}

	public void ticInsert(TicketBean bean2) {
		String sql = "insert into ticket values(null,?,?,?,default)";
		int result = 0;
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean2.getT_user());
			pstmt.setInt(2, bean2.getT_name());
			pstmt.setInt(3, bean2.getP_num());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt, con);
		}
	}
	
	public Vector<TicketBean> ticSelect(){
		Vector<TicketBean> v= new Vector<TicketBean>();
		String sql = "select * from ticket";
		try {
			con= ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				TicketBean bean2 = new TicketBean();
				bean2.setIdx(rs.getInt(1));
				bean2.setT_user(rs.getString(2));
				bean2.setT_name(rs.getInt(3));
				bean2.setP_num(rs.getInt(4));
				bean2.setT_pd(rs.getString(5));
				v.add(bean2);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn( pstmt,con, rs);
		}
		
		
		return v;
		
		
	}//end of ticSelect
	
	
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
