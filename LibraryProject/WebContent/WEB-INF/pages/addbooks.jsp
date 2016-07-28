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
<body><%@include file="header.jsp" %>
<c:if test="${not empty sessionScope.user }">

	<%@ include file="adminOptions.jsp"%>
		<hr />
	</c:if>

	
		<table align="center">
			<tr>
				<td><img alt="" src="images/11.jpg"></td>
				<td>

					<h1>
						<img alt="img" src="images/1.jpg" width="70" height="50" />Add
						Book details
					</h1> <form:form commandName="book" action="addBookToDb.do"
						method="post">
						<table>
							<tr>
								<td>Book name:</td>
								<td><form:input path="bname" />
								</td>
							</tr>
							<tr>
								<td>Author name:</td>
								<td><form:input path="author" />
								</td>
							</tr>
							<tr>
								<td>No of Books:</td>
								<td><form:input path="quantity" />
								</td>
							</tr>
						</table>
						<button type="submit">Add Book</button>
					</form:form></td>
			</tr>
		</table>
	
</body>
</html>