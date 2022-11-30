<!-- CRUD.php -->


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>PHP CRUD using jquery ajax without page reload</title>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
</head>
<body>

<!-- Add Item -->
<div class="modal fade" id="ItemAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Item</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="saveItem">
            <div class="modal-body">
                <div id="errorMessage" class="alert alert-warning d-none"></div>
				<div class="mb-3">
                    <label for="">Item ID</label>
                    <input type="text" name="ItemID" class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="">Description</label>
                    <input type="text" name="Description" class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="">Supplier ID</label>
                    <input type="text" name="Supplier" class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="">Stock Quantity</label>
                    <input type="text" name="Stock" class="form-control" />
                </div>
				<div class="mb-3">
                    <label for="">Unit Price</label>
                    <input type="text" name="Price" class="form-control" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Save Item</button>
            </div>
        </form>
        </div>
    </div>
</div>

<!-- Edit Item Modal -->
<div class="modal fade" id="ItemEditModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Item</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="updateItem">
            <div class="modal-body">

                <div id="errorMessageUpdate" class="alert alert-warning d-none"></div>

               <input type="hidden" name="ItemID" id="ItemID" >
				<!-- <div class="mb-3">
				                    <label for="">ItemID</label>
				                    <input type="text" name="ItemID" id="ItemID" class="form-control" />
				                </div> -->

                <div class="mb-3">
                    <label for="">Description</label>
                    <input type="text" name="Description" id="Description" class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="">Supplier ID</label>
                    <input type="text" name="Supplier" id="Supplier" class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="">Stock Quantity</label>
                    <input type="text" name="Stock" id="Stock" class="form-control" />
                </div>
				<div class="mb-3">
                    <label for="">Unit Price</label>
                    <input type="text" name="Price" id="Price" class="form-control" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Update Item</button>
            </div>
        </form>
        </div>
    </div>
</div>

