package Java_Exercise;

import java.util.*;

class Exercise8_8 {
	public static void main(String[] args) {
// 1~100������ ������ ���� �� answer�� �����Ѵ�.
		int answer = (int)(Math.random() * 100) + 1;
		int input = 0; // ������Է��� ������ ����
		int count = 0; // �õ�Ƚ���� ���� ���� ����
		do {
			count++;
			System.out.print("1�� 100������ ���� �Է��ϼ��� :");
			try{
			input = new Scanner(System.in).nextInt();
			}
			catch(Exception e){
				System.out.println("���ڷ����ٷ�?");
				continue;
			}
			if(answer > input) {
				System.out.println("�� ū ���� �Է��ϼ���.");
			} else if(answer < input) {
				System.out.println("�� ���� ���� �Է��ϼ���.");
			} else {
				System.out.println("������ϴ�.");
				System.out.println("�õ�Ƚ���� "+count+"���Դϴ�.");
				break; // do-while���� �����
			}
			
		} while(true); // ���ѹݺ���
	} // end of main
} // end of class HighLow