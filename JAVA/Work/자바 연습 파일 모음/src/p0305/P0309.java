package p0305;

public class P0309 {
    public static void main(String[] args) {
    	Figure fi = new Figure(3, 5, 9);
    	fi.info();
    }
}

class Square {
	private int horizontal;
	private int vertical;
	private int area;

	Square(int h, int v){
		horizontal = h;
		vertical = v;
		area = horizontal * vertical;
	}
	void SquareHWE(){
		System.out.println("가로 : " + horizontal);
		System.out.println("세로 : " + vertical);
	}
	void SquareArea(){
		System.out.println("넓이 : " + area);
	}
	int getArea(){
		return area;		
	}
}

class Perfect {
	private int height;
	height = e;
	area = horizontal * vertical * height;
	System.out.println("높이: " + height);
}




class Figure {
	void 
	Figure(int horizontal, int vertical, int height){
		int a = horizontal;
		int b = vertical; 
		int c = height;
	}
	void info(){
		Square aa = new Square(a, b, c);
		aa.SquareHWE();
		aa.SquareArea();
	}
	
	}
}
