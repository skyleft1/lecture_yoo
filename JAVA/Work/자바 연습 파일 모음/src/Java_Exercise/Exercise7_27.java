package Java_Exercise;

class Exercise7_27 {
	public static void main(String args[]) {
		Outer o = new Outer();
		Outer.Inner inner= o.new Inner();
/*
(4) �˸��� �ڵ带 �־� �ϼ��Ͻÿ�.
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
	} // InnerŬ������ ��
} // OuterŬ������ ��