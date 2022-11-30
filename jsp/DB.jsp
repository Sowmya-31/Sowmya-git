
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://165.22.14.77/";
String dbName = "dbSowmyaSri";
String userId = "Sowmya";
String password = "pwdSowmya";

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
String sql = "SELECT * FROM Item";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
out.write(resultSet.getString("ItemID") );
out.write(resultSet.getString("Description") );
out.write(resultSet.getString("UnitPrice") );
out.write(resultSet.getString("SupplierID") );

}

} catch (Exception e) {
e.printStackTrace();
}
%>
