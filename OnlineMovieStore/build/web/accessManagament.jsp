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
         <%@page import = "oms.model.Time" %>
        <%@page import="oms.model.DAO.*"%>
        <%@page import="oms.model.DAO.DBManager"%>
         <%@page import="oms.model.DAO.DBConnector"%>
        <%@page import="oms.model.controller.*"%>
        <%@page import="java.sql.Connection"
                import="java.util.*"%>
        <%@page import="java.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp"%>
        <title>Management Page</title>
    </head>
    <style>
      
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
        .searchT
        {
            float: right;
        }
        
  </style>
   
    <body>
         <div class="border">
        <h2 >Access Management </h2>
       <hr>
        <hr>
          <div class="searchT">
                    <form  method="POS">
                        <input type="text" placeholder="Search by login year.." name="searchY">
                        <input type="text" placeholder="Search by login month.." name="searchM">
                        <input type="text" placeholder="Search by login date.." name="searchD">
                        <button value ="searchT" name="searchT"type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
        
        
        <table  id ="t01">
         <tr>
             <th width="30%" >ID</th> 
             <th width="30%">Time Login</th>
             <th width="30%">Time logout</th>     
             <th width="10%">remove record</th>
         </tr>
        </table >
    <%
         String ID = (String)session.getAttribute("IDs"); //
         DBManager manager = (DBManager)session.getAttribute("manager");
           ArrayList<Time> AllTime = manager.getAllTime(ID);//create a list of Time based on the user who is login
      %>
      <%
 
             // SearchRecord =    manager.getAllTime();
      for(Time t: AllTime)//loop
       
    {%>
    <form action="accessManagament.jsp" method ="POST">
        <table  id ="t01" >
          
            <tr>
            
             <td width="30%"><%=t.getCustomerID()%></td> 
             <td width="30%"><%=/*/(java.util.Date)*/t.getLoginT()%></td>
             <td width="30%"><%=t.getLogoutT()%></td>     
             <td width="10%"><input type="submit" value="delete" name="delete" ></td>
           
             <%// java.util.Date date = t.getLoginT();  %>
                    <% if(request.getParameter("delete")!=null)
             {
                 
                  Timestamp a = t.getLoginT();
               
               
             manager.deleteRecord(ID,a);
                 
           }%>
         </tr>
        </table >
        </form>
      <%  }%>
        

                
             
        <%%>
   <% //if(request.getParameter("searchT")!=null)
//             {
//                // manager.findRecord(date);
//                 
//             }
//                %>
   </div>
     
       
    
    </body>
</html>