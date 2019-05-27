<%-- 
    Document   : login1
    Created on : 14/04/2019, 4:18:18 PM
    Author     : Michelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #title{
                text-align: center;
                color: #585858;
            }
            #stitle{
                text-align: left;
                color: #585858;
            }
            
            .border{
                padding: 5px 20px 15px;
                float: center;
                border: 2px solid black;
                border-radius: 5px;
                margin: 0 auto;
                max-width: 300px;
                max-height: 500px;
            }
            
            .border input[type=text], input[type=password]{
                width: 100%;
                padding: 10px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ddd;
                box-sizing: border-box;
            }
            
            .border input[type=submit]{
                width: 100%;
                background-color: #585858;
                padding: 5px;
                color: white;
                cursor: pointer;
                padding: 10px 20px;
                border: 0;
            }
            
            .border input[type=submit]:hover{
                opacity: 0.6;
            }
        </style>
    </head>
    <body>
        <br><br>
        <div class="border">
        <form method="post" action="loginAction.jsp">
            <h3 id="title">Log In</h3>
            <table>
                <tr><td id="stitle">ID</td></tr>
                <tr><td><input type="text" placeholder="Enter ID" name="ID" required></td></tr>
                <tr><td id="stitle">Password</td></tr>
                <tr><td><input type="password" placeholder="Enter password" name="password" required></td></tr>
                <tr><td><input type="submit" value="Log In"></td></tr>
            </table>
        </div>
    </body>
</html>
