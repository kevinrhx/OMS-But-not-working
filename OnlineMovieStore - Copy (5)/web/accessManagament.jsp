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
         <%@page import="java.sql.*" import ="java.text.DateFormat"
                 import="java.text.SimpleDateFormat"%>
        <link rel="stylesheet" type="text/css" href="accessManagement.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp"%>
        <title>Management Page</title>
    </head>
    
   
    <body>
         <div class="border">
        <h2 >Access Management </h2>
       <hr>
        <hr>
          <div class="searchT">
                    <form  method="POST">
                        <input type="date" name="date">                     
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
         String ID = (String)session.getAttribute("IDs"); //get the ids from login 
         DBManager manager = (DBManager)session.getAttribute("manager");//for use of the dbmanger class
         //String loginD = request.getParameter("date");
         
//         DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
//         java.util.Date dateFormat= formater.parse("date");
//         String dfString = formater.format(dateFormat);
//         String loginY = request.getParameter("searchY");//get the year
//       String loginM = request.getParameter("searchM");//get the mounth value
//      // String loginD = request.getParameter("searchD");//get the date value
        if(request.getParameter("searchT") == null)//if the search button isn't pressed
        {
            //if(loginY ==null || loginM==null||loginD ==null){
           ArrayList<Time> AllTime = manager.getAllTime(ID);//create a list of Time based on the user who is login%>
          
      
      <%
 
             //SearchRecord =    manager.getAllTime();
      for(Time t: AllTime)//loop  
    {%>
    <form action="accessManagament.jsp" method ="POST">
        <table  id ="t01" >      
            <tr>      
             <td width="30%"><%=t.getCustomerID()%></td> 
             <td width="30%"><%=/*/(java.util.Date)*/t.getLoginT()%></td>
             <td width="30%"><%=t.getLogoutT()%></td>     
             
             <input type="hidden" id="loginT" name="loginT" value= <%=t.getLoginT().getTime()/*get the timestamp by the format of millisecond*/%> >
             <td width="10%"><input type="submit" value="delete" name="delete"  ></td>
               
         </tr>
        </table >
        </form>
 <% } 
        }%>
        

                
             
        <%%>
   <% 
  if(request.getParameter("searchT")!=null)
  {
     %>
          
      
      
     <% String loginD = request.getParameter("date");//get the parameter from the calendar 
      String loginAll = loginD + " 00:00:00";//put them all together and give them hour
      String loginBll = loginD + " 23:59:59";//end of the day

            Timestamp ts = Timestamp.valueOf(loginAll);//change into timestamp
            Timestamp ys = Timestamp.valueOf(loginBll);    
            ArrayList<Time> Records = manager.findRecord( ID ,ts,ys);//send them to the ranch 
                 for(Time t: Records)//loop 
      {%>
      
 <form action="accessManagament.jsp" method ="POST">
        <table  id ="t01" >
         
            <tr>
          
             <td width="30%"><%=t.getCustomerID()%></td> 
            <td width="30%"><%=/*/(java.util.Date)*/t.getLoginT()%></td>
             <td width="30%"><%=t.getLogoutT()%></td>     
             <td width="10%"><input type="submit" value="delete" name="delete" ></td>
               <input type="hidden" id="loginT" name="loginT" value= <%=t.getLoginT().getTime()%> >
             
            </tr>
      </table >
</form>  
                <% }
}%>

       <% if(request.getParameter("delete")!=null)
             {  
                 
                  String timestamp = request.getParameter("loginT") ;
                  Timestamp a = new Timestamp(Long.valueOf(timestamp));//turn it back to timestamp 
                  //Timestamp a = Timestamp.valueOf(timestamp); 
                 manager.deleteRecord(ID,a);%><%--delete the databse entry withe the specific info --%>
                 
             <%}%>




       </div>
    </body>
</html>