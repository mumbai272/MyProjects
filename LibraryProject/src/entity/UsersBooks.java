package entity;

import java.io.Serializable;
import java.util.Date;

public class UsersBooks implements Serializable {
private Users user;
private Books book;
private Date issuedDate;
private Date returnDate;
private int penalty;

public UsersBooks() {
}

public int getPenalty() {
	return penalty;
}

public void setPenalty(int penalty) {
	this.penalty = penalty;
}

public Users getUser() {
	return user;
}
public void setUser(Users user) {
	this.user = user;
}
public Books getBook() {
	return book;
}
public void setBook(Books book) {
	this.book = book;
}
public Date getIssuedDate() {
	return issuedDate;
}
public void setIssuedDate(Date issuedDate) {
	this.issuedDate = issuedDate;
}
public Date getReturnDate() {
	return returnDate;
}
public void setReturnDate(Date returnDate) {
	this.returnDate = returnDate;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((book == null) ? 0 : book.hashCode());
	result = prime * result
			+ ((issuedDate == null) ? 0 : issuedDate.hashCode());
	result = prime * result + penalty;
	result = prime * result
			+ ((returnDate == null) ? 0 : returnDate.hashCode());
	result = prime * result + ((user == null) ? 0 : user.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	UsersBooks other = (UsersBooks) obj;
	if (book == null) {
		if (other.book != null)
			return false;
	} else if (!book.equals(other.book))
		return false;
	if (issuedDate == null) {
		if (other.issuedDate != null)
			return false;
	} else if (!issuedDate.equals(other.issuedDate))
		return false;
	if (penalty != other.penalty)
		return false;
	if (returnDate == null) {
		if (other.returnDate != null)
			return false;
	} else if (!returnDate.equals(other.returnDate))
		return false;
	if (user == null) {
		if (other.user != null)
			return false;
	} else if (!user.equals(other.user))
		return false;
	return true;
}


}
