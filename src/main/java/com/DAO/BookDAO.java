package com.DAO;

import java.util.List;

import com.entity.book;

public interface BookDAO {
  public boolean addBooks(book b);
  public List<book> getAllBooks();
  public book getBookById(int id);
  public boolean updateEditBooks(book b);
  public boolean deleteBooks(int id);
  public List<book> getNewBook();
  public List<book> getRecentBook();
  public List<book> getOldBook();
  public List<book> getAllNewBook();
  public List<book> getAllRecentBook();
  public List<book> getAllOldBook();
  public List<book> getBookByOld(String email,String cat);
  public boolean oldBookDelete(String email,String cat,int id);
  public List<book> getBookBySearch(String ch);
}
