// Connect MySQL BataBase (DataTable) 

using System;
using System.Data;
using System.Xml;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace ConnectMysql
{
	class Connect
	{
		static void Main()
		{
			try
			{
				string server = "165.22.14.77";
				string dataBase = "dbSowmyaSri";
				string userName = "Sowmya";
				string passWord = "pwdSowmya";
				string port = "3306";
				//string conString = "server=165.22.14.77;user=Sowmya;database=dbSowmyaSri;port=3306;password=pwdSowmya";
				string conString = @"server=" + server + ";"  + "user=" + userName + ";" + "database=" + dataBase + ";" + "port=" + port + ";" + "password=" + passWord + ";" ;
				MySqlConnection conn = new MySqlConnection(conString);
				Console.WriteLine("Connected");
				conn.Open();
				
				MySqlDataAdapter sqlDA = new MySqlDataAdapter("select * from Item", conn);
				DataTable table = new DataTable();
				sqlDA.Fill(table);
				conn.Close();
				foreach (DataRow row in table.Rows)
				{
					Console.WriteLine(row["ItemID"] + "\t" + row["Description"] + "\t" + row["UnitPrice"] + "\t" + row["StockQty"] + "\t" + row["SupplierID"]);
				}
			}
			catch (Exception e)
			{
				Console.WriteLine(e.ToString());
			}
		}	
	}
}