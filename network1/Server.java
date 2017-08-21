package network1;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

	private ServerSocket serverSocket;
	private Socket clientSocket;
	private DataInputStream dataInputStream;
	private DataOutputStream dataoutputStream;
	
	public void serverSetting(){
		try {
			serverSocket = new ServerSocket(10002);  // 생성과 바인딩
			// localhost, 10002
			clientSocket = serverSocket.accept();  // 어샙트
			System.out.println("클라이언트 소켓 연결");

		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	public void closeAll(){
		try {
			serverSocket.close();
			clientSocket.close();
			dataInputStream.close();
			dataoutputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void streamSetting(){
		try {
			dataInputStream = new DataInputStream(clientSocket.getInputStream());
			dataoutputStream = new DataOutputStream(clientSocket.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String dataReceive(){
		try {
			return dataInputStream.readUTF();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void sendData(String sendData){
		try {
			dataoutputStream.writeUTF(sendData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Server(){
		serverSetting();
		dataReceive();
		sendData("잘 받았다~");
		closeAll();
	}
	public static void main(String[] args) {
		new Server();
	}
}
