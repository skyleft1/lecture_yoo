package java_p;

class calculator2 {
	int one, two;

	public void sum(int one, int two) {
		System.out.println(one + two);
	}
	public void avg(int one, int two) {
		System.out.println((one + two)/2);
	}
}
	
public class calculatoruse1 {
	public static void main(String[] args) {
		calculator2 c1 = new calculator2();
		c1.one = 60;
		c1.two = 40;
	}
}


