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
         String ID = (String)session.getAttribute("IDs"); //
         DBManager manager = (DBManager)session.getAttribute("manager");
         //String loginD = request.getParameter("date");
         
//         DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
//         java.util.Date dateFormat= formater.parse("date");
//         String dfString = formater.format(dateFormat);
//         String loginY = request.getParameter("searchY");//get the year
//       String loginM = request.getParameter("searchM");//get the mounth value
//      // String loginD = request.getParameter("searchD");//get the date value
        if(request.getParameter("searchT") == null)
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
             
             <input type="hidden" id="loginT" name="loginT" value= <%=t.getLoginT().getTime()%> >
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
      // DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        // java.util.Date dateFormat= formater.parse("date");
         //String dfString = formater.format(dateFormat);
      String loginD = request.getParameter("date");//get the parameter from the calendar 
//       String loginY = request.getParameter("searchY");//get the year
//       String loginM = request.getParameter("searchM");//get the mounth value
//       String loginD = request.getParameter("searchD");//get the date value
//       if(loginY ==null || loginM==null||loginD ==null)
//       {
  //String loginAll ="2019-01-01 00:00:00";
  //String loginBall ="2019-12-02 23:59:59";
//            Timestamp ts = Timestamp.valueOf(loginAll);
//            Timestamp ys = Timestamp.valueOf(loginBall);
//            
//       }
//       
      String loginAll = loginD + " 00:00:00";//put them all together and give them hour
      String loginBall = loginD + " 23:59:59";//end of the day
//     // System.out.println(loginsll);
//       //String loginBall = loginY+"-"+loginM+"-"+loginD;
//       
            Timestamp ts = Timestamp.valueOf(loginAll);//change into timestamp
            Timestamp ys = Timestamp.valueOf(loginBall);    
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
                  Timestamp a = new Timestamp(Long.valueOf(timestamp));
                  //Timestamp a = Timestamp.valueOf(timestamp); 
                 manager.deleteRecord(ID,a);%>
                 
             <%}%>




       </div>
    </body>
</html>