using System;

abstract class PublicAS
{
 public abstract void Read();

}

class PrivateAS : PublicAS
{
	public void Read()
	{
		Console.WriteLine("Read a Book");
	}
	private int number = 5;
	private void Play()
	{
		Console.WriteLine("Play chess");
	}
	public void Main()
	{
		PrivateAS pas = new PrivateAS();
		pas.Read();
		Console.WriteLine(pas.number);
		pas.Play();
	}
}

class ProtectedAS
{
	protected void Listen()
	{
		Console.WriteLine("Listen Music");
	}
}

class Child : ProtectedAS
{
	public static void Main()
	{
		Child child = new Child();
		child.Listen();
	}
}