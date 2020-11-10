<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>



<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
</head>
<body>


	<!--Nav Bar -->
	<%@ include file="normal_navbar.jsp"%>

	<main class="primary-background benner-background"
		style="padding-bottom: 82px; padding-top: 30px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span> <br> Register
						Here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label>
								<div class="row">
									<div class="col">
										<input name="f_name" type="text" class="form-control"
											placeholder="First name">
									</div>
									<div class="col">
										<input name="l_name" type="text" class="form-control"
											placeholder="Last name">
									</div>
								</div>
							</div>



							<div class="form-group ">
								<label class="control-label " for="date"> Date of Birth
								</label>
								<div class="input-group">

									<span class="input-group-addon"> <span
										class="fa fa-calendar" style="font-size: 32px"></span>
									</span> <input name="dob" class="form-control" id="date"
										placeholder="DD/MM/YYYY" type="text">
								</div>
							</div>




							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="u_email" type="email" class="form-control"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small class="text-muted">We'll never share your email
									with anyone else.</small>

							</div>




							<div class="form-group is-valid">
								<label for="inputPassword">Password</label> <input name="u_pass"
									type="password" id="inputPassword6" class="form-control"
									aria-describedby="passwordHelpInline" placeholder="Password">
								<small id="passwordHelpInline" class="form-text text-muted">
									Your password must be 8-20 characters long, contain letters and
									numbers, and must not contain spaces, special characters, or
									emoji. </small>
							</div>

							<div class="form-group">
								<label for="gender">Gender</label> <br> <input type="radio"
									id="m_gender" name="gender" value="male"> Male <input
									type="radio" id="f_gender" name="gender" value="female">
								Female

							</div>
							<div class="form-group">

								<textarea name="about" class="form-control" rows="2"
									placeholder="Enter something about yourself"></textarea>


							</div>


							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I agree to the tech blog's Terms of
									Service and Privacy Policy.</label>
							</div>

							<br>
							<div class="conteiner text-center" id="loader"
								style="display: none">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please Wait...</h4>
							</div>

							<button id="submit-btn" type="submit"
								class="btn primary-background text-white">Submit</button>

						</form>

					</div>

				</div>
			</div>
		</div>
	</main>







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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous"></script>
	">
	<script>

		$(document).ready(
				function() {
					var date_input = $('input[name="dob"]'); //our date input has the name "dob"
					var container = $('.bootstrap-iso form').length > 0 ? $(
							'.bootstrap-iso form').parent() : "body";
					date_input.datepicker({
						format : 'dd/mm/yyyy',
						container : container,
						todayHighlight : true,
						autoclose : true,
					})
				})
	</script>
	<script>
	  $(document).ready(function (){
		  console.log("loaded...")
		  $('#reg-form').on('submit',function(event){
			 event.preventDefault();
			 
			 
			 let form=new FormData(this);
			 
			 $("#submit-btn").hide();
			 $("#loader").show();
			 
			 //send register servlet...
			 $.ajax({
				 url: "RegisterServlet",
				 type: 'POST',
				 data: form,
				 success: function (data, taxtStatus, jqxHR){
					 console.log(data)
					 
					 
					 $("#submit-btn").show();
					 $("#loader").hide();
					 
					 if (data.trim()==='done')
					 {	 
					 swal("Register Successefully... We are going to redirect to login page")
					 .then((value) = {
					   window.location="login_page.jsp"
					 });
					 }
					 else
					 {
						 swal(data);
					 }
						 
				 },
				 error: function (jqxHR, taxtStatus, errorThrown ){
					 $("#submit-btn").show();
					 $("#loader").hide();
					 swal("Somthing Went Wrong.Try Again");
					
				 },
				 processData:false,
				 contentType:false
			 
			 
			 
			 
			 });
		  });
	  });
	</script>
</body>
</html>