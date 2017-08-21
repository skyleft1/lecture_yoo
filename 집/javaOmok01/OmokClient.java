package javaOmok01;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class OmokClient {
	public static void main(String... args){
        //자동 close
        try{
        	Socket socket = new Socket("192.168.1.176", 9999);
            //클라이언트 초기화, 접속

             
            //send,reciever 스트림 받아오기
            //자동 close
            try{
            	OutputStream sender = socket.getOutputStream();
            
                InputStream receiver = socket.getInputStream();
                //서버로부터 데이터 받기
                //11byte
                byte[] data = new byte[11];
                receiver.read(data,0,11);
                 
                //수신메시지 출력
                String message = new String(data);
                String out = String.format("recieve - %s", message);
                System.out.println(out);
                 
                //서버로 데이터 보내기
                //2byte
                message = "OK";
                data = message.getBytes();
                sender.write(data, 0, data.length);
            }
        	catch (Throwable e){
                e.printStackTrace();
            }

        } catch (Throwable e){
            e.printStackTrace();
        }
    }
}
