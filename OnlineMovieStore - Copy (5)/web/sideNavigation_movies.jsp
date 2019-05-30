<%-- 
    Document   : sideNavigation_movies
    Created on : May 15, 2019, 6:00:22 AM
    Author     : Hieu
--%>
  <!-- Hieu : This Page was used to display movies  and side bar
       The movies box will have "edit remove" button if user was a staff and no button otherwise
       This page also receives parameter from header search function and side bar menu 
       and display accordingly
       
  -->
<%@page import="oms.model.Movie"%>
<%@page import="oms.model.DAO.*"%>
<%@page import="oms.model.controller.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>side navigation and movies</title>
    </head>

    <style>
        .container{
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             line-height: 1.7em;
        }
        .sidebar{
            display: inline;
            float: left;
            width: 15%;
        }
        .content{
            display: inline;
            float:right;
            width: 85%;
            padding: 0px 10px;
        }
        .box{
            display: inline-block;
            text-align: center;
            background-color: #f4f4f4;
            width: 28.3%;
            padding: 100px;
            
            margin-bottom: 15px;
        }
        .side-menu{
            list-style: none;
            background: #42413D;
            border: 1px #f4f4f4 solid;
            border-radius: 10px;
            width: auto;
            padding: 10px;
        }
        .side-menu tr{
            display: block;
            font-size: 18px;
            line-height: 2.4em;
            border-bottom: dotted 1px #ddd;
            color:white;
            width:100%;
        }
        .side-menu tr:last-child{
           border-bottom: none;
        }
        
        .side-menu tr:first-child{
            text-decoration: none;
            text-align: center;
            color: white;
            font-weight: bold;
        }
        .side-menu tr td button{
            text-decoration: none;
            color: black;
            display: block;
            width: 100%;
        }
        .side-menu tr td button:hover{
            background: #f7c08a;
            color: #333;
            cursor: pointer;
            
        }
        
        
    </style>
    <body>
        <div class="container">
            <section class="content">
                 
                    <%  //get Attribute (Arraylist) from Search function in the header if the search 
                        //function is used
                        String search = request.getParameter("searchn") ;
                        String search2 = request.getParameter("button") ;
  // DISPLAY SCENERIO 1: HEADER SEARCH FUNCTION OR SIDE BAR MENU WAS CLICKED
                        if(search != null || search2 != null) 
                        {
                            DBManager manager = (DBManager)session.getAttribute("manager");
                            ArrayList<Movie> Searchmovies = new ArrayList<Movie>();
                            //IF the search was from the header input
                            if(search2 == null )
                            {
                                Searchmovies =    manager.searchMovies(request.getParameter("search")+"%");
                            }else{////IF the search was from the Side menu
                                Searchmovies =    manager.searchMovies(request.getParameter("button")+"%");
                            }
                            Staff staff = (Staff)session.getAttribute("staffedit");
                            //check if the user who is searching  is Customers or STAFF 
                            if (staff !=null )
                            {
                                for(Movie k: Searchmovies)
                                {//loop through the list and display the movies with edit , remove button
                                    %>
                                    <div class="box" > 
                                        <form action="edit_remove_movie.jsp" method="POST">
                                         <table>
                                             <tr><th> <%= k.getTitle() %></th></tr>
                                             <tr><td>  Price: $<%= k.getPrice() %> </td></tr>
                                             <tr><td> Copies: <%= k.getAvailableCopies() %> </td></tr>
                                             <tr><td><input type="hidden" value="clicked" name="clicked"></td></tr>
                                             <tr><td><button class="button" type="submit" > Edit or Remove </button></td></tr>
                                         </table> 
                                         </form>
                                       </div>
                                    
                                    <%
                                        session.setAttribute("editmovie", k);
                                }//if the Users are Customers or Guests
                                } else{
                                            for(Movie k: Searchmovies)
                                            {//loop through the list and display the movies without edit , remove button
                                                %>
                                                 <div class="box">  <h5><%= k.getTitle() %></h5> </div>
                                                <%
                                            }


                                      } 
                            
 //DISPLAY SCENERIO 2: THE SEARCH FUNCTION WAS NOT USED , THIS IS THE DEFAULT DISPLAY
                        }else if (search == null) {
                    %>
                    
                     <%
                     // Get staff Atttribute because movies display for staffs are different from customers and users       
                   
                    Staff staff = (Staff)session.getAttribute("staffedit");
                    //Check for staff session 
                    if (staff !=null )
                    {
                    //call DBMANAGER  
                        DBManager manager1 = (DBManager)session.getAttribute("manager");
                    //Use getAll Movies function in DBmanager
                        ArrayList<Movie> movies1 = manager1.getAllMovies();
                        for (Movie k: movies1){ 
                    %>
                <div class="box" > 
                    <form action="edit_remove_movie.jsp" method="POST">
                    <table>
                        <tr><th> <%= k.getTitle() %></th></tr>
                        <tr><td>  Price: $<%= k.getPrice() %> </td></tr>
                        <tr><td> Copies: <%= k.getAvailableCopies() %> </td></tr>
                        <tr><td><input type="hidden" value="clicked" name="clicked"></td></tr>
                        <tr><td><button class="button" type="submit" > Edit or Remove </button></td></tr>
                    </table> 
                        </form>
                </div>
                <%  
                    //setAttribute for edit_remove_movie page if select
                    session.setAttribute("editmovie", k);
                    
                  }
                  }else     {
                %>
                <%  DBManager manager2 = (DBManager)session.getAttribute("manager");
                    ArrayList<Movie> movies2 = manager2.getAllMovies();
                    for (Movie k: movies2){
                %>   
                    <div class="box">  <h5><%= k.getTitle() %></h5> </div>
                <%
                                           }
                            }
}
                  
                %>
            </section>
            <aside class="sidebar">
                <form method="POST">
                    <table class="side-menu" >
                    <tr>Movie Genres</li></tr>
                    <tr><td><button type="submit" value="Action" name="button">Action</button></td></tr>
                    <tr><td><button type="submit" value="Children" name="button">Children</button> </td></tr>
                    <tr><td><button type="submit" value="Comedy" name="button">Comedy</button></td></tr>
                    <tr><td><button type="submit" value="Documentary" name="button">Documentary</button></td></tr>
                    <tr><td><button type="submit" value="Drama" name="button">Drama</button></td></tr>
                    <tr><td><button type="submit" value="Family" name="button">Family</button></td></tr>
                    <tr><td><button type="submit" value="Science Fiction" name="button">Science Fiction</button></td></tr>
                    <tr><td><button type="submit" value="Sport" name="button">Sport</button></td></tr>
                    </table>
                </form>            
            </aside>
           
               
        </div>
    </body>
</html>
