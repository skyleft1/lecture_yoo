package p0305;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class SetDemo {
    public static void main(String[] args) {
    	HashSet<Integer> A = new HashSet<Integer>();
    	A.add(1);
    	A.add(2);
    	A.add(3);

    	HashSet<Integer> B = new HashSet<Integer>();
    	A.add(2);
    	A.add(3);
    	A.add(4);
    	
    		System.out.println(A.containsAll(B));
    	}
    	
    	
    }
