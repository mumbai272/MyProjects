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
	
	<%@ include file="adminOptions.jsp" %>
	<hr /></c:if>
	<h1>List Of Request For Books</h1>
	<table border="1" class="mytable">
		<tr><th>User</th>
			<th>BOOK NAME</th>
			<th>AUTHOR</th>
			<th>NO OF BOOKS</th>
			<th>ACTION</th>
		</tr>
		<c:forEach items="${requestList}" var="br">
			
				<tr>
					<td><a href="details.do?uname=${br.user.uname}">${br.user.name}</a></td>
					<td>${br.book.bname}</td>
					<td>${br.book.author}</td>
					<td>${br.book.quantity}</td>
					<td><a href="approve.do?uname=${br.user.uname}&book=${br.book.bid}" class="link">issue</a>
					</td>
				</tr>
		

		</c:forEach>
	</table>
</body>
</html>