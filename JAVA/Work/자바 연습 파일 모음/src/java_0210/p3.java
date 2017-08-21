package java_0210;

public class p3 {

    public static void main(String[] args) {
    	int aa[] = new int [35];
    	for(int i=0 ; i<aa.length; i++){
    	aa[i] = i+1;
    	}
    	
    	int temp = 0;
    	int j = 0;
    	for(int i=0; i < 1000; i++){
        	j = (int)(Math.random()*35);
        	temp = aa[0];
        	aa[0] = aa[j];
        	aa[j] = temp;
        	
    	}

    	for(int i=0; i<6 ; i++){
        	System.out.print(aa[i]+" ");
    	}
    }
}