// Connect MySQL BataBase

using System;
using System.Data;
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
				string query = "select * from Item";
				MySqlCommand cmd = new MySqlCommand(query, conn);
				MySqlDataReader reader = cmd.ExecuteReader();
				while(reader.Read())
				{
					//Console.WriteLine(reader["ItemID"]);
					Console.WriteLine("{0} {1} {2} {3} {4}", reader["ItemID"], reader["Description"], reader["UnitPrice"], reader["StockQty"], reader["SupplierID"]);
				}
				conn.Close();
			}
			catch (Exception e)
			{
				Console.WriteLine(e.ToString());

			}
		}	
	}
}