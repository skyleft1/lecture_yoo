package Thread_Exe1;

class P0308_Account {
	public static void main(String[] args) {
		Transfer2 a1 = new Transfer2();
		Print2 a2 = new Print2();
		Cross2 b1 = new Cross2();
		
		a1.cross = b1;
		a2.cross = b1;
		a1.start();
		a2.start();
	}
}
	
class Transfer2 extends Thread {
	Cross2 cross;
	public void run() {
		for(int i=0; i< 5; i++){
			int tran = -100;
			Cross2.lee += tran;
		}
	}
}

class Print2 extends Thread {
	Cross2 cross;
	public void run() {
		System.out.println("ÀÌ¸ù·æ\n°èÁÂ = "+Cross2.lee);
		System.out.println("¼ºÃáÇâ°èÁÂ = "+Cross2.sung);
		
	}
}

class Cross2 {
	static int lee = 1000;
	static int sung = 2000;
}