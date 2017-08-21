package Thread_Exer1;

//인터페이스를 통한 Thread 연습


public class Thread_implement1 {
	public static void main(String[] args) {
		Thread_implement2 th1 = new Thread_implement2(2);
		Thread_implement2 th2 = new Thread_implement2(4);
		
		Thread thread1 = new Thread(th1);   
		Thread thread2 = new Thread(th2);
		// start를 쓸수 없기에 Thread 클래스를 새로 선언해야함
		
		thread1.start();  //Thread 변수기 때문에 start 사용 가능 ㅋ
		thread2.start();
		System.out.println("끝!!");
		
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