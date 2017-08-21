package p0223;

class Exercise7_10 {
	public static void main(String args[]) {
		MyTv2 t = new MyTv2();
		t.setChannel(10);
		System.out.println("CH:"+t.getChannel());
		t.setVolume(20);
		System.out.println("VOL:"+t.getVolume());
		t.setChannel(10);
		System.out.println("CH:"+t.getChannel());
		t.setChannel(20);
		System.out.println("CH:"+t.getChannel());
		t.gotoPrevChannel();
		System.out.println("CH:"+t.getChannel());
		t.gotoPrevChannel();
		System.out.println("CH:"+t.getChannel());
	}
}


class MyTv2 {
	private boolean isPowerOn;
	private int channel;
	private int volume;
	private int prevchannel;

	final int MAX_VOLUME = 100;
	final int MIN_VOLUME = 0;
	final int MAX_CHANNEL = 100;
	final int MIN_CHANNEL = 1;
	
	int getChannel(){
		return channel;
	}

	void setChannel(int channel){
		if(channel > MAX_CHANNEL || channel < MIN_CHANNEL)
			return;
		prevchannel = this.channel;
		this.channel = channel;
	}
	
	int getVolume(){
		return volume;
	}
	
	void setVolume(int volume){
		if(volume > MAX_VOLUME || volume < MIN_VOLUME)
			return;
		this.volume = volume;
	}
	
	void gotoPrevChannel(){
		setChannel(prevchannel);

		
	}
	
}
	
