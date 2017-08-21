package java_0210;

public class p5 {

    public static void main(String[] args){
    	int number[] = {4,4,2,3,1,4,2,3,1,4,1,2,3,4,2,3,4,1,2,3,1,1,1};
    	int counter[] = new int[5];
    	
    	for(int i=0 ; i < number.length ; i++){
    		counter[number[i]]++;
    	}
    	for(int i=1 ; i < counter.length ; i++){
    		System.out.println(counter[i]);	

    	}

    }
}
