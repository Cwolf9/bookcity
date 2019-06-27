package com.demo.service;

import com.demo.model.Book;

import java.util.List;

public interface DataService {
    public void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum,String bowner,String book);
    public void changeImg(String book);
    List<Book> findAllBooks();
    void removeBookById(int id);
    void saveBI(String book, String img);
}
