package java_0209;

import java.util.*;

public class random1 {
    public static void main(String[] args) {
    	int[] trust = new int[10];
    	int[] count = new int[10];
    	for(int i=0; i<trust.length; i++){
            System.out.print(trust[i] = (int)(Math.random() * 10)); 
    	}
        System.out.println(); 

        for (int i=0; i < trust.length ; i++ ) { 
              count[trust[i]]++; 
        } 

        for (int i=0; i < trust.length ; i++ ) { 
              System.out.println( i +"ÀÇ °³¼ö :"+ count[i]); 


        } 
        System.out.println(Arrays.toString(trust));
        System.out.println(Arrays.toString(count));
  } 
} 