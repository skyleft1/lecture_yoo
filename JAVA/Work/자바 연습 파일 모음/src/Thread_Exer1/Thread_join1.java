package Thread_Exer1;

public class Thread_join1 {
	public static void main(String[] args) {
		Thread_join2 th1 = new Thread_join2();
		th1.start();
		System.out.println("����");
		try {
			th1.join();   // join�� thread�� ��� ����ɶ����� ��ٸ���� ��
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("����");
	}
}

class Thread_join2 extends Thread {
	public void run(){
		for(int i =0; i < 10; i++){
			System.out.println(i);
		}
	}
}
