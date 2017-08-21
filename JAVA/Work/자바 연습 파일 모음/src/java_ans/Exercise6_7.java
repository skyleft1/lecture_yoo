package java_ans;

class Exercise6_8 {
	int x; // 인스턴스 변수
	int y; // 인스턴스 변수
	Exercise6_8(int x, int y) {
	this.x = x;
	this.y = y;
	}
	double getDistance(int x1, int y1) {
	return Math.sqrt((x-x1)*(x-x1) + (y-y1)*(y-y1)); // x, y는 인스턴스 변수
	}
	}
class Exercise6_7 {
	public static void main(String args[]) {
		Exercise6_8 p = new Exercise6_8(1,1);
	// p와 (2,2)의 거리를 구한다.
	System.out.println(p.getDistance(2,2));
	}
	}