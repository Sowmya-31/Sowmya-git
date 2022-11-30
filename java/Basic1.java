import java.util.Scanner;

class Basic1 
{
	public static String variableStatic = "It is Static Variable we can print it directly";
	public String variable = "Non Static Variable";

	public static void dataTypes()
	{
		Scanner scan = new Scanner(System.in);
		System.out.print("Enter your name: ");
		String name = scan.nextLine();
		System.out.print("Enter your age: ");
		int age = scan.nextInt();
		System.out.print("Enter your Gender(M or F): ");
		char Gender = scan.next().charAt(0);
		System.out.print("10th percentage: ");
		double percentage = scan.nextDouble();
		System.out.println("Data" + name + " " + age + " " + Gender + " " + percentage);
		System.out.println("Practicing data types completed"); 
	}

	public void nonStaticMethod()
	{
		System.out.println("Non static method executed successfully");
	}

	public static void staticMethod()
	{
		System.out.println("Static method executed successfully");
	}

	public static String methodWithReturn()
	{
		String variable = "returning data";
		return variable;
	}

	public static void main()
	{
		System.out.println("Here we are overloading the main method");
	}

	public static void main(String[] args) 
	{
		System.out.println(variableStatic);
		//Object creation
		Basic1 Basic = new Basic1();
		System.out.println(Basic.variable);
		Basic.nonStaticMethod();
		staticMethod();
		String variable = methodWithReturn();
		System.out.println(variable);
		main();

		System.out.println("-----");
		System.out.println("Inheritance");
		SubClass subClassObj  = new SubClass();
		subClassObj.subClassMethod();
		System.out.println("-----");

		System.out.println("-----");
		dataTypes();
		System.out.println("-----");
	}
}

class SuperClass
{
	String variable = "Super class variable";
	public void SuperClassMethod1()
	{
		System.out.println("Super class method Executed successfully");
	}
	public void SuperClassMethod2()
	{
		System.out.println("Trying to override this method");
	}
	public static void SuperClassMethod3()
	{
		System.out.println("Can't override static method");
	}
}

class Super extends SuperClass
{
	public void SuperClassMethod2()
	{
		System.out.println("overrided super class method in sub class");
	}
	public static void SuperClassMethod3()
	{
		System.out.println("Overrided static method");
	}
}

class Super2 extends Super
{
}

class SubClass extends Super2
{
	public void subClassMethod()
	{
		SuperClassMethod1();
		SuperClassMethod2();
		SuperClassMethod3();
		System.out.println("Sub class executed successfully");
	}
}