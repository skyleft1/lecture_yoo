package java_0210;

public class p2 {
    public static void main(String[] args) {
    	int h = 0;
    	for(int i=1 ; i<11 ; i++){
    		h = i;
    		for(int j=i ; j <10+i; j++){
    			
                System.out.print((j<10)? h++ : h--); 
    		}
            System.out.println(); 
    	}
    }
}