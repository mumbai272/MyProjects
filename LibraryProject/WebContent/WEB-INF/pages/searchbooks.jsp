<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>book details</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body><%@include file="header.jsp"%>
	<c:if test="${not empty sessionScope.user }">
	
		<c:if test="${sessionScope.user.role=='LibraryStaff'}">
			<%@ include file="adminOptions.jsp"%>
		</c:if>
		<c:if test="${sessionScope.user.role !='LibraryStaff'}"><%@ include
				file="Options.jsp"%></c:if>
		<hr />
	</c:if>


	<table align="center">
		<tr>
			<td><img alt="" src="images/3i.png"></td>
			<td>

				<h1>
					<img alt="img" src="images/1.jpg" width="70" height="50" />Search
					Book
				</h1>
				<form action="searchBooks.do" method="post">
					<table>
						<tr>
							<td>Book name:</td>
							<td><input type="text" name="bname" />
							</td>
						</tr>
						<tr>
							<td>Author name:</td>
							<td><input type="text" name="author" />
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="search" />
							</td>
						</tr>
					</table>
				</form></td>

		</tr>
	</table>

</body>
</html>