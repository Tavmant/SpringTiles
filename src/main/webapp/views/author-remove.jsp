<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page import="java.util.List"%>
<%@ page import="ua.lviv.lgs.domain.Author"%>

<div align="center" class="container">
	<div class="col-sm-offset-4 col-sm-4 jumbotron">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<form class="form-horizontal" action="removeAuthorHome">
				<div class="form-group">
					<h2>Remove Author</h2>
				</div>
				<div class="form-group">
					<h4>Select author for removing:</h4>
				</div>
				<div class="form-group">
					<select name="authorId" class="form-control">
						<jstl:forEach items="${authors}" var="author">
							<option value="${author.getId()}">${author.getName()}</option>
						</jstl:forEach>
					</select>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-2">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
			</form>
		</sec:authorize>

		<sec:authorize access="hasAnyRole('ROLE_AUTHOR')">
			<form class="form-horizontal" action="logout">

				<div class="form-group">
					<h4>
						"<sec:authentication property="name" />"
						you realy want to delete your profile?:
					</h4>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-1">
						<div class="col-sm-6">
							<button type="submit" class="btn btn-default btn-lg active">Yes</button>
						</div>
						<div class="col-sm-2">
							<a href="home" class="btn btn-default btn-lg active"
								role="button">No</a>
						</div>
					</div>
				</div>
			</form>
		</sec:authorize>
	</div>
</div>