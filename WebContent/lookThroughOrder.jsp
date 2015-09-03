<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import=" javax.servlet.http.HttpServletRequest"%>
<%@ page import=" javax.servlet.http.HttpServletResponse"%>
<html>
<head>
<script>
function  hell()
{
	window.print();
	
	}
</script>
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
<header>
Order Details:
</header>
<section>

<%int val = Integer.parseInt(request.getParameter("Id"));%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/CustomerInfo"
    user="root"  password="pass"/>
    
<sql:query dataSource="${snapshot}" var="result">
SELECT  *from OrderItems 
  where empId =<%= val %>  AND itemName != "NULL" ORDER BY orderId ;
  </sql:query>
<sql:query dataSource="${snapshot}" var="result1">
SELECT SUM(cost) As TotalPrice from OrderItems where empId=<%=val %>;
</sql:query>
<p>Customer :     </p>
<p></p>
 <c:out value="${row.empId}"/>
<table width="600" length="400" border="1" >
<tr>
  
  <th>Order Id</th>
  <th>Item Name</th>
  <th>quantity</th>
  <th>Price of item</th>
  <th>Cost</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
  
  <td><c:out value="${row.orderId}"/>
  <td><c:out value="${row.itemName}"/>
  <td><c:out value="${row.Quantity}"/>
  <td><c:out value="${row.Price}"/>
  <td><c:out value="${row.cost}"/>
</tr>
</c:forEach>

 </table>
 <form>
 <input type="button" value="Print" onclick="hell();"/>
 </form>
</section>
<p> Total Amount is: 
<c:forEach var="row" items="${result1.rows}">
<c:out value="${row.TotalPrice }"/>
</c:forEach>
</p>


</body>
</html>