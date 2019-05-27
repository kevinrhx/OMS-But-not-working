<%-- 
    Document   : loginAction
    Created on : 16/04/2019, 12:28:33 PM
    Author     : Bruce Moon
--%>
<%@page import="oms.model.DAO.*"%>
<%@page import="oms.model.controller.*"%>
<%@page import="oms.model.*" import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>


    <jsp:useBean id="Customers" class="oms.model.Customers" scope="application"></jsp:useBean>
    <jsp:useBean id="Staffs" class="oms.model.Staffs" scope="application"></jsp:useBean>

        <body>

        <%
            String ID = request.getParameter("ID");
            String password = request.getParameter("password");
            // oms.model.Time time = new oms.model.Time();
            Timestamp loginT = new Timestamp(System.currentTimeMillis());//declare time when login happen
            session.setAttribute("loginT",loginT);
            session.setAttribute("IDs",ID);
            //Customer Login
            DBManager manager = (DBManager)session.getAttribute("manager");
            for (Customer c : manager.getAllCustomers()) {
                Customers.addCustomer(c);
            }
            Customer cus = Customers.login(ID, password);
            
            //Staff Login
            for (Staff s : manager.getAllStaff()) {
                Staffs.addStaff(s);
            }
            Staff sta = Staffs.login(ID, password);
        %>

        <%
            if (cus != null) {
                session.setAttribute("customer", cus);%>
        <p>Login successful. Click<a href = "Main.jsp" > here </a> to return to the main page.</p>


        <% } else if (sta != null) {%>
                <%session.setAttribute("staff", sta);%>
        <p>Login successful. Click<a href = "Main.jsp" > here </a> to return to the main page.</p>
        
        <%} else {%>
        <p> Password incorrect. Click<a href = "login.jsp" > here </a> to try again.</p>
        <%}
        %>
    </body>
</html>
