<%-- 
    Document   : header
    Created on : 14/04/2019, 2:17:57 PM
    Author     : Michelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="header.css">
        <link rel="stylesheet" type="text/css" href="dropdown.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <div class="header">
            <h2>Online Movie Store</h2>
	</div>
	<div class="navbar">	
            <a style="margin-right: 20px" href="#"><i class="fa fa-shopping-cart"></i> Cart</a>
                    
                <div class="dropdown">
                    <button class="dropbtn"><i class="fa fa-user"></i>&nbsp&nbsp<i class="fa fa-caret-down"></i></button>
                        <div class="dropdown-content">
                            <a href="#">Change Details</a>
                            <a href="#">Log out</a>
                        </div>
                </div>
                        
              	<div class="search">
                    <form action="/action_page.php">
                        <input type="text" placeholder="Search.." name="search">
                            <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            <a style="float: left; margin-left: 20px" href="Main_1.jsp"><i class="fa fa-home"></i> Home</a>

                    
	</div>
    </body>
</html>
