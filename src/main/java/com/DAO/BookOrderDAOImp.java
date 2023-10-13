package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_order;
import com.entity.book;

public class BookOrderDAOImp implements BookOrderDAO {


	private Connection con;

	public BookOrderDAOImp(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveOrder(List<Book_order> blist) {
		boolean f = false;
		try {
			String sq = "insert into  book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?)";
			con.setAutoCommit(false);

			PreparedStatement ps = con.prepareStatement(sq);
			for (Book_order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladdress());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			con.commit();
			f = true;
			con.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Book_order> getBook(String email) {
		List<Book_order> list = new ArrayList<Book_order>();
		Book_order b = null;
		try {
			String sql = "select * from book_order where email=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book_order();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setPhno(rs.getString(5));
				b.setFulladdress(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<Book_order> getAllOrder(){
		List<Book_order> list = new ArrayList<Book_order>();
		Book_order b = null;
		try {
			String sql = "select * from book_order  ";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book_order();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setPhno(rs.getString(5));
				b.setFulladdress(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	}

