package P0314_Exer;

import java.io.*;

public class System_in_Char_InputOutput1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
// 키보드(System.in)로부터 입력받아 콘솔에 출력
		String line = null;
		try {
			line = br.readLine();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(line);
	}

}
