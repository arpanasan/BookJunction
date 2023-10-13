package com.DB;

import java.sql.*;

public class DbConnect {
  private static  Connection con;
  public static Connection getConnection() {
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
	        String path="jdbc:mysql://localhost:3308/ebook";
	        String user="root";
	        String password="Sanyal";
	        con= DriverManager.getConnection(path,user,password);
		  
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return con;
  }
}
