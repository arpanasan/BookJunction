package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;
import com.mysql.cj.protocol.Resultset;

public class UserDAOImp implements UserDAO {


	public user login(String email, String password) {
		user us=null;
		try {
			String sql="select * from  user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				us=new user();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setStste(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	private Connection con;

	public UserDAOImp(Connection con) {
		super();
		this.con = con;
	}

	public boolean userRegister(user us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
	public boolean checkPassword(int id,String ps) {
		boolean f = false;
		try {
			String sql = "select *  from user where id=? and password=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setInt(1, id);
			p.setString(2, ps);
		

			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean updateProfile(user us) {
		boolean f = false;
		try {
			String sql = "update user set name=?,email=? ,phno=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean checkuser(String email) {
		boolean f = true;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
