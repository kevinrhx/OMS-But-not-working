


<%-- 
    Document   : Main
    Created on : 13/04/2019, 2:31:24 PM
    Author     : Michelle
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import = "oms.model.*" %>
        <%@page import="oms.model.DAO.*"%>
         <%@page import="oms.model.controller.*"%>
         <%@page import="java.util.*"%>
        <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing Page</title>
    </head>
    <jsp:include page="/ConnServlet" flush="true" />
    <jsp:useBean id="connserv" class="oms.model.controller.ConnServlet" scope="application"></jsp:useBean>
        <body>

        <%//Get Attribute from loginAction
            Customer c = (Customer) session.getAttribute("customer");
            Staff s = (Staff) session.getAttribute("staff");
        %>
        <%              
            String ID = "" + (new Random()).nextInt(999999);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String role = request.getParameter("role");
            String status = "Activated";
            int authorisation = 1;
            String yes = request.getParameter("submitted");
            String userType = request.getParameter("userType");
        %>              
        <%if (c != null && s == null){%>
             
        <p> You are logged in as <%= c.getName()%> &lt;<%= c.getEmail()%>&gt; </p>
        <p>Click here to <a href="logoutAction.jsp"> logout </a></p>
        <%@include file="sideNavigation_movies.jsp"%>
        <%} else if (c ==null && s!= null) {%>
        <p> You are logged in as <%= s.getName()%> &lt;<%= s.getEmail()%>&gt; </p>
        <p>Click here to <a href="logoutAction.jsp"> logout </a></p>
        <p> Click here to create movies <a class="link" href="create_movie.jsp">Create Movies</a> </p>
        <p> Click here to update movies <a class="link" href="update_movie.jsp">Update Movies</a> </p>       
        <% session.setAttribute("staffedit",s);%>
        <%@include file="sideNavigation_movies.jsp"%>
        <%}else { %>
        
        <% if (yes != null && yes.equals("yes") && userType.equals("customer") ) {%>     

        <P> Welcome: <%= name%></P>
        <p>Your username to Login will be your ID: <%= ID%></p>

        <%
 
            DBManager manager = (DBManager)session.getAttribute("manager");
            Customer cus = new Customer(ID, email, name, pass, phone, address, status);
            manager.addCustomer(ID, email, name, pass, phone, address, status);
           // session.getAttribute("user");
            session.setAttribute("customer", cus);
        %>
        <p>Click here to <a href="logoutAction.jsp"> logout </a></p>

            
         <%} else if (yes != null && yes.equals("yes") && userType.equals("staff")) {%>
         
         <P> Welcome: <%= name%></P>
        <p>Your username to Login will be your ID: <%= ID%></p>
        
         <%
            DBManager manager = (DBManager)session.getAttribute("manager");
            Staff sta = new Staff(ID, name, email, pass, phone, address, authorisation, role);
            manager.addStaff(ID, name, email, pass, phone, address, authorisation, role);
     
            
           // session.getAttribute("user");
            session.setAttribute("staff", sta);
        %>
        
        
        <%} else {%>

        <p>Welcome to the Online Movie Store!</p>
        <%@include file="sideNavigation_movies.jsp"%>
        <% }%>
        <%}%>
      
        


    </body>
</html>
