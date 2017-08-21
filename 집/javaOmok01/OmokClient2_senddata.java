package javaOmok01;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class OmokClient2_senddata {
	public static void main(String... args){
        //자동 close
        try{
        	Socket socket = new Socket("192.168.1.176", 9999);
            //클라이언트 초기화, 접속


            //자동 close
            try{
            	InputStream inputSteam = socket.getInputStream();
                DataInputStream datainputSteam = new DataInputStream(inputSteam);
                //서버로부터 데이터 받기
                //
                System.out.println("서버로부터 받은 메세지 : "+ datainputSteam.readUTF());
                System.out.println("연결 종료 중");
                
                //스트림과 소켓 닫는다.
                datainputSteam.close();
                socket.close();
                System.out.println("연결 종료");
            }
        	catch (Throwable e){
                e.printStackTrace();
            }
            
        } catch (Throwable e){
            e.printStackTrace();
        }
    }
}
