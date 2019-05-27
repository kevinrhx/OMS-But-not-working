<%-- 
    Document   : create_movie.jsp
    Created on : May 22, 2019, 1:15:39 AM
    Author     : Hieu
--%>
<!-- Hieu : This Page was used to create movies
  -->
<%@page import="java.util.Random"%>
<%@page import="oms.model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import = "oms.model.*" %>
        <%@page import="oms.model.DAO.*"%>
        <%@page import="oms.model.controller.*"%>
        <%@page import="java.sql.Connection"%>
         <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Movies Page</title>
    </head>
   
    <body>
         <form action="create_movie.jsp" method="POST">
            <table>
                <tr><td>Title</td><td><input type="text"  name="title" required></td></tr>
                <tr><td>Genre</td><td><input type="text"  name="genre" required></td></tr>                
                <tr><td>Price</td><td><input type="text" name="price" required></td></tr>
                <tr><td>Release Date</td><td><input type="text" name="releaseDate" required></td></tr>  
                <tr><td>Available Copies</td><td><input type="number" name="copies"required></td></tr>
                <tr><td><input type="hidden" value="inserted" name="inserted"></td>
                    <td><input class="button" type="submit" value="Save"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'Main.jsp'" > Main Page </button>
                    </td>
                </tr>
            </table>
        </form>
        <% DBManager manager = (DBManager)session.getAttribute("manager");
                // Check wheter the form was submitted
           if (request.getParameter("inserted") != null){
               //Create an ID
           String ID = "" + (new Random()).nextInt(999999);
               //Get the Price and number of copies (convert into double and int)
           double price = Double.parseDouble(request.getParameter("price"));
           int copies = Integer.parseInt(request.getParameter("copies"));
               //Add movies to database
           manager.addMovies(ID, request.getParameter("title"), request.getParameter("genre"),
                        price, request.getParameter("releaseDate"),copies);
           }
        %>
    </body>
</html>
