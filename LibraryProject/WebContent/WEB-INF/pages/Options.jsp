<h4>Welcome, <a href="details.do?uname=${sessionScope.user.uname}">${sessionScope.user.name}</a></h4>
<table class="mytable2" style="background-color: appworkspace; " >
	<tr>
		<td ><button onclick="window.location.href='getmyBookList.do'" class="button">My Book List</button></td>
		<td><button onclick="window.location.href='viewBooks.do?book=0'"class="button">View Books</button></td>
        <td><button onclick="window.location.href='search.do'"class="button">Search Books</button></td>
		<td><button onclick="window.location.href='logout.do'"class="button">Logout</button></td>

	</tr>
</table>