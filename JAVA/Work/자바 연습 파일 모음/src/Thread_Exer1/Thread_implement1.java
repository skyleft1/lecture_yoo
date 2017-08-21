package Thread_Exer1;

//�������̽��� ���� Thread ����


public class Thread_implement1 {
	public static void main(String[] args) {
		Thread_implement2 th1 = new Thread_implement2(2);
		Thread_implement2 th2 = new Thread_implement2(4);
		
		Thread thread1 = new Thread(th1);   
		Thread thread2 = new Thread(th2);
		// start�� ���� ���⿡ Thread Ŭ������ ���� �����ؾ���
		
		thread1.start();  //Thread ������ ������ start ��� ���� ��
		thread2.start();
		System.out.println("��!!");
		
	}
}


class Thread_implement2 implements Runnable {
	int aa1;
	Thread_implement2(int aa1){
		this.aa1 = aa1;
	}
	public void run(){
		for(int i =0; i < 10; i++){
			aa1 += i;
			System.out.println(aa1);
			try {
				Thread.sleep((int)(Math.random()*5000));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}