package Thread_Exer1;

// 상속을 통한 Thread 연습


public class Thread_extends {
	public static void main(String[] args) {
		Thread_exer2 th1 = new Thread_exer2(2);
		Thread_exer2 th2 = new Thread_exer2(4);
		th1.start();
		th2.start();
		System.out.println("끝!!");
		
	}
}


class Thread_exer2 extends Thread {
	int aa1;
	Thread_exer2(int aa1){
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