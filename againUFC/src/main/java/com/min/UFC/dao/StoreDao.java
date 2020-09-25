package com.min.UFC.dao;
/*
package com.min.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import project.min.dto.MypageCart;
import project.min.dto.Product;
import project.min.dto.StoreBean;


public class StoreDao {
	
	DataSource ds;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int result = 0;
	
	public StoreDao(){
		
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
	
	
	public Vector<Product> productTopAllData(){ //top 테이블 가져오기
		Vector<Product> v = new Vector<Product>();
		
		String sql = "select * from top";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product bean = new Product();
				
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
				
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
	
	public Vector<Product> productPantsAllData(){
		Vector<Product> v = new Vector<Product>();
		
		String sql = "select * from pants";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product bean = new Product();
				
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
				
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
	
	public Vector<Product> productCapAllData(){
		Vector<Product> v = new Vector<Product>();
		
		String sql = "select * from cap";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product bean = new Product();
				
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
				
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
	
	public Vector<StoreBean> cartAlldata(String id){
		Vector<StoreBean> v = new Vector<StoreBean>();
		
		String sql = "select * from cart where id=?";
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				StoreBean bean = new StoreBean();
				
				bean.setIdx(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setP_name(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setCount(rs.getInt(5));
				bean.setDup(rs.getString(6));
				
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
	
	public int cartInsert(Product bean, String name) { //카트테이블에 값담기 (카트 장바구니에 넣을때)
		
		String sql = "insert into cart value(null,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getPrice());
			pstmt.setInt(4, bean.getCount());
			pstmt.setString(5, name+"A"+bean.getName());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con);
		}
			
		return result;
	}
	
	public int mypageCart(String id, String name, int price, int count, String dup) { //마이페이지카트테이블 (마이페이지에 상품넣을때)
		
		String sql = "insert into mypageCart values(null,?,?,?,?,?,now())";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setInt(4, count);
			pstmt.setString(5, dup);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			freeConn(pstmt,con);
		}
			
		return result;
	}
	
	public Product topSearch(String id) { //탑테이블에 상품이름을 가져와서 찾는다 (탑jsp에 상품올릴때)
		String sql = "select * from top where name=?";
		Product bean = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Product();
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			freeConn(pstmt, con, rs);
		}
		return bean;
	}
	
	public Product pantsSearch(String id) {
		String sql = "select * from pants where name=?";
		Product bean = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new Product();
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			freeConn(pstmt, con, rs);
		}
		return bean;
	}
	
	public Product capSearch(String id) {
		String sql = "select * from cap where name=?";
		Product bean = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				bean = new Product();
				bean.setIdx(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setCount(rs.getInt(4));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			freeConn(pstmt, con, rs);
		}
		return bean;
	}
	
	public int updateProductCount(String count, String name){ //상품아이디가져와서 그상품에 카운트(상품갯수)증가
		String sql = "update cart set p_count=? WHERE p_name=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, count);
			pstmt.setString(2, name);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeConn(pstmt,con);
		}
		
		return result;
	}
	
	public int deletePaymentDetails(String name){ //카트아이디에담긴 상품들 삭제(결제할때)
		String sql = "DELETE FROM cart WHERE id=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			freeConn(pstmt,con);
		}
		
		return result;
	}
	
	public int deleteProduct(String name){ // 카트상품 삭제 (장바구니삭제)
		String sql = "DELETE FROM cart WHERE p_name=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			freeConn(pstmt,con);
		}
		
		return result;
	}
	
	public Vector<MypageCart> buyAlldata(String id){
		Vector<MypageCart> v = new Vector<MypageCart>();
		
		String sql = "select * from mypagecart where id=?";
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MypageCart bean = new MypageCart();
				bean.setIdx(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setP_name(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setCount(rs.getInt(5));
				bean.setP_date(rs.getDate(7));
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