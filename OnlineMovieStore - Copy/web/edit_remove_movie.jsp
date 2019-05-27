<%-- 
    Document   : Edit_Remove_Movie
    Created on : May 22, 2019, 5:31:29 PM
    Author     : Hieu
--%>
 <!-- Hieu : This Page was used to edit and movies that was selected by the STAFF
  -->
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit and Remove Page</title>
    </head>
    <body>
        <%  
            Movie movieSelected = (Movie) session.getAttribute("editmovie");
            if( movieSelected != null)
            {
        %>
                <form action="edit_remove_movie.jsp" method="POST">
                <table>
                <tr><td>Title</td><td><input type="text"  name="title" required ></td></tr>
                <tr><td>Genre</td><td><input type="text"  name="genre" required></td></tr>                
                <tr><td>Price</td><td><input type="text" name="price" required></td></tr>
                <tr><td>Release Date</td><td><input type="text" name="releaseDate" required></td></tr>  
                <tr><td>Available Copies</td><td><input type="number" name="copies" required></td></tr>
                <tr>
                    <td><input class="button" type="submit" value="Save" name="edit"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'Main.jsp'" > Main Page </button>
                    </td>
                </tr>
            </table>
                </form>
            <form action="edit_remove_movie.jsp" method="POST">
                <table>
                    <tr><td>   <input class="button" type="submit" value="Remove" name="remove"> </td></tr>
                </table>
                
                </form>
        <%
            }
        %>
        <%
            DBManager manager = (DBManager)session.getAttribute("manager");
            //Check whether the edit form or the remove form was submited
            if (request.getParameter("edit") != null)
            {
                //get String ID, double price, num of copies from the form
                String ID = movieSelected.getMovieID();
                double price = Double.parseDouble(request.getParameter("price"));
                int availablecopies = Integer.parseInt(request.getParameter("copies"));
                //Update the movie details by calling updatemovie function from DBmanager
                manager.updateMovie(ID, request.getParameter("title"), request.getParameter("genre"), 
                        price, request.getParameter("releaseDate"), availablecopies);
              //Check whether the edit form or the remove form was submited
            }else if (request.getParameter("remove")!=null)
            {
                String ID = movieSelected.getMovieID();
                //delete the movie
                manager.deleteMovie(ID);
            }
        %>
    </body>
</html>
