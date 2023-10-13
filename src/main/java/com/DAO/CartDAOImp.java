package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImp implements CartDAO{
	

	
	private Connection con;
	public CartDAOImp(Connection con) {
		this.con=con;
	}

	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sq = "insert into  cart(bid,uid,book_name,author,price,total_price) values (?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sq);
			ps.setInt(1,c.getBid());
			ps.setInt(2,c.getUid());
			ps.setString(3,c.getBook_name());
			ps.setString(4,c.getAuthor());
			ps.setDouble(5,c.getPrice());
			ps.setDouble(6,c.getTotal_price());
			

			int rs = ps.executeUpdate();
			if (rs == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<Cart> getBookByUser(int userId) {
		Cart c=null;
		List<Cart> list=new ArrayList<Cart>();
		double total_price=0;
		try {
			String sq = "select * from cart where uid=?";
			PreparedStatement ps=con.prepareStatement(sq);
		   ps.setInt(1, userId);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   c=new Cart();
			   c.setCid(rs.getInt(1));
			   c.setBid(rs.getInt(2));
			   c.setUid(rs.getInt(3));
			   c.setBook_name(rs.getString(4));
			   c.setAuthor(rs.getString(5));
			   c.setPrice(rs.getDouble(6));
			   
			   total_price=total_price+rs.getDouble(7);
			   c.setTotal_price(total_price);
			   
			   list.add(c);
		   }
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean f=false;
		try {
			String sq = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps=con.prepareStatement(sq);
			ps.setInt(1,bid);
			ps.setInt(2,uid);
			ps.setInt(3, cid);
		    int rs = ps.executeUpdate();
			if (rs == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
