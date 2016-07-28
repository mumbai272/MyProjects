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
			file="Options.jsp"%></c:if></c:if>
	<hr />
	<h3>${u.name}'s Profile</h3>
	<table>
		<tr>
			<td>Name:</td>
			<td>${u.name}</td>
		</tr>
		<tr>
			<td>Role:</td>
			<td>${u.role}</td>
		</tr>
		<tr>
			<td>EmailId:</td>
			<td>${u.emailId}</td>
		</tr>
		<tr>
			<td>Address:</td>
			<td>${u.address}</td>
		</tr>
		<tr>
			<td>Contact No:</td>
			<td>${u.phoneNo}</td>
		</tr>
	</table>
	<h3>Books Issued To ${u.name}</h3>
	<table border="1" class="mytable">
		
		<tr>
			<th>BookName</th>
			<th>Author</th>
			<th>Issued Date</th>
			<th>Return Date</th>
		</tr>
		<c:if test="${empty msg}">
		<c:forEach var="user" items="${issuedBooks}">

			<tr>				
				<td>${user.book.bname}</td>
				<td>${user.book.author}</td>
				<td>${user.issuedDate}</td>
				<td>${user.returnDate}</td>

			</tr>
		</c:forEach></c:if>
		<c:if test="${not empty msg}">
		<tr><td colspan="4">${msg}</td></tr></c:if>
	</table>

</body>
</html>