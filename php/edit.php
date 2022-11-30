<!-- HTML in PHP--> 

<!DOCTYPE html>
<html>
<head>
<style>
table, td, th{
border-collapse: collapse;
border: 3px solid #96a79a;
}
h3
{
	color:'RED';
}
</style>

</head>
<body>
<div class = "container" style = "max-width:50%;">
<div class ="text-center mt-5 mb-4">
Records
</div>
<h5> Note: ItemIDs- AB12, AZ98, BC, EF34, GH56, IJ78, KL47, MN78, OP53, QR86</h5>
<input type = "text" class = "form-control" id = "live_search" autocomplete="off" placeholder = "search....">
</div>
<br><BR>
<div id = "searchResult"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type = "text/javascript">
$(document).ready(function()
{
	$("#live_search").click(function()
		{
		var input = $(this).val();
		if(input !="")
			{
			$.ajax({
					url:"search.php",
					method:"POST",
					data:{input:input},
					success:function(data)
				{
					$("#searchResult").html(data);
						//$("#searchResult").css("display", "block");
				}
			});
		}
		else{
			$("#searchResult").html("");
			//$("#searchResult").css("display", "none");
		}
	});
});
		</script>
</body>
</html>