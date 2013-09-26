<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to JavaTunes</title>
<link type="text/css" rel="stylesheet" href="css/web.css" />
<link rel="stylesheet" type="text/css"
	href="jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.css" />
<script type="text/javascript"
	src="jquery-ui-1.10.3.custom/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/alertify.min.js"></script>
<link rel="stylesheet" href="css/alertify.core.css" />
<link rel="stylesheet" href="css/alertify.default.css" />




<script>
	$(function() {
		
		
		
		$("#login").dialog({
			closeOnEscape : true,
			modal : true,
			position : {
				my : "center",
				at : "center",
			},
			create : function(event, ui) {
				$(".ui-dialog-titlebar").hide();
			},
			width : "350",
			height : "350",
			autoOpen : false,
			show : "blind",
			hide : "fold",
			close : function() {
				$("#login input[type!='button']").val("");
			}
		});

		$("#loginButton").on("click", function() {
			$("#login").dialog("open");
		});
		$("#login>form").on("submit", validatefunction_in);
		$("#login_submit").on(
				"click",
				function() {
					$("#login>form").trigger("submit",
							[ $("#email").val(),
							  $("#pswd").val(),
							  $("#lang").val()]);
					
					
				});

		$("#signup").dialog({
			closeOnEscape : true,
			modal : true,
			position : {
				my : "center top",
				at : "center top"
			},
			create : function(event, ui) {
				$(".ui-dialog-titlebar").hide();
			},
			width : "350",
			height : "500",
			autoOpen : false,
			show : "blind",
			hide : "fold",
			close : function() {
				$("#signup input[type!='button']").val("");
			}
		});

		$("#signupButton").on("click", function() {
			$("#signup").dialog("open");
		});
		$("#signup>form").on("submit", validatefunction_up);
		$("#signup_submit").on(
				"click",
				function() {
					$("#signup>form").trigger(
							"submit",
							[ $("#email_r").val(),
							  $("#pswd_r").val(),
									$("#username_r").val(),
									$("#firstname_r").val(),
									$("#lastname_r").val(),
									$("#address_r").val(), 
									$("#state_r").val(),
									$("#zipcode_r").val(),
									$("#lang_r").val()]);
				});

		$("#in_close").click(function() {
			$("#login").dialog("close");
			$("#login .hint").hide();
		});

		$("#up_close").click(function() {
			$("#signup").dialog("close");
			$("#signup .hint").hide();
		});
		
		
	});

	function validatefunction_in(evtObj, email, pswd, lang) {
		var emailvalue = $.trim(email);
		var pswdvalue = $.trim(pswd);
		var langvalue = $.trim(lang);
		if (emailvalue == "" || pswdvalue == "") {
			$("#login").effect("shake");
			$("#login .hint").show().text("Please fill out the form.");

		} else {
			$.ajax({
				type : "POST",
				url : "login.do",
				data : {
					email : emailvalue,
					password : pswdvalue,
					lang : langvalue
				},
				success : function(respText, status, jqXHR) {
					if ($.trim(respText) == "success") {
						$("#login").dialog("close");
						$("#homepage").hide();
						$.ajax({
							type : "GET",
							url : "index.do",
							success :  window.location.href="index.do"

						});
					}
					if ($.trim(respText) == "wrong") {
						$("#login").effect("shake");
						$("#login .hint").show().text("Wrong Infomation");
					}

				}
			});

		}
		return false;
	};

	function validatefunction_up(evtObj, email, pswd, username, firstname,
			lastname, address, state, zipcode, lang) {
		var email = $.trim(email);
		var pswd = $.trim(pswd);
		var username = $.trim(username);
		var firstname = $.trim(firstname);
		var lastname = $.trim(lastname);
		var address = $.trim(address);
		var state = $.trim(state);
		var zipcode = $.trim(zipcode);
		var lang = $.trim(lang);
		if (email == "" || pswd == "" || username == "" || firstname == ""
				|| lastname == "" || address == "" || state == ""
				|| zipcode == "") {
			$("#signup").effect("shake");
			$("#signup .hint").show().text("Please fill out the form.");
		} else {
			$.ajax({
				type : "POST",
				url : "register.do",
				data : {
					email : email,
					password : pswd,
					username : username,
					firstname : firstname,
					lastname : lastname,
					address : address,
					state : state,
					zipcode : zipcode,
					lang : lang
				},
				success : function(respText, status, jqXHR) {
					$("#signup").dialog("close");
					$("#homepage").hide();
					$.ajax({
						type : "GET",
						url : "index.do",
						success : alertify.alert("welcome to JavaTunes"),
						complete : window.location.href="index.do"

					});
				},
			});

		}
		return false;
	};
