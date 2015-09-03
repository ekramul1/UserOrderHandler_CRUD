<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<style>
header {
   font-size:40px;
   background-color:black;
   color:white;
   text-align:center;
   padding:5px;	
}
section {
   position: absolute;
   top:200px;
   right:450px;
   width: 400px;
   height: 200px;
  
   padding:10px;
    background-size: 300px 350px;
   
   
   }
.hello{
   font-family: "Times New Roman";
   font-size: 30px;
    color: white;
   text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
}
.ch{
 
}

</style>
</head>
<body class=ch>
<header> Welcome to Login Page</header>
<section>
<form  method="POST" action="login">
<p class=hello>Username <input type="text" name="username" value="" placeholder="username  or email"/></p>

<p class=hello>Password <input type="password" name="password" value="" placeholder="password"/></p>
<input type="submit" value="submit"/>
<p><font color="blue">For new User!! </font><a href="register.jsp">Register </a>

</form>
</section>
</body>
</html>