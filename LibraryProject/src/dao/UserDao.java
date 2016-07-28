package dao;

import java.sql.SQLException;
import java.util.List;

import entity.BookRequest;
import entity.Books;
import entity.Users;
import entity.UsersBooks;

public interface UserDao {

	public Users getUser(String uname);

	public void addUser(Users u) throws SQLException;

	public void updateUser(Users u) throws SQLException;

	public boolean checkUser(Users u);

	public List<UsersBooks> getMyBooklist(String uname);

	public void requestBook(Users user, Books book);

	public List<BookRequest> getRequestList();

	public void addApprovals(UsersBooks ub);

	public List<UsersBooks> getissuedList();

	public void removeRequest(String uname, int bid);

	public List<Books> getMyBooks(String uname);

	public void removeBook(int bid, String uname);

}
