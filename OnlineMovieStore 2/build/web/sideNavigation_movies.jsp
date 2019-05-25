<%-- 
    Document   : sideNavigation_movies
    Created on : May 15, 2019, 6:00:22 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        .side-menu li{
            display: block;
            font-size: 18px;
            line-height: 2.4em;
            border-bottom: dotted 1px #ddd;
            color:white;
        }
        .side-menu li:last-child{
           border-bottom: none;
        }
        
        .side-menu li:first-child{
            text-decoration: none;
            text-align: center;
            color: white;
            font-weight: bold;
        }
        .side-menu li a{
            text-decoration: none;
            color: white;
        }
        .side-menu li a:hover{
            background: #f7c08a;
            color: #333;
            padding: 10px 20px;
            
        }
        
        
    </style>
    <body>
        <div class="container">
            <section class="content">
                <div class="box">  <h5> No country for old men </h5> </div>
            </section>
            <aside class="sidebar">
                <ul class="side-menu">
                    <li>Movie Genres</li>
                    <li><a href="#">Action</button></li>
                    <li><a href="#">Children</li>
                    <li><a href="#">Comedy</li>
                    <li><a href="#">Documentary</li>
                    <li><a href="#">Drama</li>
                    <li><a href="#">Family</li>
                    <li><a href="#">Science Fiction</li>
                    <li><a href="#">Sport</li>
                </ul>
            </aside>
            
        </div>
    </body>
</html>
