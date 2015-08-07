<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<div align="center" class="container">
	<div class="col-sm-offset-4 col-sm-4">
		<table>
			<thead>
				<tr>
					<th><a href="" class="list-group-item disabled"><h4>Name</h4></a></th>
					<th><a href="" class="list-group-item disabled"><h4>Age</h4></a></th>
					<th><a href="" class="list-group-item disabled"><h4>Books</h4></a></th>
				</tr>
			</thead>
			<tbody>
				<jstl:forEach items="${authors}" var="author">
					<tr>
						<th><a href="authorProfile?authorId=${author.getId()}"
							class="list-group-item">${author.name}</a></th>
						<th><a href="authorProfile?authorId=${author.getId()}"
							class="list-group-item">${author.age}</a></th>
						<th>
							<div class="dropdown">
								<button style="width: 85px; height: 42px"
									class="btn btn-default dropdown-toggle" type="button"
									id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="true">
									<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
									<jstl:forEach items="${author.getBooks()}" var="book">
										<li class="disabled"><a href="">${book.getTitle()}</a></li>
									</jstl:forEach>
								</ul>
							</div>
						</th>
					</tr>
				</jstl:forEach>
			</tbody>
		</table>
	</div>
</div>