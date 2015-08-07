<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<nav id="mainNav" class="navbar navbar-default navbar-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<h2	style="font-style: oblique; font-family: monospace; font-weight: bold">
				Library of Logos</h2>
		</div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><h5 class="col-md-1"><sec:authentication property="name" /></h5></li>
				<li><h5 class="col-md-1"><sec:authentication property="authorities" /></h5></li>
				<li><h5 class="col-md-1"><a href="logout">LogOut</a></h5></li>
			</ul>
		</div>
	</div>
</nav>