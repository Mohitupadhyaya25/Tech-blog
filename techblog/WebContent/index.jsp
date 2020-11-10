<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>



<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>




	<!--Nav Bar -->
	<%@ include file="normal_navbar.jsp"%>

	<!--//BANNER  -->
	<div class="container-fluid p-0 m-0 benner-background ">

		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3>
					<span class="fa fa-connectdevelop"></span>Tech Blog
				</h3>
				<h3 class="display-3">Welcome, Friends</h3>
				<p>Welcome to our World of Technology.</p>
				<p>A programming language is a formal language comprising a set
					of instructions that produce various kinds of output. Programming
					languages are used in computer programming to implement algorithms.
				</p>

				<button class="btn btn-outline-light">
					<span class="fa fa-arrow-circle-right"></span> Start ! it's Free
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light"> <span
					class="	fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>


	</div>



	<!-- // Cards -->
	<div class="container">

		<div class="row mb-2">


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-2">


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More..</a>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Javascripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js"></script>
</html>