package p0223;

public class Exercise7_18 {
	
	
	

	public static void main(String[] args) {
		Robot[] arr = { new DanceRobot(), new SingRobot(), new DrawRobot()};
		for(int i=0; i< arr.length;i++)
		action(arr[i]);
		} // main
		}

class Robot {}

class DanceRobot extends Robot {
	void dance() {
		System.out.println("���� ��ϴ�.");
		}
		}

class SingRobot extends Robot {
	void sing() {
		System.out.println("�뷡�� �մϴ�.");
		}
		}

class DrawRobot extends Robot {
	void draw() {
		System.out.println("�׸��� �׸��ϴ�.");
		}
		}