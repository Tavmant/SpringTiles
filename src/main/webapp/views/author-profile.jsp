<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ page import="java.util.List"%>
<%@ page import="ua.lviv.lgs.domain.Author"%>
<%@ page import="ua.lviv.lgs.domain.Book"%>

<div align="center" class="row">
	<div class="col-sm-offset-4 col-sm-2">
		<img src="${author.getFace()}" alt="" width="120" height="150">
	</div>

	<div class="col-sm-2">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><jstl:out value="${author.getName()}"></jstl:out></th>
					<th><jstl:out value="${author.getAge()}"></jstl:out></th>
				</tr>
			</tbody>
		</table>

		<h4>Mini-Biography</h4>
		<p>
			<jstl:out value="${author.getBiography()}"></jstl:out>
		</p>
	</div>
</div>

<div align="center" class="row">
	<h3>Books written by the author</h3>
	<div class="col-sm-offset-5 col-sm-2">
		<table class="table">
			<jstl:forEach items="${author.getBooks()}" var="book">
				<tr>
					<th><span class="glyphicon glyphicon-book" aria-hidden="true"></span></th>
					<th><jstl:out value="${book.getTitle()}"></jstl:out></th>
				</tr>
			</jstl:forEach>
		</table>
	</div>
</div>