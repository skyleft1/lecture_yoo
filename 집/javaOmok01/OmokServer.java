package javaOmok01;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class OmokServer {
	public static void main(String[] args){
        //자동 close
        try{
        	ServerSocket serverSocket = new ServerSocket(9999);
            // 서버 초기화 , 접속

            System.out.println("준비 완료");
             
            //LISTEN 대기
            Socket clientSocket = serverSocket.accept();
            System.out.println("클라이언트 소켓 연결");
             
            //send,reciever 스트림 받아오기
            //자동 close
            try{
            	OutputStream sender = clientSocket.getOutputStream();
                InputStream reciever = clientSocket.getInputStream();
            
                //클라이언트로 hello world 메시지 보내기
                //11byte 데이터
                String message = "hello world";
                byte[] data = message.getBytes();
                sender.write(data, 0, data.length);
                 
                //클라이언트로부터 메시지 받기
                //2byte 데이터
                data = new byte[2];
                reciever.read(data, 0, data.length);
                 
                //수신 메시지 출력
                message = new String(data);
                String out = String.format("recieve - %s", message);
                System.out.println(out);
            }
            catch(Throwable e){
                e.printStackTrace();
            }
        }catch(Throwable e){
            e.printStackTrace();
        }
    }
}

