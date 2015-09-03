
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<style>
header {
   font-size:40px;
   background-color:orange;
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

<header> USER DETAILS</header>

<section>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/CustomerInfo"
    user="root"  password="pass"/>

 <sql:update dataSource="${snapshot}" var="count">
  DELETE FROM Person WHERE empId = <%= val %>;
 </sql:update>

<jsp:include page="viewAllUserData.jsp" />  
</section>
</body>
</html>