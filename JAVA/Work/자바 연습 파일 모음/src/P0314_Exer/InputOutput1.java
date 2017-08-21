package P0314_Exer;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class InputOutput1 {
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		FileInputStream aa1 = null;
		FileOutputStream bb2 = null;
		try {
			aa1 = new FileInputStream("src/P0314/Set_Get.java");
			bb2 = new FileOutputStream("byte2.txt");
			
			int readData = -1;
			while((readData = aa1.read()) != -1){
				bb2.write(readData);
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