<!-- View Item Modal -->
<div class="modal fade" id="ItemViewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">View Item</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
            <div class="modal-body">

                <div class="mb-3">
                    <label for="">ItemID</label>
                    <p id="view_ItemID" class="form-control"></p>
                </div>
				<div class="mb-3">
                    <label for="">Description</label>
                    <p id="view_Description" class="form-control"></p>
                </div>
                <div class="mb-3">
                    <label for="">Supplier ID</label>
                    <p id="view_Supplier" class="form-control"></p>
                </div>
                <div class="mb-3">
                    <label for="">Stock Quantity</label>
                    <p id="view_Stock" class="form-control"></p>
                </div>
				<div class="mb-3">
                    <label for="">Unit Price</label>
                    <p id="view_Price" class="form-control"></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>PHP Ajax CRUD without page reload using Bootstrap
                        
                        <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#ItemAddModal">
                            Add Item
                        </button>
                    </h4>
                </div>
                <div class="card-body">

                    <table id="myTable" class="table table-bordered table-striped" data-bs-dismiss="modal">
                        <thead>
                            <tr>
                                <th>Item ID</th>
                                <th>Description</th>
                                <th>Supplier ID</th>
                                <th>Stock Quantity</th>
                                <th>Unit Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            require 'DB.php';

                            $query = "SELECT *, 'View', 'Edit', 'Delete' FROM Item";
                            $query_run = mysqli_query($con, $query);

                            if(mysqli_num_rows($query_run) > 0)
                            {
                                foreach($query_run as $Item)
                                {
                                    ?>
                                    <tr>
                                        <td><?= $Item['ItemID'] ?></td>
                                        <td><?= $Item['Description'] ?></td>
                                        <td><?= $Item['SupplierID'] ?></td>
                                        <td><?= $Item['StockQty'] ?></td>
                                        <td><?= $Item['UnitPrice'] ?></td>
                                        <td>
                                            <button type="button" value="<?=$Item['ItemID'];?>" class="viewItemBtn btn btn-info btn-sm" data-bs-dismiss="modal"><?= $Item['View'] ?></button>
                                            <button type="button" value="<?=$Item['ItemID'];?>" class="editItemBtn btn btn-success btn-sm" data-bs-dismiss="modal"><?= $Item['Edit'] ?></button>
                                            <button type="button" value="<?=$Item['ItemID'];?>" class="deleteItemBtn btn btn-danger btn-sm" data-bs-dismiss="modal"><?= $Item['Delete'] ?></button>
                                        </td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                            
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	

    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <script>
        $(document).on('submit', '#saveItem', function (e) {
            e.preventDefault(); //Prevent the page reload

            var formData = new FormData(this);
            formData.append("save_Item", true);

            $.ajax({
                type: "POST",
                url: "code.php",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    
                    var res = $.parseJSON(response);
                    if(res.status == 422) {
                        $('#errorMessage').removeClass('d-none');
                        $('#errorMessage').text(res.message);

                    }else if(res.status == 200){

                        $('#errorMessage').addClass('d-none');
                        $('#ItemAddModal').modal('hide');
                        $('#saveItem')[0].reset();

                        alertify.set('notifier','position', 'top-right');
                        alertify.success(res.message);

                        $('#myTable').load(location.href + " #myTable");

                    }else if(res.status == 500) {
                        alert(res.message);
                    }
                }
            });

        });

        $(document).on('click', '.editItemBtn', function () {

			var ItemID = $(this).val();
            $.ajax({
                type: "GET",
                url: "code.php?ItemID=" + ItemID,
                success: function (response) {
				
                    var res = $.parseJSON(response);
					
                    if(res.status == 404) {
                        alert(res.message);
                    }else if(res.status == 200){
                        $('#ItemID').val(res.data.ItemID);
                        $('#Description').val(res.data.Description);
                        $('#Supplier').val(res.data.SupplierID);
                        $('#Stock').val(res.data.StockQty);
                        $('#Price').val(res.data.UnitPrice);

                        $('#ItemEditModal').modal('show');
                    }

                }
            });

        });

        $(document).on('submit', '#updateItem', function (e) {
            e.preventDefault();

            var formData = new FormData(this);
            formData.append("update_Item", true);

            $.ajax({
                type: "POST",
                url: "code.php",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    
                    var res = $.parseJSON(response);
                    if(res.status == 422) {
                        $('#errorMessageUpdate').removeClass('d-none');
                        $('#errorMessageUpdate').text(res.message);

                    }else if(res.status == 200){

                        $('#errorMessageUpdate').addClass('d-none');

                        alertify.set('notifier','position', 'top-right');
                        alertify.success(res.message);
                        
                        $('#ItemEditModal').modal('hide');
                        $('#updateItem')[0].reset();
                        $('#myTable').load(location.href + " #myTable");
                    }else if(res.status == 500) {
                        alert(res.message);
                    }
                }
            });

        });

        $(document).on('click', '.viewItemBtn', function () {

            var ItemID = $(this).val();
            $.ajax({
                type: "GET",
                url: "code.php?ItemID=" + ItemID,
                success: function (response) {

                    var res = $.parseJSON(response);
                    if(res.status == 404) {

                        alert(res.message);
                    }else if(res.status == 200){

                        $('#view_ItemID').text(res.data.ItemID);
						$('#view_Description').text(res.data.Description);
                        $('#view_Supplier').text(res.data.SupplierID);
                        $('#view_Stock').text(res.data.StockQty);
                        $('#view_Price').text(res.data.UnitPrice);

                        $('#ItemViewModal').modal('show');
                    }
                }
            });
        });

        $(document).on('click', '.deleteItemBtn', function (e) {
            e.preventDefault();

            if(confirm('Are you sure you want to delete this data?'))
            {
                var ItemID = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "code.php",
                    data: {
                        'deleteItem': true,
                        'ItemID': ItemID
                    },
                    success: function(response) {

                        var res = $.parseJSON(response);
                        if(res.status == 500) {

                            alert(res.message);
                        }else{
                            alertify.set('notifier','position', 'top-right');
                            alertify.success(res.message);

                            $('#myTable').load(location.href + " #myTable");
                        }
                    }
                });
            }
        });

    </script>

</body>
</html>