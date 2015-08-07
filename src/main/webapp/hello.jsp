<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcom</title>
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
	<div align="center" class="container">
		<div class="col-sm-offset-2 col-sm-8 jumbotron">
			<h1>Welcom to library</h1>
			<p class="lead">
				Welcome to the library of Logos.<br />All materials used on this
				website are sick fantasy.<br />Do not try to recreate it at home.
			</p>
			<p>
				<a class="btn btn-lg btn-success" href="home" role="button">Sign in</a>
			</p>
		</div>
	</div>
</body>
</html>