package dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import entity.BookRequest;
import entity.Books;
import entity.Users;
import entity.UsersBooks;

public class UserDaoImpl implements UserDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addUser(Users u) throws SQLException {
		hibernateTemplate.save(u);

	}

	@Override
	public boolean checkUser(Users u) {
		String hql = "from Users a where a.uname='" + u.getUname()
				+ "' and a.pwd='" + u.getPwd() + "'";
		if (hibernateTemplate.find(hql).isEmpty())
			return false;
		else
			return true;
	}

	@Override
	public List<UsersBooks> getMyBooklist(final String uname) {
		String sql = " from UsersBooks u where u.user.uname='"
				+ uname + "'";
		return (List<UsersBooks>) hibernateTemplate.find(sql);

	}

	// @Override
	// public void removeBook(final int bid, final String uname) {
	// Users users = hibernateTemplate.get(Users.class, uname);
	// Books books = hibernateTemplate.get(Books.class, bid);
	// users.getBooks().remove(books);
	// hibernateTemplate.saveOrUpdate(users);
	// }
	@Override
	public void updateUser(Users u) throws SQLException {
		hibernateTemplate.update(u);

	}

	@Override
	public Users getUser(String uname) {
		return hibernateTemplate.get(Users.class, uname);
	}

	@Override
	public List<UsersBooks> getissuedList() {

		return hibernateTemplate.find("from UsersBooks");
	}

	@Override
	public void requestBook(Users user,Books book) {
		BookRequest br=new BookRequest();
		br.setBook(book);
		br.setUser(user);
		br.setRequestedDate(new Date());
		hibernateTemplate.save(br);
		
	}

	@Override
	public List<BookRequest> getRequestList() {
	
		return hibernateTemplate.loadAll(BookRequest.class);
	}

	@Override
	public void addApprovals(UsersBooks ub) {
		hibernateTemplate.save(ub);
		
	}

	@Override
	public void removeRequest(String uname,int bid) {
		
		hibernateTemplate.delete(hibernateTemplate.find("from BookRequest b where b.book.bid="+bid+" and b.user.uname='"+uname+"'").get(0));
		
	}

	@Override
	public List<Books> getMyBooks(String uname) {
		String sql = " select u.book from UsersBooks u where u.user.uname='"
				+ uname + "'";
		return (List<Books>) hibernateTemplate.find(sql);
	}

	@Override
	public void removeBook(int bid, String uname) {
		hibernateTemplate.delete(hibernateTemplate.find("from UsersBooks b where b.book.bid="+bid+" and b.user.uname='"+uname+"'").get(0));
		
	}
}
