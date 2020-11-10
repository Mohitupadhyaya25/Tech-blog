<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp"%>
<%@ page import="com.tech.blog.entities.*"%>
<%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>




<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css">

</head>
<body>
	<!--  NavBar-->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-connectdevelop"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-meetup"></span>Learn Code With Mohit <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="	fa fa-bullhorn"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Learn Data Structure</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book-o"></span> Contacts</a></li>

				</li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-model"><span
						class="fa fa-podcast"></span> Do Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right ">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-model"><span
						class="fa fa-user-circle"></span> <%=user.getFirst_name()%> <%=user.getLast_name()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-sign-out"></span> Log Out </a></li>

			</ul>
		</div>
	</nav>


	<!-- end of NavBar -->

	<%
		Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>

	</div>

	<%
		session.removeAttribute("msg");
	}
	%>



	<!--main boby of page  -->
	<main>
		<div class="container">
			<div class="row mt-4">

				<!--  first col -->
				<div class="col-md-4">
					<!-- categories -->

					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">
							ALL POSTS </a>
						<!-- Categories -->
						<% 
						   PostDao d =new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1=d.getAllCategories();
						for(Category cc:list1)
						{
							%>
						<a href="#" class="list-group-item list-group-item-action"><%= cc.getName() %></a>
						<% 
							
						}
						%>


					</div>


				</div>

				<!--  second col -->
				<div class="col-md-8">
					<!-- posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>

					<div class="container-fluid" id="post-container"></div>
				</div>

			</div>



		</div>


	</main>

	<!--end of main body page  -->

	<!--Profile Model  -->

	<!-- Modal -->
	<div class="modal fade bd-example-modal-lg" id="profile-model"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center ">
					<h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center ">
						<img src="profile_pics/<%=user.getProfile()%>"
							style="border-radius: 17%%; max-width: 200px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getFirst_name()%>
							<%=user.getLast_name()%></h5>


						<!--Details  -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">D.O.B :</th>
										<td><%=user.getBdate()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile edit -->
						<div id="profil-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Here..</h3>
							---------------------------------------------------------------------------------------------
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label>User ID : <%=user.getId()%></label>
								</div>

								<div class="form-group">
									<label>Profile Image</label> <input name="user_image"
										type="file" class="form-control"> <small
										class="text-muted">Please Edit Your Profile image.</small>

								</div>

								<div class="form-group">
									<label>User Name</label>
									<div class="row">
										<div class="col">
											<input type="text" class="form-control" name="user_fname"
												value="<%=user.getFirst_name()%>">
										</div>
										<div class="col">
											<input type="text" class="form-control" name="user_lname"
												value="<%=user.getLast_name()%>">
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
											value="<%=user.getBdate()%>" type="text">
									</div>
								</div>

								<div class="form-group">
									<label>Email address</label> <input type="email"
										class="form-control" aria-describedby="emailHelp"
										name="user_email" value="<%=user.getEmail()%>"> <small
										class="text-muted">We'll never share your email with
										anyone else.</small>

								</div>

								<div class="form-group is-valid">
									<label>Password</label> <input name="user_password"
										type="password" id="inputPassword6" class="form-control"
										aria-describedby="passwordHelpInline"
										value="<%=user.getPassword()%>"> <small
										id="passwordHelpInline" class="form-text text-muted">
										Your password must be 8-20 characters long, contain letters
										and numbers, and must not contain spaces, special characters,
										or emoji. </small>
								</div>


								<div class="form-group">
									<label>Gender </label>
									<div class="form-control "><%=user.getGender().toUpperCase()%>
									</div>

								</div>

								<div class="form-group">
									<label>About</label>
									<textarea class="form-control" name="user_about" rows="3"><%=user.getAbout()%>
								
								</textarea>

								</div>

								<div class="conteiner text-center">

									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button"
						class="btn primary-background text-white">EDIT</button>
				</div>
			</div>
		</div>
	</div>



	<!--end of Profile Model  -->

	<!--  Add Post model  -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button id="close-btn" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
				     PostDao postd=new PostDao(ConnectionProvider.getConnection());
				     ArrayList<Category> list=postd.getAllCategories();
				     for(Category c:list)
				     {
				    	%>

								<option value="<%= c.getIdcategories() %>"><%= c.getName() %></option>

								<% 
				     }
				     
				     %>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter Post Title"
								class="form-control">

						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control" rows="7"
								placeholder="Enter Your Content..."></textarea>
						</div>

						<div class="form-group">
							<textarea name="pCode" class="form-control" rows="7"
								placeholder="Enter Your Programming Code (If Any)..."></textarea>
						</div>

						<div class="form-group">
							<label>Select your picture.</label> <br> <input name="pic"
								type="file" class="form-control">

						</div>


						<div class="container text-center">

							<button type="submit" class="btn btn-outline-primary">Post</button>

						</div>


					</form>




				</div>

			</div>
		</div>
	</div>



	<!-- End Add Post model -->


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
	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-btn').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profil-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profil-edit").hide();
					editStatus = false;
					$(this).text("EDIT");
				}
			});

		});
	</script>
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

	<!-- now add post js -->

	<script>
	    
	    $(document).ready(function(e){
	    	$("#add-post-form").on("submit",function (event){
	    		//this code gets called when form is submmited..
	    		event.preventDefault();
	    		
	    		let form=new FormData(this);
	    		
	    		//now requesting to server..
	    		$.ajax({
	    			url: "AddPostServlet",
	    			type: 'post',
	    			data: form,
	    			success : function (data, textStatus, jqXHR){
	    				//success..
	    				console.log(data);
	    				if(data.trim() == 'Done')
	    					{
	    					swal("Good job!", "Posted Successfull..", "success");
	    					}
	    				else
	    					{
	    					swal("Error!", "Something Went Wrong try again..", "error");
	    					}
	    			},
	    			error : function (jqXHR, textStatus, errorThrown){
	    				//error..
	    				swal("Error!", "Something Went Wrong try again..", "error");
	    			},
	    			processData: false,
	    			contentType: false	
	              })
	    	})
	    })
	    
	</script>

	<!-- loading post using ajax -->

	<script>
	     $(document).ready(function (e){
	    	$.ajax({
	    		url: "load_posts.jsp",
	    		success: function (data, textStatus, jqXHR)
	    		{
	    			console.log(data);
	    			$("#loader").hide();
	    			$('#post-container').html(data);
	    		}
	    	})
	     })
	
	
	</script>


</body>
</html>
