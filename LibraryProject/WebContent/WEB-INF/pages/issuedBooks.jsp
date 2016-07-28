<%@page import="entity.UsersBooks"%>
<%@page import="entity.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<%@include file="header.jsp"%>
	<c:if test="${not empty sessionScope.user }">
	
		<c:if test="${sessionScope.user.role=='LibraryStaff'}">
		<%@ include file="adminOptions.jsp"%>
	</c:if>
	<c:if test="${sessionScope.user.role !='LibraryStaff'}"><%@ include
			file="Options.jsp"%></c:if>
		<hr />
	</c:if>
	<h1>
		List Of Issued Books<img src="images/2.jpg" width="100">
	</h1>

	<table border="1" class="mytable">
		<tr>
			<th rowspan="2">User Name</th>

			<th colspan="4">Book Details</th>
		</tr>
		<tr>
			<th>BookName</th>
			<th>Author</th>
			<th>Issued Date</th>
			<th>Return Date</th>
		</tr>
		<c:forEach var="user" items="${issuedBooks}">

			<tr>
				<td><a href="details.do?uname=${user.user.uname}">${user.user.name}</a></td>
				<td>${user.book.bname}</td>
				<td>${user.book.author}</td>
				<td>${user.issuedDate}</td>
				<td>${user.returnDate}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>