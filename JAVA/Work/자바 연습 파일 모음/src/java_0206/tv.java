package java_0206;

public interface tv {
	public int MIN_volume=0;
	public int MAX_volume=100;
	public void turnOn();
	public void turnOff();
	public void changeVolume(int volume);
	public void changeChannel(int c);
}
