package Fx_Exercise;

import java.util.*;
import java.math.BigInteger;


class F0306 {

	public static void main(String[] args) {
	    BigInteger sisterBirth = new BigInteger("19891206");
	    BigInteger myBirth = new BigInteger("19940628");
	    

	    System.out.println("negate : " + myBirth.negate());
	    System.out.println("abs : " + myBirth.abs());
	    System.out.println("gcd : " + myBirth.gcd(sisterBirth));
	            
	}
}