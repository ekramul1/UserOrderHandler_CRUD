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

<header> USER DETAILS</header>

<section>
<%String fname= request.getParameter("firstName").replaceAll("/",""); %>
<%String lname= request.getParameter("lastName"); %>
<%int id=Integer.parseInt(request.getParameter("empId").replaceAll("/","")); %>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/CustomerInfo"
    user="root"  password="pass"/>

 <sql:update dataSource="${snapshot}" var="count">
  UPDATE Person SET firstName="<%=fname %>" ,  lastName="<%=lname %>"
   WHERE empId = <%= id %>
 </sql:update>
 <p>Update Successful</p>
</section>
</body>
</html>