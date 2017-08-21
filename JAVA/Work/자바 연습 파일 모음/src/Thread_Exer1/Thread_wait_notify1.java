package Thread_Exer1;

public class Thread_wait_notify1 {
	public static void main(String[] args) {
		Thread_wait_notify2 th1 = new Thread_wait_notify2();
		th1.start();
		System.out.println("Thread�� �Ϸ�ɶ����� ��ٷ���.");
		synchronized (th1) {
			try {
				th1.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Total = "+th1.total);
	}
}

class Thread_wait_notify2 extends Thread{
	int total;
	public void run(){
		synchronized (this) {
			for(int i=0; i<10; i++){
				System.out.println(i+"�� ���Ѵ�.");
				total += i;
				try {
					Thread.sleep(800);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}	
			notify();  //wait �Ǿ��� ���� �ٽ� �����Ű�� ��
		} 
	}
}
