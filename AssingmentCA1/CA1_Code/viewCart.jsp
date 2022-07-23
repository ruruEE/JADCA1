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
<body>
<div class="col-md-12">
			<div class="page-header">
				<h1>
					SP TOURS <small>Affordable Tours for EVERYONE!</small>
				</h1>
			</div>
				<%@include file="navbar.jsp"%>

<%
String cartTourName = request.getParameter("cartTourName");
String cartTourURL = request.getParameter("cartTourImage");
String cartTourPrice = request.getParameter("cartTourPrice");
String quantity = request.getParameter("quantity");
int uID = (int)session.getAttribute("sessUserID");





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
    PreparedStatement pstmt =conn.prepareStatement("SELECT btn_id, cart_ID, itemName, itemURl, itemPrice, quantity, (itemPrice*quantity) AS Subtotal FROM cart WHERE user_id = ?;");
   pstmt.setInt(1, uID);      
   ResultSet rs = pstmt.executeQuery();%>

 <table class="table table-bordered">
 <!-- Table head -->
 <thead>
   <tr>
     <th>
       <!-- Default unchecked -->
       <div class="custom-control custom-checkbox">

       </div>
     </th>
     <th>ID</th>
     <th>Name</th>
     <th>Price</th>
     <th>Quantity</th>
     <th>SubTotal</th>
     <th>Delete Item</th>
   </tr>
 </thead>
  <tbody>
   
   <%while (rs.next()) {
   	
   	String tName = rs.getString("itemName");
   	String tURL = rs.getString("itemURL");
   	String tPrice = rs.getString("itemPrice");
   	String tQuantity = rs.getString("quantity");
   	String tSTotal = rs.getString("Subtotal");
   	String cID = rs.getString("cart_ID");
   	String bID = rs.getString("btn_id");
   	

%>
        <tr>
     <th scope="row">
     <div class="custom-control custom-checkbox">
         <input name = "id"  value = "<%=cID %>" type="checkbox" class="custom-control-input" id="<%=bID %>" >
         <label class="custom-control-label" for="<%=bID%>">Check </label>
          </div>
     </th>
     <td><%=cID %></td>
     <td><%=tName %></td>
     <td><%=tPrice %></td>
     <td><%=tQuantity %></td>
     <td><%=tSTotal %></td>
     <form action = deleteCart.jsp method=POST>
     <td>
     <button name = "deleteID" type = "submit" value = <%=cID %>> Delete This item from Cart!</button>
     </td>
     </form>
   </tr>
   <%}%>
   </tbody>

   </table>
  
       <%
       // Close connection
       conn.close();
       %>
  <%
  } catch (Exception e) {
     out.println("Error :" + e);
  }



%>



</body>
</html>