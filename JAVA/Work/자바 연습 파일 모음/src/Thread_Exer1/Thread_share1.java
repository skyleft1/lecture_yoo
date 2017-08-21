package Thread_Exer1;

public class Thread_share1 {
	public static void main(String[] args) {
		MusicBox box = new MusicBox();
		
		MusicPlayer p1 = new MusicPlayer(1, box);
		MusicPlayer p2 = new MusicPlayer(2, box);
		MusicPlayer p3 = new MusicPlayer(3, box);
		p1.start();
		p2.start();
		p3.start();
	}
}

class MusicBox {
	//synchronized 를 넣어줌으로써 순서대로 출력하게 댐
	public void playMusic1(){ 
		for(int i=0; i<10; i++){
			synchronized(this) {   // 부분 동기화(synchronized)
				System.out.println("신나는 음악");
			}
			try {
				Thread.sleep((int)(Math.random()*800));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public synchronized void playMusic2(){  // 메소드 전체 동기화
		for(int i=0; i<10; i++){
			System.out.println("좋은 음악");
			try {
				Thread.sleep((int)(Math.random()*800));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void playMusic3(){
		for(int i=0; i<10; i++){
			synchronized(this) {    // 부분 동기화(synchronized)
			System.out.println("진짜 후진 음악");
			}
			try {
				Thread.sleep((int)(Math.random()*800));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

class MusicPlayer extends Thread{
	int type;
	MusicBox musicbox;
	MusicPlayer(int type, MusicBox musicbox){
		this.type = type;
		this.musicbox = musicbox;
	}

	public void run(){
		switch(type){
		case 1:
			musicbox.playMusic1();
			break;
		case 2:
			musicbox.playMusic2();
			break;
		case 3:
			musicbox.playMusic3();
			break;
		}
	}
}