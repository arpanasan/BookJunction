package com.DAO;

import java.util.List;

import com.entity.Book_order;

public interface BookOrderDAO {
//public int getOrderNo();
public boolean saveOrder(List<Book_order> b);
public List<Book_order> getBook(String email);
public List<Book_order> getAllOrder();

}
