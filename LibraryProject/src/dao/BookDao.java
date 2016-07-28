package dao;

import java.awt.print.Book;
import java.util.List;

import entity.Books;

public interface BookDao {
public List<Books> getAllBooks();
public void addBooks(Books b);
public Books getBookById(int bid);
public List<Books> searchBooks(String bname,String author);
public List<Books> searchBooks(String bname);
public List<Books> searchBooksBy(String author);
} 