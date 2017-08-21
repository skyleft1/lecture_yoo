package Thread_Exe1;

public class NewEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Give aa1 = new Give(4);
		Give aa2 = new Give(2);
		Thread bb1 = new Thread(aa1);
		Thread bb2 = new Thread(aa2);
		bb1.start();
		bb2.start();
	}
}



class Give implements Runnable {
	private int num1 = 0;
	Give(int num1) {
		this.num1 = num1;

	}


	public void run() {
		for(int i=0; i<10; i++){
			System.out.println("º¸¿©Áà" + num1);
			try {
				Thread.sleep(500);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}


