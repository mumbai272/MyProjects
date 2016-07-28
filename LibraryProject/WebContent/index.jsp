<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript">
 	function task() { 
 		document.getElementById("img").innerHTML = '<img src="images/002.jpg" >'; 
	} 
 	function task1() { 
		document.getElementById("img").innerHTML = '<img src="images/2i.jpg" >';
 	} 
	function task2() { 
 		document.getElementById("img").innerHTML = '<img src="images/i1.jpg" >';
	} 
//  	function task3() { 
// 		document.getElementById("img").innerHTML = '<img src="images/03.jpg" >'; 
// 	} 
 </script> 
</head>
<body>
	<%@include file="WEB-INF/pages/header.jsp"%>
	<table cellspacing="10">
		<tr>
			<td><a href="viewBooks.do?book=0" onmouseover="task()">View Books</a></td>
			<td rowspan="10"><div id="img"><img src="images/001.jpg"></div>
			</td>
		</tr>
		<tr>
			<td><a href="search.do" onmouseover="task1()">Search Books</a>
			</td>
		</tr>
		<tr>
			<td><a href="initLogin.do" onmouseover="task2()">Login</a>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td><a href="issued.do" onmouseover="task3()">Issued Books</a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
</body>
</html>

