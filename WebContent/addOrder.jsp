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

<%int val= Integer.parseInt(request.getParameter("Id")); %>

<header>CREATE YOUR ORDER </header>

<section>
Enter the name of item to be added:
<br> <br>
<form method="POST" action="order">
<input type="hidden" name="Id" value=<%=val %> />
<table border=1>

<tr>
<th>add items</th>
<th>Quantity</th>
</tr>
<tr>
<td><input type="checkbox" name="Bike" value="Bike">Bike</td>
<td><input type="number"  name="Bikes" value=""/>
</td>
</tr>
<tr>
<td><input type="checkbox" name="Car" value="Car">Car</td>
<td><input type="number"  name="Cars" value=""/></td>
</tr>
<tr>
<td><input type="checkbox" name="Pen" value="Pen">Pen</td>
<td><input type="number"  name="Pens" value=""/></td>
</tr>
<tr>
<td><input type="checkbox" name="Pencil" value="Pencil">Pencil</td>
<td><input type="number"  name="Pencils" value=""/></td>
</tr>
<tr>
<td><input type="checkbox" name="Mobile" value="Mobile">Mobile</td>
<td><input type="number"  name="Mobiles" value=""/></td>
</tr>
<tr>
<td><input type="checkbox" name="Bedsheet" value="Bedsheet">Bedsheet</td>

<td><input type="number"  name="Bedsheets" value=""/></td>
</tr>
<tr>
<td><input type="checkbox" name="Cover" value="Cover">Cover</td>
<td><input type="number"  name="Covers" value=""/></td>
</tr>

</table>


<footer>
<input type="submit" value="AddItem"/>
</footer>
</form>


 
</section>
</body>
</html>
