<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<%@include file="header.jsp" %>
	
	<c:if test="${sessionScope.user.role=='LibraryStaff'}">
		<%@ include file="adminOptions.jsp"%>
	</c:if>
	<c:if test="${sessionScope.user.role !='LibraryStaff'}">
	<%@ include file="Options.jsp"%></c:if>
	
	<hr />
	<h1>Issued Books</h1>
	<table border="1" class="mytable">
		<tr>
			
			<th>BOOK NAME</th>
			<th>AUTHOR</th>
			<th>Issued Date</th>
			<th>Return Date</th>
			<th>ACTION</th>

		</tr>
		<c:forEach items="${booklist}" var="bk">		
			<tr>
				
				<td>${bk.book.bname}</td>
				<td>${bk.book.author}</td>
				<td>${bk.issuedDate}</td>
				<td>${bk.returnDate}</td>
				<td><a href="return.do?bid=${bk.book.bid}" class="link">Return</a>
				</td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>