package Java_Exercise;



class Circle extends Shape {
	void Circle(double r){
		
	}
	@Override
	double calcArea() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}


class Rectangle extends Shape {
	double width;
	double height;

	Rectangle(double width, double height){
		
	}
	@Override
	double calcArea() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	boolean isSquare() {
		if(���簢��)
	}	
}


abstract class Shape {
	Point p;
	Shape() {
		this(new Point(0,0));
}
	Shape(Point p) {
		this.p = p;
}
	abstract double calcArea(); // ������ ������ ����ؼ� ��ȯ�ϴ� �޼���
	
	Point getPosition() {
		return p;
	}
	void setPosition(Point p) {
		this.p = p;
	}
}

class Point {
	int x;
	int y;
	Point() {
		this(0,0);
}
	Point(int x, int y) {
		this.x=x;
		this.y=y;
}
	public String toString() {
		return "["+x+","+y+"]";
	}
}