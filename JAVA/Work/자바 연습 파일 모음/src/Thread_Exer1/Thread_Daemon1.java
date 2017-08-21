package Thread_Exer1;

public class Thread_Daemon1 {

	public static void main(String[] args) {
		DaemonThread1 th1 = new DaemonThread1();
		Thread thread1 = new Thread(th1);
		thread1.setDaemon(true);
		thread1.start();
		
		try {
			thread1.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("데몬쓰레드 종료 ㄱㄱㄱㄱ");
	}

}


class DaemonThread1 implements Runnable {
	
	public void run() {
		while(true){
		System.out.println("데몬쓰레드 고고고고고고고고고");
		try {
			Thread.sleep(800);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
}
