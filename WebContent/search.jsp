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

div.relative {
   position: relative;
   left: 30px;
   
}
section {
   width:350px;
   float:left;
   padding:10px;
   }
footer {
   background-color:grey;
   color:white;
   clear:both;
   text-align:center;
   padding:15px;	
}
</style>
</head>
<body>
<header> USER DETAILS
<div class="relative">
<form method="post" action="searchDetails">
<input type="text" name="search" value=""/>
<input type="submit" value="search"/>
</form>
</div>
</header>
<section>
<%String search=request.getParameter("search");%>
<%-- <% int id= Integer.parseInt(search);%> --%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/CustomerInfo"
    user="root"  password="pass"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from Person where empId LIKE '%<%=search %>%' OR
        firstName LIKE '%<%=search %>%' OR lastName LIKE '%<%=search %>%';
</sql:query>

<table width ="1260" border="1">
<tr>
   <th>Customer ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.empId}"/></td>
   <td><c:out value="${row.firstName}"/></td>
   <td><c:out value="${row.lastName}"/></td>
   <td><c:url value="deleteUser.jsp" var="url">
                                <c:param name="Id" value="${row.empId}" />
                            </c:url> <a href="${url}">delete</a></td>
   <td><c:url value="editUser.jsp" var="url">
                                <c:param name="Id" value="${row.empId}" />
                                <c:param name="fn" value="${row.firstName}" />
                                <c:param name="ln" value="${row.lastName}" />
                            </c:url>  <a href='#' onclick='javascript:window.open("${url}", "_blank", "scrollbars=1,resizable=1,height=300,width=450");' title='UserInputs'>Edit</a>
   <td><c:url value="lookThroughOrder.jsp" var="url">
                                <c:param name="Id" value="${row.empId}" />
                            </c:url> <a href='#' onclick='javascript:window.open("${url}", "_blank", "scrollbars=1,resizable=1,height=300,width=450");' title='ORDERS'>view</a>
   </tr>
</c:forEach>
</table>
 
 </section>
</body>
</html>