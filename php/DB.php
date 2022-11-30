<!-- Connect to MySQL using PHP -->

<?php
$servername = "165.22.14.77";
$username = "Sowmya";
$password = "pwdSowmya";
$dbname = "dbSowmyaSri";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
	//echo "Connection Successful."."<br>";



?>
