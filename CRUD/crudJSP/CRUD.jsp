<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://165.22.14.77:3306/";
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
out.println("ItemID: " + resultSet.getString("ItemID") + " Description: " + resultSet.getString("Description"));

}

} catch (Exception e) {
e.printStackTrace();
}
%>
