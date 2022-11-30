<!-- PHP to Search Suggestion -->

<?php

header('Access-Control-Allow-origin:*');
$servername = "165.22.14.77";
$username = "Sowmya";
$password = "pwdSowmya";
$dbname = "dbSowmyaSri";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
	//echo "Connection Successful."."<br>";


if(isset($_POST['input'])){
	$input = $_POST['input'];
	$query = "SELECT * FROM Item WHERE ItemID LIKE '{$input}%'";
	$result = mysqli_query($conn,$query);
	$SQL = mysqli_num_rows($result);
	if($SQL > 0){?>
	<table class = "table table-bordered table-striped mt-4"  cellpadding = "4" cellspacing = "4" style = "border:3px dashed green">
	<thead>
	<tr>
	<th>Item ID</th>
	<th>Description</th>
	<th>Supplier ID</th>
	<th>Stock Qty</th>
	<th>Unit Price</th>
	</tr>
	</thead>
	<tbody>
	<?php
	while($row = mysqli_fetch_assoc($result)){
		$id = $row['ItemID'];
		$name = $row['Description'];
		$supplier = $row['SupplierID'];
		$stock = $row['StockQty'];
		$price = $row['UnitPrice'];
		?>

		<tr>
		<td><?php echo $id; ?></td>
		<td><?php echo $name; ?></td>
		<td><?php echo $supplier; ?></td>
		<td><?php echo $stock; ?></td>
		<td><?php echo $price; ?></td>
		</tr>
<?php
		}
	}
	else
	{
		echo "<h3 class = 'text-danger taxt-center mt-3' >Item not Found</h3>";
	}
}
?>