package p0228;

public class exercise1 {
	public static void main(String args[]) throws Exception { 
		int number = 100; 
		int result = 0; 
		for(int i=0; i < 10; i++) {
			try {
				result = number / (int)(Math.random() * 10); 
				 throw new Exception(); 
			}
			catch (Exception e) 	

			{  e.printStackTrace();
				System.out.println(); 
				System.err.println();
			}
			System.out.println(result); 
	      } 
	}
}