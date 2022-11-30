import com.chilkatsoft.CkZip;

public class Test {
	
  static {
    try {
    	System.load("v:/training/java/dll.dll");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load.\n" + e);
      System.exit(1);
    }
  }

  public static void main(String argv[]) 
  {
    CkZip zip = new CkZip();
    System.out.println(zip.version());    
  }
}