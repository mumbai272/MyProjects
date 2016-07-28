package dao;

import java.awt.print.Book;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import entity.Books;

public class BookDaoImpl implements BookDao {
@Autowired
private HibernateTemplate hibernateTemplate;
	@Override
	public List<Books> getAllBooks() {
		
		return (List<Books>) hibernateTemplate.loadAll(Books.class);
	}
	@Override
	public void addBooks(Books b) {
	hibernateTemplate.saveOrUpdate(b);		
	}
	@Override
	public Books getBookById(int bid) {
		String hql="from Books b where b.bid=:bid";
		
		return (Books) hibernateTemplate.findByNamedParam(hql, "bid", bid).get(0);
	}
	@Override
	public List<Books> searchBooks(String bname, String author) {
		String hql="from Books b where b.bname='"+bname+"' and b.author='"+author+"'";
		
		return hibernateTemplate.find(hql);
	}
	@Override
	public List<Books> searchBooks(String bname) {
		String hql="from Books b where b.bname='"+bname+"'";
		return hibernateTemplate.find(hql);
	}
	@Override
	public List<Books> searchBooksBy(String author) {
		String hql="from Books b where b.author='"+author+"'";
		return hibernateTemplate.find(hql);
	}

}
