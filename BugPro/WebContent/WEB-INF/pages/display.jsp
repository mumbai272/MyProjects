<%@page import="com.mindtree.entity.Employee"%>
<%@page import="com.mindtree.entity.Bugs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unresolved Bugs</title>
</head>
<body>
	<h3>Unresolved Bugs</h3><br/>
	<br />
	<table border="1">
		<tr>
			<th>BId</th>
			<th>BugDescription</th>
			<th>ReportedDate</th>
			<th>ReportedBy</th>
			<th>Action</th>
		</tr>
		<%List<Object[]> list=(List<Object[]>)request.getAttribute("unresolveBug");
		for(int i=0;i<list.size();i++){
		Object[] obj=list.get(i);
		Bugs b=(Bugs)obj[0];
		Employee e=(Employee)obj[1];%>
		<tr>
			<td><%=b.getBugId() %></td>
			<td><%=b.getBugDesc() %></td>
			<td><%=b.getReportedDate() %></td>
			<td><%=e.getName()%></td>
			<td><a href='resolveBug.view?id=<%=b.getBugId()%>'>Resolve</a></td>
		</tr>


		<% }%>
	</table><br/>
	<a href="index.jsp">Home</a>

</body>
</html>