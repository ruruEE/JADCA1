<%@page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style = "text/css">
        	
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 60%;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
.row {
  display: absolute;
}


/* Style the search box */
#mySearch {
  width: 100%;
  font-size: 18px;
  padding: 11px;
  border: 1px solid #ddd;
}

/* Style the navigation menu inside the left column */
#myMenu {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myMenu li a {
  padding: 12px;
  text-decoration: none;
  color: black;
  display: block
}

#myMenu li a:hover {
  background-color: #eee;
}

.third-level-menu
{
    position: absolute;
    top: 0;
    right: -150px;
    width: 150px;
    list-style: none;
    padding: 0;
    margin: 0;
    display: none;
}

.third-level-menu > li
{
    height: 30px;
    background: #999999;
}
.third-level-menu > li:hover { background: #CCCCCC; }

.second-level-menu
{
    position: absolute;
    top: 30px;
    left: 0;
    width: 150px;
    list-style: none;
    padding: 0;
    margin: 0;
    display: none;
}

.second-level-menu > li
{
    position: relative;
    height: 30px;
    background: #999999;
}
.second-level-menu > li:hover { background: #CCCCCC; }

.top-level-menu
{
    list-style: none;
    padding: 0;
    margin: 0;
}

.top-level-menu > li
{
    position: relative;
    float: left;
    height: 30px;
    width: 150px;
    background: #999999;
}
.top-level-menu > li:hover { background: #CCCCCC; }

.top-level-menu li:hover > ul
{

    display: inline;
}




.top-level-menu a 
{
    font: bold 14px Arial, Helvetica, sans-serif;
    color: #FFFFFF;
    text-decoration: none;
    padding: 0 0 0 10px;
    
  
    display: block;
    line-height: 30px;
}
.top-level-menu a:hover { color: #000000; }

.hidden{
display:none;
}
@media (min-width: 992px){
		.dropdown-menu .dropdown-toggle:after{
			border-top: .3em solid transparent;
		    border-right: 0;
		    border-bottom: .3em solid transparent;
		    border-left: .3em solid;
		}

		.dropdown-menu .dropdown-menu{
			margin-left:0; margin-right: 0;
		}

		.dropdown-menu li{
			position: relative;
		}
		.nav-item .submenu{ 
			display: none;
			position: absolute;
			left:100%; top:-7px;
		}
		.nav-item .submenu-left{ 
			right:100%; left:auto;
		}

		.dropdown-menu > li:hover{ background-color: #f1f1f1 }
		.dropdown-menu > li:hover > .submenu{
			display: block;
		}
	}

</style>
	
<%

String profileUsername = "";
String profilePassword = "";
String profileUserRole = "";
String profileEmail = "";
int profileID = 0;

if (session.getAttribute("sessUserID") == null) {
	response.sendRedirect("login.jsp");
} else {
	profileID = (int) session.getAttribute("sessUserID");
	profileUsername = (String) session.getAttribute("sessUsername");
	profilePassword = (String) session.getAttribute("sessPassword");
	profileUserRole = (String) session.getAttribute("sessUserRole");
	profileEmail = (String) session.getAttribute("sessEmail");
}
%>

<script>
	function popUpLogin() {
		var username = document.getElementbyId("username");
		alert("Welcome " + username + "!");
	}
	window.onload = popUpLogin;
</script>

<html>
<head>
<title>Profile Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid">
		<div class="justify-content-center">
		<div class="text-center">
			<h1>
				Welcome
				<%=profileUsername%>
				!
			</h1>
			<br> Password is:<br>
			<%=profilePassword%><br> Email is: <br>
			<%=profileEmail%>
			<br> User ID: <br>
			<%=profileID%> <br>
			<br>

			Your user role is :
			<%=profileUserRole%>
			<br><br> 
			<a href="userTours.jsp">Past records</a><br>
			<a href="userReview.jsp">See my reviews</a> <br>
			<a href="editProfile.jsp">Edit profile</a><br>
			<%
			if (profileUserRole.equals("admin")) {
				out.print("<a href=\"updateUsers.jsp\">Update Users</a><br>");
				out.print("<a href=\"updateProduct.jsp\">Update Tours</a><br>");
			}
			%>
			</div>
		</div>
	</div>




</body>
</html>
