<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<style>
header {
   font-size:40px;
   background-color:green;
   color:white;
   text-align:center;
   padding:5px;	
}
section {
   width:350px;
   float:left;
   padding:10px;
   }
</style>
</head>
<body>

<%int val=Integer.parseInt(request.getParameter("Id").replaceAll("/","")); %>

<%String  f1name = request.getParameter("fn").replaceAll("/",""); %>
<%String  f2name= request.getParameter("ln"); %>


<header> USER DETAILS</header>

<section>
<h2>Enter the updated value: </h2>

<form method="POST" action="editPop">
<input type="hidden"  name="empId" value=<%= val%>/>
FirstName:<input type="text" name= "firstName" value=<%= f1name%>/>
<br><br>
LastName:<input type="text" name= "lastName" value=<%= f2name%> />
<br><br>
  <input type="submit" value="update"/>
</form>


</section>
</body>
</html>