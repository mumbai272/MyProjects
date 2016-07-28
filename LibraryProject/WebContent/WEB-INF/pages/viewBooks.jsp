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
<c:if test="${not empty sessionScope.user }">	
	<c:if test="${sessionScope.user.role=='LibraryStaff'}">
		<%@ include file="adminOptions.jsp"%>
	</c:if>
	<c:if test="${sessionScope.user.role !='LibraryStaff'}"><%@ include
			file="Options.jsp"%></c:if>
	<hr /></c:if>
	<h1>List Of Books</h1>
	<table border="1" class="mytable">
		<tr>
			<th>BID</th>
			<th><a href="viewBooks.do?book=${book}">BOOK NAME</a></th>
			<th>AUTHOR</th>
			<th>NO OF BOOKS</th>
			<th>ACTION</th>
		</tr>
		<c:forEach items="${books}" var="bk">
			<c:if test="${bk.quantity != 0 }">
				<tr>
					<td>${bk.bid}</td>
					<td>${bk.bname}</td>
					<td>${bk.author}</td>
					<td>${bk.quantity}</td>
					<td><a href="login.do?bid=${bk.bid}" class="link">issue</a>
					</td>
				</tr>
			</c:if>

		</c:forEach>
	</table>
	<h5><a href="index.jsp"><img src="images/h1.jpg" />Home</a></h5>
</body>
</html>