package java_0206;

public class p3 {
    public static void main(String[] args) {
    	double he = 180.0 ; 
    	double we = 75.4 ;
    	double bmi = we / (he*he);


    	System.out.println("Ű�� �����Ը� �Է��Ͻÿ�. [���� : 182.4 75.5]");
    	System.out.println(he+" "+we);
    if (bmi < 18 )
    			System.out.println("��ü�� �Դϴ�.");
    		else if(bmi < 23 )
    			System.out.println("���� �Դϴ�.");
    		else
    		System.out.println("��ü�� �Դϴ�.");
    }
}