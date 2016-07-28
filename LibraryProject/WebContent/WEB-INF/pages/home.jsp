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
	<h1>Home page</h1>

	<c:if test="${sessionScope.user.role=='LibraryStaff'}">
		<%@ include file="adminOptions.jsp"%>
	</c:if>
	<c:if test="${sessionScope.user.role !='LibraryStaff'}"><%@ include
			file="Options.jsp"%></c:if>

	<hr />
	<c:if test="${sessionScope.bid != null && requestScope.emsg1==null}">
		<h4>Book Details</h4>
Book Name : ${sessionScope.book.bname}<br />
Author : ${sessionScope.book.author}<br />
		<button onclick="window.location.href='addToMyList.do'"
			style="background-attachment: fixed; border-color: gray;">Add
			to My List</button>
		<br />
	</c:if>
	<c:if test="${requestScope.emsg1!=null }">${requestScope.emsg1}</c:if>

</body>
</html>