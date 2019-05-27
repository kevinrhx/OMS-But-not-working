<%-- 
    Document   : register_staff
    Created on : 19/04/2019, 11:06:31 AM
    Author     : Bruce Moon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Registration Page</title>
        <style>
            #title{
                text-align: center;
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
        <form method="post" action="Main.jsp">
            <h3 id="title">Create an Account</h3>
            <table>
                <tr><td>Email</td></tr>
                <tr><td><input type="text" name="email" required></td></tr>
                <tr><td>Full name</td></tr>
                <tr><td><input type="text" name="name" required></td></tr>
                <tr><td>Password</td></tr>
                <tr><td><input type="password" name="password" required></td></tr>
                <tr><td>Phone</td></tr>
                <tr><td><input type="text" name="phone" required></td></tr>
                <tr><td>Address</td></tr>
                <tr><td><input type="text" name="address" required></td></tr>
                <tr><td>Role</tr>
                 <td> 
                        <select name="role">
                       <option value="Staff">Staff</option>
                       <option value="Admin">Admin</option>
                        </select>
                 </td>
                 <tr></tr>
                <td><input type="hidden" name="userType" value="staff"></td>   
                <td><input type="hidden" name="submitted" value="yes"></td>
                <tr><td><input type="submit" value="Register"></td></tr>
            </table>
        </form></div>
    </body>
</html>
