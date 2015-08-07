<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="java.util.List"%>
<%@ page import="ua.lviv.lgs.domain.Book"%>

<div align="center" class="container">
	<div class="col-sm-offset-4 col-sm-4 jumbotron">
		<form class="form-horizontal" action="removeBookHome">
			<div class="form-group">
				<h2>Remove Book</h2>
			</div>
			<div class="form-group">
				<h4>Select book for removing:</h4>
			</div>
			<div class="form-group">
				<select name="bookId" class="form-control">
				<sec:authorize access="hasAnyRole('ROLE_AUTHOR')">
					<jstl:forEach items="${authorBooks}" var="authorBook">
						<option value="${authorBook.getId()}">${authorBook.getTitle()}</option>
					</jstl:forEach>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<jstl:forEach items="${books}" var="book">
						<option value="${book.getId()}">${book.getTitle()}</option>
					</jstl:forEach>
				</sec:authorize>	
				</select>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-2">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>