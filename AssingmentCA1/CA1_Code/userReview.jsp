<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>

<!-- Bootstrap files (jQuery first, then Popper.js, then Bootstrap JS) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
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

</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12">
			<div class="page-header">
				<h1>
					SP TOURS <small>Affordable Tours for EVERYONE!</small>
				</h1>
			</div>
				<%@include file="navbar.jsp"%>
                                        </div>
                                        </div>
                                        
                 


<%

String rID = request.getParameter("rID");

String tourName;
String tourURL;
String tourURL2;
String tourURL3;
String tourDesc;
Integer price;
Date start_date;
Date end_date;
String promo;
String aDesc;
String buttonID;
String modalID;
String spanID;
String linkURL;
Integer productCount;
Date enter_date;
Date home_date;
String region;
String category;
String reviewC;
String reviewR;	

if (session.getAttribute("sessUserID") == null) {
	response.sendRedirect("login.jsp");
} 

int id = (int)session.getAttribute("sessUserID");

try {
	 // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

   // Step 2: Define Connection URL
   String connURL = "jdbc:mysql://localhost/ca1_product?user=root&password=T0416598a&serverTimezone=UTC";

   // Step 3: Establish connection to URL 
   Connection conn = DriverManager.getConnection(connURL);
  // Step 4: Create Statement object
   Statement stmt = conn.createStatement();
   // Step 5: Execute SQL Command 
   PreparedStatement pstmt =conn.prepareStatement("SELECT r.review_id, r.review_content, r.product_id, r.review_rating, r.user_id, t.product_name FROM reviews r, tours t WHERE t.product_id = r.product_id and r.user_id = " + id); 
   ResultSet rs = pstmt.executeQuery();

   // Step 6: Process Result
   %>
<div class = 'col-md-6'>
<h2>Reviews</h2>
  <table class="table table-bordered">
  <!-- Table head -->
  <thead>
    <tr>
      <th>
        <!-- Default unchecked -->
        <div class="custom-control custom-checkbox">

        </div>
      </th>
      <th>Review Content</th>
      <th>Tour Name</th>
      <th>Review Rating</th>
      <th>Delete Item</th>
    </tr>
  </thead>
   <tbody>



<%

while (rs.next()){
	   
	   reviewC = rs.getString("review_content");
	   reviewR = rs.getString("review_rating");
	   tourName = rs.getString("product_name");
	   rID = rs.getString("review_id");

%>
 </th>
      <td><%=reviewC %></td>
      <td><%=tourName %></td>
      <td><%=reviewR %></td>
      <form action = deleteReview.jsp method=POST>
      <td>
      <button name = "deleteID" type = "submit" value = <%=rID %>> Delete This Review!</button>
      </td>
      </form>
    </tr>


<% 
		}
} catch (Exception e) {
 out.println("Error :" + e);
}

%>



</div>
</div>



