<%-- 
    Document   : logoutAction
    Created on : 15/04/2019, 11:01:42 PM
    Author     : Bruce Moon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@page import = "oms.model.*" import="java.sql.*" %>
        <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%String ID = (String)session.getAttribute("IDs"); %>
         <%DBManager manager = (DBManager)session.getAttribute("manager");%>
        <% if (session.getAttribute("customer")!= null){%>
        <%
             
             Timestamp logoutT = new Timestamp(System.currentTimeMillis());
             Timestamp loginT = (Timestamp)session.getAttribute("loginT") ;
             //oms.model.Time tempT = new oms.model.Time(ID,loginT,logoutT);
             
              manager.addRecord(ID,loginT,logoutT);  
         session.removeAttribute("customer");         
         session.invalidate(); %>
        <p>You have been logged out</p>
        <p>Click here to return to <a href="Main.jsp"> main page</a> </p>
                
        
         <%} else {%>
         <%
             
             Timestamp logoutT = new Timestamp(System.currentTimeMillis());
             Timestamp loginT = (Timestamp)session.getAttribute("loginT") ;
             //oms.model.Time tempT = new oms.model.Time(ID,loginT,logoutT);
             
              manager.addRecord(ID,loginT,logoutT);
             
         session.removeAttribute("staff");
         session.invalidate(); %>
        
        <p>You have been logged out</p>
        <p>Click here to return to <a href="Main.jsp"> main page</a> </p>
                
        <%}%>
    </body>
</html>
