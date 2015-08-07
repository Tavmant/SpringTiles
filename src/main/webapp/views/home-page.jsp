<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home Page</title>
</head>
<body>
	<div align="center" class="container">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="list-group">
				<h3>
					<a href="" class="list-group-item disabled">Make your choice</a>
				</h3>
				<a href="showAllAuthors" class="list-group-item">Show All Authors</a>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<a href="createAuthor" class="list-group-item">Create Author</a>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_AUTHOR')">
					<a href="removeAuthor" class="list-group-item">Remove Author</a>
					<a href="addBook" class="list-group-item">Add Book</a>
					<a href="removeBook" class="list-group-item">Remove Book</a>
				</sec:authorize>
			</div>
		</div>
	</div>
</body>
</html>