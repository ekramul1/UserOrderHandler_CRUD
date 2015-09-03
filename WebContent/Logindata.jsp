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

<header> USER DETAILS</header>

<section>
<%String firname= request.getParameter("firstname"); %>
<%String lasname= request.getParameter("lastname"); %>
<%String usename= request.getParameter("username"); %>
<%String passwd= request.getParameter("password"); %>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/CustomerInfo"
  user="root"  password="pass"/>

<sql:update dataSource="${snapshot}" var="count">
INSERT  INTO Register Values("<%=firname %>" ,"<%=lasname %>","<%=usename %>", password("<%= passwd %>"));
</sql:update>
<p>You Are Registered NOW!! <a href="index.jsp">login now</a></p>
</section>

</body>
</html>