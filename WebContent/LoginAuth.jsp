<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<style>
header {
 font-size:40px;
 background-color:grey;
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
<%String u= request.getParameter("username"); %>
<%String p= request.getParameter("password"); %>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/CustomerInfo"
  user="root"  password="pass"/>

<sql:query dataSource="${snapshot}" var="count">
SELECT * from Register where UserName="<%=u%>" AND PassWord=password("<%=p%>");
</sql:query>

<c:forEach var="row" items="${count.rows}">


<c:choose>
<c:when test="${row.UserName!= null}">
  
 <%response.sendRedirect("index.html"); %>
</c:when>
<c:otherwise>
User Authentication failed!!!!
<% response.sendRedirect("index.jsp");%>
</c:otherwise>
</c:choose>
</c:forEach>
</section>

</body>
</html>