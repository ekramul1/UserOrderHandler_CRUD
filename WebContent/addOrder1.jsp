<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
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
<script>
function  hell()
{
	window.print();
	
	}
</script>
</head>
<%  int price=0; %>
<% int cost[]=new int[7];%>
<% int totalprice[]=new int[7]; %>
<%int quant[]= new int[7]; %>
<%int m=0; %>
<% String item[]= new String[7];%>  
<body> 
<header> USER DETAILS</header>

<section>

 
<%int Id=Integer.parseInt(request.getParameter("Id").replaceAll("\0", " ")); %>
<% int orderId= random.nextInt(20); %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/CustomerInfo"
  user="root"  password="pass"/>

   
 <%
 if(request.getParameter("Bike")!=null)
 {   
	 int n= Integer.parseInt(request.getParameter("Bikes"));
	 price+=n*20;
	 cost[m]=20;
	 totalprice[m]=n*20;
	 item[m]="Bike";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Car")!=null)
 {   
	 int n= Integer.parseInt(request.getParameter("Cars"));
	 price+=n*200;
	 cost[m]=200;
	 totalprice[m]=n*200;
	 item[m]="Car";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Pen")!=null)
 {
	 int n= Integer.parseInt(request.getParameter("Pens"));
	 price+=n*10;
	 cost[m]=10;
	 totalprice[m]=n*10;
	 item[m]="Pen";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Pencil")!=null)
 {
	 int n= Integer.parseInt(request.getParameter("Pencils"));
	 price+=n*5;
	 cost[m]=5;
	 totalprice[m]=n*5;
	 item[m]="Pencil";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Mobile")!=null)
 {
	 int n= Integer.parseInt(request.getParameter("Mobiles"));
	 price+=n*5000;
	 cost[m]=5000;
	 totalprice[m]=n*5000;
	 item[m]="Mobile";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Bedsheet")!=null)
 {
	 int n= Integer.parseInt(request.getParameter("Bedsheets"));
	 price+=n*1000;
	 cost[m]=1000;
	 totalprice[m]=n*1000;
	 item[m]="Bedsheet";
	 quant[m]=n;
     ++m;
 }
 if(request.getParameter("Cover")!=null)
 {
	 int n= Integer.parseInt(request.getParameter("Covers"));
	 cost[m]=100;
	 price+=n*100;
	 totalprice[m]=n*10;
	 item[m]="Cover";
	 quant[m]=n;
     ++m;
 }
 %>
 <%int j=-1; %>
 <c:forEach begin="1" end="<%=item.length %>">
 <%j=j+1; %>
 <sql:update dataSource="${snapshot}" var="result">
  INSERT  INTO OrderItems VALUES (<%=Id %>,<%=orderId%>,"<%=item[j]%>",<%=quant[j]%>,<%=cost[j]%>,<%=totalprice[j]%>);
  </sql:update>
  
</c:forEach> 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from OrderItems 
  where empId =<%= Id %> AND  orderId=<%=orderId %> AND itemName!= "NULL" ;

</sql:query>
<table border="1" >
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
<br>
Order has been made! Total Price is <%=price%> !! Thankyou.. 
</section>

</body>

</html>