</script>
</head>

<body>

    
	<div id="homepage">
		<img src="images/javatunesTitle.png"> <br> <br> <input
			type="button" class="Button" value="Sign in" id="loginButton"><br>
		<br>
		<p>
			Or <a id="signupButton">Sign Up</a>
		</p>
		
	</div>


	
		
	<div id="login" class="login" style="display: none">
		<img id="in_close" src="images/x.png" class="closeimage">
		<h2>Sign in</h2>
		<form>
			<p class="hint"></p>
			<input type="email" name="email" id="email" placeholder="Email"
				value="bamboo@gmail.com"><br> 
			<br> <input	type="password" name="password" id="pswd" placeholder="password"><br>
			<br>
			<div class="select">	<select id="lang">
				<option>Select Language</option>
					<option value="en">English</option>
					<option value="fr">français</option>
				</select></div>
			<br><br> <input type="button" name="login_submit" value="Sign in"
				class="Button" id="login_submit">
		</form>
	</div>



	<div id="signup" class="signup" style="display: none">
		<img id="up_close" src="images/x.png" class="closeimage">
		<h2>Register</h2>
		<form>
			<p class="hint"></p>
			<input type="email" name="email" id="email_r" placeholder="Email"><br>
			<input type="password" name="password" id="pswd_r"
				placeholder="password"><br> <input type="password"
				name="password2" placeholder="Repeat password"><br> <input
				type="text" name="username" id="username_r" placeholder="username"><br>
			<input type="text" name="firstname" id="firstname_r"
				placeholder="first name"><br> <input type="text"
				name="lastname" id="lastname_r" placeholder="last name"><br>
			<input type="text" name="address" id="address_r"
				placeholder="address"><br> 
			<div class="select"><select id="state_r">
				<option>--Select State---</option>
				<option value="Alabama">Alabama</option>
				<option value="Alaska">Alaska</option>
				<option value="Arizona">Arizona</option>
				<option value="Arkansas">Arkansas</option>
				<option value="California">California</option>

				<option value="Colorado">Colorado</option>
				<option value="Connecticut">Connecticut</option>
				<option value="Delaware">Delaware</option>
				<option value="District of Columbia">District of Columbia</option>
				<option value="Florida">Florida</option>

				<option value="Georgia">Georgia</option>
				<option value="Hawaii">Hawaii</option>
				<option value="Idaho">Idaho</option>
				<option value="Illinois">Illinois</option>
				<option value="Indiana">Indiana</option>

				<option value="Iowa">Iowa</option>
				<option value="Kansas">Kansas</option>
				<option value="Kentucky">Kentucky</option>
				<option value="Louisiana">Louisiana</option>
				<option value="Maine">Maine</option>

				<option value="Maryland">Maryland</option>
				<option value="Massachusetts">Massachusetts</option>
				<option value="Michigan">Michigan</option>
				<option value="Minnesota">Minnesota</option>
				<option value="Mississippi">Mississippi</option>

				<option value="Missouri">Missouri</option>
				<option value="Montana">Montana</option>
				<option value="Nebraska">Nebraska</option>
				<option value="Nevada">Nevada</option>
				<option value="New Hampshire">New Hampshire</option>

				<option value="New Jersey">New Jersey</option>
				<option value="New Mexico">New Mexico</option>
				<option value="New York">New York</option>
				<option value="North Carolina">North Carolina</option>
				<option value="North Dakota">North Dakota</option>

				<option value="Ohio">Ohio</option>
				<option value="Oklahoma">Oklahoma</option>
				<option value="Oregon">Oregon</option>
				<option value="Pennsylvania">Pennsylvania</option>
				<option value="Rhode Island">Rhode Island</option>

				<option value="South Carolina">South Carolina</option>
				<option value="South Dakota">South Dakota</option>
				<option value="Tennessee">Tennessee</option>
				<option value="Texas">Texas</option>
				<option value="Utah">Utah</option>

				<option value="Vermont">Vermont</option>
				<option value="Virginia">Virginia</option>
				<option value="Washington">Washington</option>
				<option value="West Virginia">West Virginia</option>
				<option value="Wisconsin">Wisconsin</option>
				<option value="Wyoming">Wyoming</option>

			</select></div>
			<input type="text" name="zipcode" id="zipcode_r"
				placeholder="zipcode">
			<br>
			<div class="select">	<select id="lang_r">
					<option>Select Language</option>
					<option value="en">English</option>
					<option value="fr">français</option>
				</select></div>
			<input type="button"
				name="signup_submit" value="signup" class="Button"
				id="signup_submit">
		</form>
	</div>
</body>
</html>