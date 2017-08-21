package network1;

import java.io.IOException;
import java.net.Socket;

public class Client {
	private Socket socket;
	
	public void connect(){
		try {
			socket = new Socket("192.168.1.176", 10002);
			System.out.println("접속완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

	}
}
