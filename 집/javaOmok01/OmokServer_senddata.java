package javaOmok01;

import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class OmokServer_senddata {
	public static void main(String[] args){
        //자동 close
        try{
        	ServerSocket serverSocket = new ServerSocket(9999);
            // 서버 초기화 , 접속

            System.out.println("준비 완료");
             
            //LISTEN 대기
            Socket Socket = serverSocket.accept();
            System.out.println("클라이언트 소켓 연결");
             
            //send,reciever 스트림 받아오기
            //자동 close
            try{
            	OutputStream outputSteam = Socket.getOutputStream();
                DataOutputStream dataOutputSteam = new DataOutputStream(outputSteam);
                // 소켓의 출력스트림을 얻음
                
                dataOutputSteam.writeUTF("서버로부터 테스트 메시지 ");
                System.out.println("메시지 전송완료");

                
                dataOutputSteam.close();
                Socket.close();
            }
            catch(Throwable e){
                e.printStackTrace();
            }
        
        }catch(Throwable e){
            e.printStackTrace();
        }
    }
}

