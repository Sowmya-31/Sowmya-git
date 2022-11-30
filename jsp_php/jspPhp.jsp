<!-- AJAX and MySql -->

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>


<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://165.22.14.77/";
String dbName = "dbSowmyaSri";
String userId = "Sowmya";
String password = "pwdSowmya";
String id = request.getParameter("id");

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM Item where ItemID LIKE '"+id+"%'";
resultSet = statement.executeQuery(sql);
if(!resultSet.isBeforeFirst()) {      
%>
	<p style="color: red ;" >Item not Found!</p>
<%
}
else if(id == "")
	{
	}
else
	{
	%>
	<table cellpadding = "4" cellspacing = "4">
	<thead>
	<tr>
	<th>Item ID</th>
	<th>Description</th>
	<th>Unit Price</th>
	<th>Stock Qty</th>
	<th>Supplier ID</th>
	</tr>
	</thead>
		<%
while(resultSet.next()) {
	%>

	<tbody>
	<tr>
	<td><%=resultSet.getString("ItemID")%></td>
	<td><%=resultSet.getString("Description")%></td>
	<td><%=resultSet.getString("UnitPrice")%></td>
	<td><%=resultSet.getString("StockQty")%></td>
	<td><%=resultSet.getString("SupplierID")%></td>

<%
}
} 
}
catch (Exception e) {
e.printStackTrace();
}
%>

