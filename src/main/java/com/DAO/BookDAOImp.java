package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.book;

public class BookDAOImp implements BookDAO {

	private Connection con;

	public BookDAOImp(Connection con) {
		super();
		this.con = con;
	}

	public boolean addBooks(book b) {
		boolean f = false;
		try {
			String sq = "insert into  book_details(bookname,author,price,bookCategory,status,photo,user_email) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sq);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUser_email());

			int rs = ps.executeUpdate();
			if (rs == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<book> getAllBooks() {
		List<book> list = new ArrayList<book>();
		book b = null;
		try {
			String sql = "select * from book_details ";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public book getBookById(int id) {
		book b1 = null;
		try {
			String sql = "select * from book_details where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b1 = new book();
				b1.setBookId(rs.getInt(1));
				b1.setBookname(rs.getString(2));
				b1.setAuthor(rs.getString(3));
				b1.setPrice(rs.getString(4));
				b1.setBookCategory(rs.getString(5));
				b1.setStatus(rs.getString(6));
				b1.setPhoto(rs.getString(7));
				b1.setUser_email(rs.getString(8));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b1;
	}

	public boolean updateEditBooks(book b) {
		boolean f = false;
		try {
			String sql = "update  book_details set bookname=?,author=?,price=?,status=? where bookId=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<book> getNewBook() {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where bookCategory=? and status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<book> getRecentBook() {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where  status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<book> getOldBook() {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where bookCategory=? and status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<book> getAllNewBook() {

		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where bookCategory=? and status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<book> getAllRecentBook() {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where  status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<book> getAllOldBook() {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where bookCategory=? and status=?  order by bookId desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public List<book> getBookByOld(String email, String cat) {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where  bookCategory=?and user_email=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public boolean oldBookDelete(String email, String cat,int id) {
		boolean f = false;
		try {
			String sql = "delete from book_details where  bookCategory=?and user_email=? and bookId=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	public List<book> getBookBySearch(String ch) {
		List<book> list = new ArrayList<book>();
		book b = null;

		try {
			String sql = "select * from book_details  where  bookname  like ? or  author like ? or bookCategory like ? and status=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new book();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
