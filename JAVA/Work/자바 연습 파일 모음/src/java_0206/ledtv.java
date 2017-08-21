package java_0206;

public class ledtv implements tv {

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("ÄÑ´Ù");
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("²ô´Ù");
	}

	@Override
	public void changeVolume(int volume) {
		// TODO Auto-generated method stub
		System.out.println(volume);
	}

	@Override
	public void changeChannel(int c) {
		// TODO Auto-generated method stub
		System.out.println(c);
	}

}
