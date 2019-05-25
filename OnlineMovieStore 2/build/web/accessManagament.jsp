<%-- 
    Document   : accessManagament
    Created on : 18/05/2019, 7:14:58 PM
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@page import = "oms.model.*" %>
        <%@page import="oms.model.DAO.*"%>
        <%@page import="oms.model.controller.*"%>
        <%@page import="java.sql.Connection"
                import="java.util.*"%>
        <%@page import="java.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp"%>
        <title>Management Page</title>
    </head>
    <style>
        pa
        {
             float: right;  
        }
        table#t01
        {
            padding: 5px 20px 15px;
           width:87%; 
           border: 2px solid black;
            border-radius: 5px;
           border-collapse: collapse; 
        }
        table#t01 tr 
        {
            background-color: #eee;
        }
        th
        {
             background-color: black;
             color: white;
        }
        th,td
        {
            text-align: center;
            padding: 15px;
        }
         td 
        {
            border: 1px solid black;
            border-collapse: collapse;
        }
        .border input[type=submit]
        {
                width: 100%;
                background-color: #585858;
                padding: 5px;
                color: white;
                cursor: pointer;
                padding: 10px 20px;
                border: 0;
        }
        .border input[type=submit]:hover
        {
                opacity: 0.6;
        }
  </style>
   
    <body>
         <div class="border">
        <h2>Access Management </h2>
        <hr>
        <table  id ="t01">
         <tr>
             <th width="30%" >ID</th> 
             <th width="30%">Time Login</th>
             <th width="30%">Time logout</th>     
             <th width="10%">remove record</th>
         </tr>
        </table >
    <%
         
           ArrayList<oms.model.Time> SearchRecord= new ArrayList<oms.model.Time>();
        for(oms.model.Time t: SearchRecord)
    {%>
    <form action="accessManagement.jsp" method = POS>
        <table  id ="t01" >
            <% DBManager manager = (DBManager)session.getAttribute("manager");%>
            <tr>
            
             <td width="30%"><%=t.getCustomerID()%></td> 
             <td width="30%"><%=/*(java.util.Date)*/t.getLoginT()%></td>
             <td width="30%"><%=t.getLogoutT()%></td>     
             <td width="10%"><input type="submit" value="Delete"></td>
             <%if(request.getParameter("Delete")!=null)
             {
                 manager.addRecord();
                 
             }
                %>
         </tr>
        </table >
        </form>
       
             
        <%}%>
     <p><input type="submit" value="Delete All"></p></div>
   
    
    
    </body>
</html>