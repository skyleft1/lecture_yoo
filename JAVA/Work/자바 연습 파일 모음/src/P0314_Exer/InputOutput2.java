package P0314_Exer;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class InputOutput2 {
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		FileInputStream aa1 = null;
		FileOutputStream bb2 = null;
		try {
			aa1 = new FileInputStream("src/P0314/Set_Get.java");
			bb2 = new FileOutputStream("byte3.txt");
			
			int readCount = -1;
			byte[] buffer = new byte[512];
			while((readCount = aa1.read(buffer)) != -1){
				bb2.write(buffer, 0, readCount);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				bb2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		long endTime = System.currentTimeMillis();
		System.out.println(endTime - startTime);
	}
}
// OS ������ 512 ����Ʈ ũ��� �������� ������ 512 �迭�� �۾��Ұ�� ȿ�����̴�.