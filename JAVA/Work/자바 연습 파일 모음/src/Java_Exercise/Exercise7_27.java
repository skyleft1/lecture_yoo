package Java_Exercise;

class Exercise7_27 {
	public static void main(String args[]) {
		Outer o = new Outer();
		Outer.Inner inner= o.new Inner();
/*
(4) 알맞은 코드를 넣어 완성하시오.
*/
		inner.method1();
	}
}


class Outer {
	int value=10;		
	class Inner {
		int value=20;
		void method1() {
		int value=30;
		System.out.println(value);
		System.out.println(this.value);
		System.out.println(Outer.this.value);
	}
	} // Inner클래스의 끝
} // Outer클래스의 끝