<?php

require 'DB.php';

if(isset($_POST['save_Item']))
{
	$ItemID = mysqli_real_escape_string($con, $_POST['ItemID']);
    $Description = mysqli_real_escape_string($con, $_POST['Description']);
    $Supplier = mysqli_real_escape_string($con, $_POST['Supplier']);
    $Stock = mysqli_real_escape_string($con, $_POST['Stock']);
    $Price = mysqli_real_escape_string($con, $_POST['Price']);

    if($ItemID == NULL || $Description == NULL || $Supplier == NULL || $Stock == NULL || $Price == NULL)
    {
        $res = [
            'status' => 422,
            'message' => 'All fields are mandatory'
        ];
        echo json_encode($res);
        return false;
    }

    $query = "INSERT INTO Item (ItemID,Description,SupplierID,StockQty,UnitPrice) VALUES ('$ItemID','$Description','$Supplier','$Stock','$Price')";
    $query_run = mysqli_query($con, $query);

    if($query_run)
    {
        $res = [
            'status' => 200,
            'message' => 'Item Created Successfully'
        ];
        echo json_encode($res);
        return false;
    }
    else
    {
        $res = [
            'status' => 500,
            'message' => 'Item Not Created'
        ];
        echo json_encode($res);
        return false;
    }
}


if(isset($_POST['update_Item']))
{
    $ItemID = mysqli_real_escape_string($con, $_POST['ItemID']);
    $Description = mysqli_real_escape_string($con, $_POST['Description']);
    $Supplier = mysqli_real_escape_string($con, $_POST['Supplier']);
    $Stock = mysqli_real_escape_string($con, $_POST['Stock']);
    $Price = mysqli_real_escape_string($con, $_POST['Price']);

    if($Description == NULL || $Supplier == NULL || $Stock == NULL || $Price == NULL)
    {
        $res = [
            'status' => 422,
            'message' => 'All fields are mandatory'
        ];
        echo json_encode($res);
        return false;
    }

    $query = "UPDATE Item SET Description='$Description', SupplierID='$Supplier', StockQty='$Stock', UnitPrice='$Price' 
                WHERE ItemID='$ItemID'";
    $query_run = mysqli_query($con, $query);

    if($query_run)
    {
        $res = [
            'status' => 200,
            'message' => 'Item Updated Successfully'
        ];
        echo json_encode($res);
        return false;
    }
    else
    {
        $res = [
            'status' => 500,
            'message' => 'Item Not Updated'
        ];
        echo json_encode($res);
        return false;
    }
}


if(isset($_GET['ItemID']))
{
    $ItemID = mysqli_real_escape_string($con, $_GET['ItemID']);
	

    $query = "SELECT * FROM Item WHERE ItemID='$ItemID'";
    $query_run = mysqli_query($con, $query);

    if(mysqli_num_rows($query_run) == 1)
    {
        $Item = mysqli_fetch_array($query_run);

        $res = [
            'status' => 200,
            'message' => 'Item Fetch Successfully by ID',
            'data' => $Item
        ];
        echo json_encode($res);
        return false;
    }
    else
    {
        $res = [
            'status' => 404,
            'message' => 'Item ID Not Found'
        ];
        echo json_encode($res);
        return false;
    }
}

if(isset($_POST['deleteItem']))
{
    $ItemID = mysqli_real_escape_string($con, $_POST['ItemID']);

    $query = "DELETE FROM Item WHERE ItemID='$ItemID'";
    $query_run = mysqli_query($con, $query);

    if($query_run)
    {
        $res = [
            'status' => 200,
            'message' => 'Item Deleted Successfully'
        ];
        echo json_encode($res);
        return false;
    }
    else
    {
        $res = [
            'status' => 500,
            'message' => 'Item Not Deleted'
        ];
        echo json_encode($res);
        return false;
    }
}

?>