
var request;  
function sendInfo()  
{  
var v=document.vinform.t1.value;  
var url="jspPhp.jsp?id="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var id=request.responseText;  
document.getElementById('amit').innerHTML=id;  
}  
}   




$(document).ready(function()
{
	$("#live_search").click(function()
		{
		var input = $(this).val();
		if(input !="")
			{
			$.ajax({
					url:"http://165.22.14.77/Sowmya/jspPhp.php",
					method:"POST",
					data:{input:input},
					success:function(data)
				{
					$("#searchResult").html(data);

				}
			});
		}
		else{
			$("#searchResult").html("");

		}
	});
});
