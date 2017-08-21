package Thread_Exe1;

class P0308_Comunication {
	public static void main(String[] args) {
		Transfer aa1 = new Transfer();
		Print aa2 = new Print();
		Middle bb1 = new Middle();
		aa1.save = bb1;
		aa2.save = bb1; //bb1.result 되는지 여부
		aa1.start();
		aa2.start();
	}
}
			
class Transfer extends Thread{
	Middle save;
	public void run(){
		int total = 0;
		for(int i =0; i < 10; i++){
			total += i;
		}
		Middle.result = total;
	}
}

class Print extends Thread{
	Middle save;
	public void run(){
		System.out.println(Middle.result);
	}
}
	
class Middle {
	static int result;
}
	
