package Thread_Exer1;

public class Thread_join1 {
	public static void main(String[] args) {
		Thread_join2 th1 = new Thread_join2();
		th1.start();
		System.out.println("시작");
		try {
			th1.join();   // join은 thread가 모두 실행될때까지 기다리라는 뜻
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("종료");
	}
}

class Thread_join2 extends Thread {
	public void run(){
		for(int i =0; i < 10; i++){
			System.out.println(i);
		}
	}
}
