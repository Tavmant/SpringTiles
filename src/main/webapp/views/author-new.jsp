<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div align="center" class="container">
	<div class="col-sm-offset-2 col-sm-8 jumbotron">
		<div class="form-group">
			<h2>New Author</h2>
		</div>
		<form class="form-horizontal" action="createAuthorHome" method="POST">
			<div class="form-group">
				<label for="inputName" class="col-sm-3 control-label">Name</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="name">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAge" class="col-sm-3 control-label">Age</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="age">
				</div>
			</div>
			<div class="form-group">
				<label for="inputFace" class="col-sm-3 control-label">Photot
					URL</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="face">
				</div>
			</div>
			<div class="form-group">
				<label for="inputBiography" class="col-sm-3 control-label">Biography</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="3" maxlength="100"
						name="biography"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>