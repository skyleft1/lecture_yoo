package Thread_Exe1;

public class P0308_Runable {
	public static void main(String[] args) {
		Thread aa1 = new Thread(new ExThread4());
		Thread aa2 = new Thread(new ExThread5());
		Thread aa3 = new Thread(new ExThread6());
		aa1.start();
		aa2.start();
		aa3.start();
	}
}
class ExThread4 extends Thread {
	public void run(){
		for(char alpa = 'A'; alpa <= 'Z' ; alpa++){
			System.out.println(alpa);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
	}
}
class ExThread5 extends Thread {
	public void run(){
		for(int num = 500; num < 510 ; num++){
			System.out.println(num);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
class ExThread6 extends Thread {
	public void run(){

		for(int num = 90; num < 100 ; num++){
			System.out.println(num);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}