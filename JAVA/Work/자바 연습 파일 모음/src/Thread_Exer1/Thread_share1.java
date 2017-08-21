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
	//synchronized �� �־������ν� ������� ����ϰ� ��
	public void playMusic1(){ 
		for(int i=0; i<10; i++){
			synchronized(this) {   // �κ� ����ȭ(synchronized)
				System.out.println("�ų��� ����");
			}
			try {
				Thread.sleep((int)(Math.random()*800));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public synchronized void playMusic2(){  // �޼ҵ� ��ü ����ȭ
		for(int i=0; i<10; i++){
			System.out.println("���� ����");
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
			synchronized(this) {    // �κ� ����ȭ(synchronized)
			System.out.println("��¥ ���� ����");
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