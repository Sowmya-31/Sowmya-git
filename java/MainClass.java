import java.util.Scanner;
import MyPackCRUD.CrudMethods;

class MainClass
	{ 
		public static void main(String[] args)
		{
			CrudMethods cm = new CrudMethods();
			while(1 == 1)
			{
				System.out.print("Enter your choice: ");
				Scanner scannerObject = new Scanner(System.in);
				try
				{
					int choice = scannerObject.nextInt();
					switch (choice)
					{
					case 1:
						cm.Create();
					break;
					case 2:
						cm.Read();
					break;
					case 3:
						cm.Search();
					break;
					case 4:
						cm.Update();
					break;
					case 5:
						cm.Delete();
					break;
					case 6:
						cm.Exit();
					default:
						System.out.println("Invalid Choice!");
				}
				}
				catch (java.util.InputMismatchException e)
				{
						System.out.println("Invalid Choice!");
				}	
			}
		}
	}