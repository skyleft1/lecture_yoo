package p0228;


public class Exercise2 {
	 int left, right;
     
	    public Calculator(){}
	     
	    public Calculator(int left, int right){
	        this.left = left;
	        this.right = right;
	    }
	     
	    public void setOprands(int left, int right) {
	        this.left = left;
	        this.right = right;
	    }
	 
	    public void sum() {
	        System.out.println(this.left + this.right);
	    }
	 
	    public void avg() {
	        System.out.println((this.left + this.right) / 2);
	    }
	}
	class SubstractionableCalculator extends CalculatorConstructorDemo5 {
	    public SubstractionableCalculator(int left, int right) {
	        super(left, right);
	    }
	 
	    public void substract() {
	        System.out.println(this.left - this.right);
	    }
	}
	 
	public class CalculatorConstructorDemo5 {
	    public static void main(String[] args) {
	        SubstractionableCalculator c1 = new SubstractionableCalculator(10, 20);
	        c1.sum();
	        c1.avg();
	        c1.substract();
	    }
	}