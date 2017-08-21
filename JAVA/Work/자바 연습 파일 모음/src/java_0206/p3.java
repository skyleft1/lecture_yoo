package java_0206;

public class p3 {
    public static void main(String[] args) {
    	double he = 180.0 ; 
    	double we = 75.4 ;
    	double bmi = we / (he*he);


    	System.out.println("키와 몸무게를 입력하시오. [예시 : 182.4 75.5]");
    	System.out.println(he+" "+we);
    if (bmi < 18 )
    			System.out.println("저체중 입니다.");
    		else if(bmi < 23 )
    			System.out.println("정상 입니다.");
    		else
    		System.out.println("과체중 입니다.");
    }
}