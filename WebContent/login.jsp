<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    /****
    	*
    	* 
    	Login authentication  using AJAX request
    	*
    	*
    	*/
    	
    %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>SHAON Login Page</title>

		<!-- Foundation framework -->
			<link rel="stylesheet" href="css/foundation.css" />
			<link rel="stylesheet" href="css/style.css" />

		<!-- Favicons and the like (avoid using transparent .png) -->
			<link rel="shortcut icon" href="favicon.ico" />
			<link rel="apple-touch-icon-precomposed" href="icon.png" />
			<script src="js/angular/angular.min.js"></script>
	</head>
	<body class="ptrn_a grdnt_a" ng-app="">
		<div class="container">
            <div class="row">
                <div class="eight columns centered">
                    
                </div>
            </div>
			<div class="row">
				<div class="eight columns centered">
					<div class="login_box">
						<div class="lb_content">
                            <div class="login_logo"><img src="img/logo.png" alt="" /></div>
							<div class="cf">
								<h2 class="lb_ribbon lb_blue"><span>Login to your account</span><span style="display:none">New password</span></h2>
								<a href="#" class="right small sl_link">
									<span>Forgot your password?</span>
									<span style="display:none">Back to login form</span>
								</a>
							</div>
							<div class="row m_cont" >
								<div class="eight columns centered">
									<div class="l_pane">
										<div id="loading" style="display:none;" > <img width="100px" height="150px" src="img/loader1.gif"> </div>
										<div id="errorUnregis" style="display:none;color:red" > Unregistered User!!</div>
										<div id="errorUPass" style="display:none;color:red" > Username or Password Mismatch!!</div>
										<form action="" method="post" class="nice" id="l_form">
											<div class="sepH_c">
												<div class="elVal">
													<label for="username">Email</label>
													<input type="text" id="email" name="email" class="oversize expand input-text" />
												</div>
												<div class="elVal">
													<label for="password">Password</label>
													<input type="password" id="password" name="password" class="oversize expand input-text" />
												</div>
											</div>
											<div class="cf">
												<label for="remember" class="left"><input type="checkbox" id="remember"> Remember me</label>
												<!-- <input type="submit" class="button small radius right black" value="Login" /> -->
												<input type="button" class="button small radius right black" value="Login" onclick="loginCtrl()" />
											</div>
										</form>
									</div>
									<div class="l_pane" style="display:none">
										<form action="dashboard.html" method="post" class="nice" id="rp_form">
											<div class="sepH_c">
												<p class="sepH_b">Please enter your email address. You will receive a link to create a new password via email.</p>
												<div class="elVal">
													<label for="upname">E-mail:</label>
													<input type="text" id="upname" name="upname" class="oversize expand input-text" />
												</div>
											</div>
											<div class="cf">
												<input type="submit" class="button small radius right black" value="Get new password" />
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="js/jquery.min.js"></script>
		<script src="js/s_scripts.js"></script>
		<script src="js/jquery.validate.min.js"></script>
		<script>
		function loginCtrl(){
			var mail = document.getElementById('email').value;
			var pass = document.getElementById('password').value;
			document.getElementById("loading").style.display = "block";
			
			document.getElementById("errorUPass").style.display = "none";
			document.getElementById("errorUnregis").style.display = "none";
			
			var url = window.location.href;
			var pos = url.lastIndexOf('/');
			var loc = url.substring(0,pos);
			
			$.post( loc+"/shaon/",{check:"l_in",email:mail,password:pass}, function( data ) {
				document.getElementById("loading").style.display = "none";
				
				if(data=="Unregistered User"){
					
					
					document.getElementById("errorUnregis").style.display = "block";
					
				}else if(data=="Username or Password Mismatch"){
					
					
					document.getElementById("errorUPass").style.display = "block";
				}else if(data=="logged in"){
					location.href=loc+"/homepage.jsp";
					
				}
				
				});
			
		/*
		$http({
			    method: 'POST',
			    url: 'http://localhost:8080/LoginExample/',
			    data: $.param({check: "l_in"}),
			    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
			}).success(function(response){alert(response)}); */
			
			
			//  $http.post("http://localhost:8080/LoginExample/").success(function(response){alert(response)});
			  
			  
		}
		
			$(document).ready(function() {
				$(".sl_link").click(function(event){
					$('.l_pane').slideToggle('normal').toggleClass('dn');
					$('.sl_link,.lb_ribbon').children('span').toggle();
					event.preventDefault();
				});

				$("#l_form").validate({
					highlight: function(element) {
						$(element).closest('.elVal').addClass("form-field error");
					},
					unhighlight: function(element) {
						$(element).closest('.elVal').removeClass("form-field error");
					},
					rules: {
						username: "required",
						password: "required"
					},
					messages: {
						username: "Please enter your username ",
						password: "Please enter a password "
					},
					errorPlacement: function(error, element) {
						error.appendTo( element.closest(".elVal") );
					}
				});

				$("#rp_form").validate({
					highlight: function(element) {
						$(element).closest('.elVal').addClass("form-field error");
					},
					unhighlight: function(element) {
						$(element).closest('.elVal').removeClass("form-field error");
					},
					rules: {
						upname: {
							required: true,
							email: true
						}
					},
					messages: {
						upname: "Please enter a valid email address"
					},
					errorPlacement: function(error, element) {
						error.appendTo( element.closest(".elVal") );
					}
				});
			});
		</script>
	</body>
</html>