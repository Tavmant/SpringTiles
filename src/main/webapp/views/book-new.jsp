<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="java.util.List"%>
<%@ page import="ua.lviv.lgs.domain.Author"%>

<div align="center" class="container">
	<div class="col-sm-offset-3 col-sm-6 jumbotron">
		<form class="form-horizontal" action="addBookHome" method="POST">
			<div class="form-group">
				<h2>New Book</h2>
			</div>
			<div class="form-group">
				<label for="inputTitle" class="col-sm-2 control-label">Title</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="title">
				</div>
			</div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<div class="form-group">
					<label for="inputAuthor" class="col-sm-2 control-label">Author</label>
					<div class="col-sm-8">
						<select name="authorId" class="form-control">
							<jstl:forEach items="${authors}" var="author">
								<option value="${author.getId()}">${author.getName()}</option>
							</jstl:forEach>
						</select>
					</div>
				</div>
			</sec:authorize>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-2">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>