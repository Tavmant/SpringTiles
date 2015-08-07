<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>

<link
	href='<jstl:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css" />'
	rel="stylesheet">
<link
	href='<jstl:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />'
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src='<jstl:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.min.js" />'></script>

<body>
	<div class="container" style="width: 300px;">
		<jstl:url value="/j_spring_security_check" var="loginUrl" />
		<form action="${loginUrl}" method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			
			<div class="form-group">
				<label for="inputUserName" class="control-label">Username</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="j_username">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="control-label">Password</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="j_password">
				</div>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">LogIn</button>
		</form>
	</div>
</body>
</html>